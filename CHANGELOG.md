# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.7.0] - 2024-06-28

### Added

- Added a new required field `configurationName` to express link requests.


## [2.6.6] - 2024-06-28

### Added

- Added support for "TIFF" images to calculation requests.
- Added spec for requesting express links with branding.

### Changed

- Deprecated `damagesToConsider` and `damagesToExclude`.


## [2.6.5] - 2024-04-04

### Added

- Added more items to the list of possible photo subjects (`body_dirt`, `glass_dirt`, `interior_dirt`).


## [2.6.4] - 2024-02-23

### Added

- Added more items to the list of possible photo subjects.


## [2.6.3] - 2024-02-02

### Added

- AXC API: Operation to accept a task.


## [2.6.2] - 2024-02-02

### Changed

- Changed the new maximum length for field `referenceId` to 160 characters (previously unspecified).
- Switch back to OpenAPI version 3.0.2 (the VSCode plugin does not support previews with 3.1.0).

### Added

- Introduction of our "AXC API" (Audatex Connector).


## [2.6.1] - 2023-10-17

### Changed

- Switch the OpenAPI version from 3.0.1 to 3.1.0.


## [2.6.0] - 2023-08-03

### Added

- Added more image subjects: `dashboard`, `vehicle_front`, `windshield`, `glass_sticker`.
- Added `crack_defect` to the list of supported damage types.
- Added support for `JPEG-XL`.


## [2.5.0] - 2023-06-02

### Added

- Added `paintMaterialVw` to the list of calculation parameters.

### Changed

- Fixed a word describing the HTTP header used to hold the authorization token (`"Authentication" --> "Authorization"`).
- Corrected documentation about Audatex block codes regarding relative surcharge for replacement parts.

## [2.4.0] - 2023-04-11

### Added

- Added `registration_paper` to the list of possible values for the `subject` field of a photo.

### Removed

- Removed `image/heif` from the list of supported image formats.


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



[2.7.0]: https://github.com/fiasco-gmbh/openapi/compare/2.6.6...2.7.0
[2.6.6]: https://github.com/fiasco-gmbh/openapi/compare/2.6.5...2.6.6
[2.6.5]: https://github.com/fiasco-gmbh/openapi/compare/2.6.4...2.6.5
[2.6.4]: https://github.com/fiasco-gmbh/openapi/compare/2.6.3...2.6.4
[2.6.3]: https://github.com/fiasco-gmbh/openapi/compare/2.6.2...2.6.3
[2.6.2]: https://github.com/fiasco-gmbh/openapi/compare/2.6.1...2.6.2
[2.6.1]: https://github.com/fiasco-gmbh/openapi/compare/2.6.0...2.6.1
[2.6.0]: https://github.com/fiasco-gmbh/openapi/compare/2.5.0...2.6.0
[2.5.0]: https://github.com/fiasco-gmbh/openapi/compare/2.4.0...2.5.0
[2.4.0]: https://github.com/fiasco-gmbh/openapi/compare/2.3.1...2.4.0
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
