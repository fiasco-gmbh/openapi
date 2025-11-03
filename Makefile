.DEFAULT_GOAL := help

# Inspired by https://gist.github.com/ernstki/75bba9e99a85bf273e8ec0f17dba6cfe

SPEC1_FILE="openapi/fiasco-spec.yaml"
SPEC2_FILE="openapi/fiasco-axc-spec.yaml"
CHANGELOG_FILE="CHANGELOG.md"

# Retrieves the version from the OpenAPI spec.
SPEC1_VERSION=$(shell yq -r '.info.version' ${SPEC1_FILE})
SPEC2_VERSION=$(shell yq -r '.info.version' ${SPEC2_FILE})

# Finds the first version header in the changelog (format "## [x.y.z]")
CHANGELOG_VERSION=$(shell grep -Eo '\#\# \[.*\]' ${CHANGELOG_FILE} | head -n 1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')

# Get the latest tag from git.
GIT_VERSION=$(shell git describe --tags --abbrev=0 | awk -F .   '{OFS="."; print}')

VERSIONS_EQUAL=$(shell [[ "${SPEC1_VERSION}" = "${CHANGELOG_VERSION}" && \
                          "$(SPEC1_VERSION)" = "${SPEC2_VERSION}" ]] \
                          && printf "true" || printf "false")

VERSIONS_WITH_GIT_EQUAL=$(shell [[ "${SPEC1_VERSION}" = "${CHANGELOG_VERSION}" && \
                          "$(SPEC1_VERSION)" = "${SPEC2_VERSION}" && \
                          "$(SPEC1_VERSION)" = "${GIT_VERSION}" ]] \
                          && printf "true" || printf "false")

# Another way to use variables: https://pawamoy.github.io/posts/pass-makefile-args-as-typed-in-command-line/
args = $(foreach a,$($(subst -,_,$1)_args),$(if $(value $a),--$a="$($a)"))

# ANSI terminal colors (see 'man tput') and
# https://linuxtidbits.wordpress.com/2008/08/11/output-color-on-bash-scripts/
#
# Don't use color if there isn't a $TERM environment variable:
ifneq ($(strip $(TERM)),)
	BOLD=$(shell tput bold)
	RED=$(shell tput setaf 1)
	GREEN=$(shell tput setaf 2)
	BLUE=$(shell tput setaf 4)
	MAGENTA=$(shell tput setaf 5)
	UL=$(shell tput sgr 0 1)
	RESET=$(shell tput sgr0 )
endif

# Colorful console output.
log = (echo "$1")
log_success = (echo "${GREEN}>> $1${RESET}")
log_error = (>&2 echo "${RED}>> ${BOLD}$1${RESET}")
log_fatal = (>&2 echo "${RED}>> ${BOLD}$1${RESET}" && exit 1)

# This will output the help for each task thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html.
# See also: https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# 'sed -i' is not part of the POSIX standard, so it's different for macOS/BSD
ifeq ($(shell uname -s | grep -qiE '(darwin|bsd)'; echo $$?),0)
	@SED_INPLACE="sed -i ''"
else
	@SED_INPLACE="sed -i"
endif

.PHONY: changelog
changelog: ## Opens the changelog and a list of latest commits in vim.
	@git log `git describe --tags --abbrev=0`..HEAD --oneline | awk 'BEGIN { print "Commits since last tag:" }; {print "- " $$0}' | vim - -R +"vs CHANGELOG.md" +"set noro"

.PHONY: release
release: ## Creates a new release by tagging the current commit and pushing it to GitHub (the version in the spec and changelog must be equal).
# If SPEC VERSIONS and CHANGELOG_VERSION are equal, create a new tag and push it to GitHub.
ifeq ("${VERSIONS_EQUAL}","true")
	@$(call log,"Tagging new release as ${SPEC1_VERSION} ...")
	@git tag -a ${SPEC1_VERSION} -m "Release ${SPEC1_VERSION}" || $(call log_fatal,"Failed to tag new release.")
	@$(call log,"Pushing code and tag ...")
	@git push && git push --tags || $(call log_fatal,"Failed to push code and tag.")
	@$(call log,"Release ${SPEC1_VERSION} is now online.")
else
	@$(call log_error,"Version mismatch.")
	@$(call log_error,"  api spec ------\> ${SPEC1_VERSION}")
	@$(call log_error,"  axc api spec --\> ${SPEC2_VERSION}")
	@$(call log_error,"  changelog -----\> ${CHANGELOG_VERSION}")
	@$(call log_error,"  git -----------\> ${GIT_VERSION}")
	exit 1
endif

.PHONY: versions
versions: ## Shows the current versions of spec, changelog, and git.
ifeq ("${VERSIONS_WITH_GIT_EQUAL}","true")
	@$(call log_success,"Versions:")
	@$(call log,"  api spec ------\> ${SPEC1_VERSION}")
	@$(call log,"  axc api spec --\> ${SPEC2_VERSION}")
	@$(call log,"  changelog -----\> ${CHANGELOG_VERSION}")
	@$(call log,"  git -----------\> ${GIT_VERSION}")
else
	@$(call log_error,"Version mismatch:")
	@$(call log_error,"  api spec ------\> ${SPEC1_VERSION}")
	@$(call log_error,"  axc api spec --\> ${SPEC2_VERSION}")
	@$(call log_error,"  changelog -----\> ${CHANGELOG_VERSION}")
	@$(call log_error,"  git -----------\> ${GIT_VERSION}")
	exit 1
endif

.PHONY: docs
docs: ## Generate HTML documentation from OpenAPI specs.
	@echo "Generating documentation ..."
	@mkdir -p docs
	@echo "  fiasco-spec.yaml -> docs/fiasco-api/"
	@openapi-generator-cli generate -i ${SPEC1_FILE} -g html2 -o docs/fiasco-api/ > /dev/null 2>&1
	@echo "  fiasco-axc-spec.yaml -> docs/fiasco-axc-api/"
	@openapi-generator-cli generate -i ${SPEC2_FILE} -g html2 -o docs/fiasco-axc-api/ > /dev/null 2>&1
	@echo "${GREEN}>> Documentation generated in docs/ directory${RESET}"
