.DEFAULT_GOAL := help

# Inspired by https://gist.github.com/ernstki/75bba9e99a85bf273e8ec0f17dba6cfe

SPEC_FILE="openapi/fiasco-spec.json"
CHANGELOG_FILE="CHANGELOG.md"

# Retrieves the version from the OpenAPI spec.
SPEC_VERSION=$(shell jq -r '.info.version' ${SPEC_FILE})

# Finds the first version header in the changelog (format "## [x.y.z]")
CHANGELOG_VERSION=$(shell grep -Eo '\#\# \[.*\]' ${CHANGELOG_FILE} | head -n 1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')

# Get the latest tag from git.
GIT_VERSION=$(shell git describe --tags --abbrev=0 | awk -F .   '{OFS="."; print}')

VERSIONS_EQUAL=$(shell [[ "${SPEC_VERSION}" = "${CHANGELOG_VERSION}" && \
                          "$(SPEC_VERSION)" = "${GIT_VERSION}" ]] \
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

.PHONY: release
release: ## Creates a new release by tagging the current commit and pushing it to GitHub (the version in the spec and changelog must be equal).
# If SPEC_VERSION, CHANGELOG_VERSION, and GIT_VERSION are equal
ifeq ("${SPEC_VERSION}","${CHANGELOG_VERSION}")
	@$(call log,"Tagging new release as ${SPEC_VERSION} ...")
	@git tag -a ${SPEC_VERSION} -m "Release ${SPEC_VERSION}" || $(call log_fatal,"Failed to tag new release.")
	@$(call log,"Pushing code and tag ...")
	@git push && git push --tags || $(call log_fatal,"Failed to push code and tag.")
	@$(call log,"Release ${SPEC_VERSION} is now online.")
else
	@$(call log_error,"Version mismatch.")
	@$(call log_error,"  spec ----------\> ${SPEC_VERSION}")
	@$(call log_error,"  changelog -----\> ${CHANGELOG_VERSION}")
	exit 1
endif

.PHONY: versions
versions: ## Shows the current versions of spec, changelog, and git.
	@$(call log_success,"Versions:")
	@$(call log,"  spec ----------\> ${SPEC_VERSION}")
	@$(call log,"  changelog -----\> ${CHANGELOG_VERSION}")
	@$(call log,"  git -----------\> ${GIT_VERSION}")
