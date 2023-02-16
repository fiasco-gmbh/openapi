# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.3.1] - 2023-02-16

### Removed

- Removed an errenously added webhook from `POST /api/v1/calculations/{calculationId}/send`. This should not have been there and was never supported.


## [2.3.0] - 2023-02-14

### Changed

- Changed events for the calculation requests webhook.
- Added `calculationDV90` to the webhook payload for calculation requests.


## [2.2.2] - 2023-02-10

### Changed

- Added `image/webp` as a supported image type.
- Added `damagesToExclude` to calculation requests.


## [2.2.1] - 2023-01-12

### Changed

- Updated URLs for creating calculation requests, creating express links, and sending calculations via AudaNet. The old URLs will be kept for backwards-compatibility.


## [2.2.0] - 2023-01-02

### Added

- New schema `VehicleDamagesToConsider` (allows specification of parts and damages to be considered for calculation, acts as a filter after detecting damages in photos).


## [2.1.0] - 2023-01-02

### Added

- Finished calculations can be send to AudaNet or email recipients (`POST "/api/v1/calculation/{calculationId}/send"`).


## [2.0.0] - 2023-01-02

### Added

- Vehicle data can be provided when creating express links. This can be used to pre-fill data that would otherwise be asked from the end user.
- Results of calculations can be send to email recipient (via `"calculationEmailRecipient"`).

### Changed

- **breaking** An authorization token is required via `Authorization` header (in the form of a bearer token) instead of its own `Token` header.
- Updated descriptions and formats for some fields to provide for better validation methods.
- **breaking** Changed the name of the property `"content_type"` to `"contentType"`.
- **breaking** Fixed spelling of the word `"success"` (was sometimes spelled as `"sucess"`).
- **possibly breaking** Removed the `"billed"` property everywhere.
- **breaking** Renamed the property `"audaNetRecipient"` to `"calculationAudaNetRecipient"`.
- **breaking** Renamed the property `"calculationId"` to `"calculationRequestId"` (schema `CreateCalculationRequestSuccessResponse`).


## [1.1.2] - 2022-12-20

### Added

- Added new enum values to the `calculationRequestCreated` callback:
  - `"calculationReady"`
  - `"calculationFailed"`

### Changed

- Changed URLs
  - `/api/v1/calculationRequest` -> `/api/v1/calculation_request`
  - `/api/v1/expressLink` -> `/api/v1/express_link`


## [1.1.1] - 2022-11-29

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



[2.3.1]: https://github.com/fiasco-gmbh/openapi/compare/2.3.0...2.3.1
[2.3.0]: https://github.com/fiasco-gmbh/openapi/compare/2.2.2...2.3.0
[2.2.2]: https://github.com/fiasco-gmbh/openapi/compare/2.2.1...2.2.2
[2.2.1]: https://github.com/fiasco-gmbh/openapi/compare/2.2.0...2.2.1
[2.2.0]: https://github.com/fiasco-gmbh/openapi/compare/2.1.0...2.2.0
[2.1.0]: https://github.com/fiasco-gmbh/openapi/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/fiasco-gmbh/openapi/compare/1.1.2...2.0.0
[1.1.2]: https://github.com/fiasco-gmbh/openapi/compare/1.1.1...1.1.2
[1.1.1]: https://github.com/fiasco-gmbh/openapi/compare/1.0.0...1.1.1
[1.0.0]: https://github.com/fiasco-gmbh/openapi/releases/tag/1.0.0
