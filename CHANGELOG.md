# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).



## [1.1.0] - 2022-11-29

### Added

- CHANGELOG.md.
- Support for HEIF image formats (`image/heic` and `image/heif`) has been added. See https://mimetype.io/image/heic and https://mimetype.io/image/heif for an explanation of the types.
- Attribute for photos: `subject`.
- When sending an express link, the express link URL will be returned as `expressLinkUrl`.

### Changed

- Referenced the GitHub repo from within the OpenAPI spec (useful to get to the CHANGELOG.md).
- Renamed "SendExpressLink..." to "CreateExpressLink..." (no URLs have changed)



## [1.0.0] - 2022-10-18

### Added

- Initial revision.



[1.0.1]: https://github.com/fiasco-gmbh/openapi/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/fiasco-gmbh/openapi/releases/tag/1.0.0
