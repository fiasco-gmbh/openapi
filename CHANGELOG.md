# Change Log

All notable changes to this project will be documented in this file.

The format is based on [keep a change log][keep-a-changelog],
and this project tries to adhere to [semantic versioning][semver-spec].

## [3.6.0] - 2025-03-31

### Added

- Added new fields to calculation results:
  - `totalPriceWithTax`
  - `totalPriceLabor`
  - `totalPricePaint`
  - `totalPriceParts`
  - `totalPriceAdditional`


## [3.5.6] - 2025-03-28

### Added

- Added `paintAllAssemblyPartsDismounted` to `CalculationParameters` schema.


## [3.5.5] - 2025-03-14

### Changed

- Migrated both specs to OpenAPI 3.1.1.


## [3.5.4] - 2025-03-10

### Added

- Added `resetErrorMemory` to the `CreateCalculationRequestBody` schema.

### Removed

- Removed `orientation` from `HailDamagePartRepair` schema. Orientation will now
  be inferred by part and vehicle model.
- Removed `aluminium` from `repairTechniques` in `HailDamagePartRepair` schema.
  Material will now be inferred by part and vehicle model.


## [3.5.3] - 2025-02-28

### Added

- Added `callbackUrl` to the `CreateCalculationRequestBody` schema.


## [3.5.2] - 2025-02-26

### Changed

- Corrected maximum value for `paintMaterialPercentage` and
  `smallPartsPercentage` in `CalculationParameters` schema.


## [3.5.1] - 2025-02-25

### Added

- Added `prePressEnabled` to the `standard_positions` schema.


## [3.5.0] - 2025-02-17

### Added

- Added new fields to the `standard_positions` schema: `numberOfDents`,
  `dentSize`, `dentOrienation`, `prePressCount`,
  `surchargeForAluminumParts`, `surchargeForGlueing`,
  `surchargeForFinishingSteps`.


## [3.4.5] - 2025-01-21

### Added

- Corrected allowed values for `repairMethodOptimizationMethods`.


## [3.4.4] - 2024-12-10

### Added

- Added `repairMethodOptimizationMethods`.


## [3.4.3] - 2024-12-03

### Added

- Added `totalPrice`, `totalPriceWithTax`, `totalTax`, and `taxRates` to the 
  `CalculationRequestResultBody` schema.

### Changed

- Fixed VSX ⇒ VXS typo wherever it occurred. This also concerns the switch from
  `calculationVSX` to `calculationVXS`.


## [3.4.2] - 2024-11-08

### Added

- Added `requestReceived` and `vinLookupError` events to calculation.


## [3.4.1] - 2024-11-06

### Added

- Added support for specifying custom webhook auth tokens per calculation or
  express link request.


## [3.4.0] - 2024-10-29

### Added

- Added a route to update `CalculationRequest` with hail damages.
- Added a route to retrieve "FIASCO parts" that apply to the vehicle in a
  calculation.
- Added `colorMatchingAllowed` to the `CalculationParameters` schema.
- Added `requestReceived` to the webhook payload for `expressLinkCompleted`.


## [3.3.5] - 2024-10-21

### Added

- Added `photos` to the `CreateCalculationRequestSuccessResponse` schema.


## [3.3.4] - 2024-10-02

### Added

- Added `doCalculate` to the `CreateExpressLinkRequestBody` schema.


## [3.3.3] - 2024-09-08

### Changed

- Remove up-to-now unsupported field `logoUrl` from the documentation.


## [3.3.2] - 2024-09-04

### Changed

- For specifying labor rates, the field `laborRatesZipCode` has been deprecated
  in favor of a new field `laborRatesArea`.


## [3.3.1] - 2024-09-04

### Changed

- If given, the minimum value for specific labor rates must be `0.01`. This
  change might break some implementations, but should not have a real impact.


## [3.3.0] - 2024-08-19

### Changed

- **Breaking** Updated the generation of express links.


## [3.2.1] - 2024-07-25

Although this versions contains a breaking change, it is considered a minor
change. The field that was renamed has not been in production use, yet.

### Changed

- **Breaking** Renamed `repairInsteadOfReplaceThreshold` to
  `optimizedRepairMethodThreshold`.


## [3.2.0] - 2024-07-24

### Added

- Added `allowRepairMethodOptimization`.
- Added `repairInsteadOfReplaceThreshold`.
- Added fields to the callback payload when calculation processing is done:
  `calculationVSX` and `calculationPDF`.
- Added a route to get a list of all "FIASCO parts" supported.


## [3.1.2] - 2024-07-17

### Changed

- Clarification re. limits and intervals for fields `numberOfDents` and
  `avgDentSize`.


## [3.1.1] - 2024-07-17

### Changed

- `repairTechniques` can be empty or not set.


## [3.1.0] - 2024-07-17

### Added

- Added the field `billTo` to the schema `RequestMetaData`.

### Changed

- **Breaking** Renamed a possible value for the field `calculationType`
  (`hail damage` ⇒ `hail_damage`).
- **Breaking** Renamed field `parts` to `hailDamages`.
- **Breaking** Require fields `numberOfDents` and `avgDentSize` for hail-damaged
  parts and change their minimum values.
- More detailed schemas for hail-damaged parts (some fields are only required in
  case the repair method is `repair`).


## [3.0.0] - 2024-07-07

### Added

- Added support for hail damage requests.
- Added support for specifying the calculation provider to be used for each
  request.

### Changed

- Reorganized the spec file and renamed schemas.
- Fixed minor spelling mistakes.


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

- Added more items to the list of possible photo subjects (`body_dirt`,
  `glass_dirt`, `interior_dirt`).


## [2.6.4] - 2024-02-23

### Added

- Added more items to the list of possible photo subjects.


## [2.6.3] - 2024-02-02

### Added

- AXC API: Operation to accept a task.


## [2.6.2] - 2024-02-02

### Changed

- Changed the new maximum length for field `referenceId` to 160 characters
  (previously unspecified).
- Switch back to OpenAPI version 3.0.2 (the VSCode plugin does not support
  previews with 3.1.0).

### Added

- Introduction of our "AXC API" (Audatex Connector).


## [2.6.1] - 2023-10-17

### Changed

- Switch the OpenAPI version from 3.0.1 to 3.1.0.


## [2.6.0] - 2023-08-03

### Added

- Added more image subjects: `dashboard`, `vehicle_front`, `windshield`,
  `glass_sticker`.
- Added `crack_defect` to the list of supported damage types.
- Added support for `JPEG-XL`.


## [2.5.0] - 2023-06-02

### Added

- Added `paintMaterialVw` to the list of calculation parameters.

### Changed

- Fixed a word describing the HTTP header used to hold the authorization token
  (`"Authentication" --> "Authorization"`).
- Corrected documentation about Audatex block codes regarding relative surcharge
  for replacement parts.

## [2.4.0] - 2023-04-11

### Added

- Added `registration_paper` to the list of possible values for the `subject`
  field of a photo.

### Removed

- Removed `image/heif` from the list of supported image formats.


## [2.3.1] - 2023-02-16

### Removed

- Removed an erroneously added webhook from
  `POST /api/v1/calculations/{calculationId}/send`. This should not have been
  there and was never supported.


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

- Updated URLs for creating calculation requests, creating express links, and
  sending calculations via AudaNet. The old URLs will be kept for
  backwards-compatibility.


## [2.2.0] - 2023-01-02

### Added

- New schema `VehicleDamagesToConsider` (allows specification of parts and
  damages to be considered for calculation, acts as a filter after detecting
  damages in photos).


## [2.1.0] - 2023-01-02

### Added

- Finished calculations can be sent to AudaNet or email recipients
  (`POST "/api/v1/calculation/{calculationId}/send"`).


## [2.0.0] - 2023-01-02

### Added

- Vehicle data can be provided when creating express links. This can be used to
  pre-fill data that would otherwise be asked from the end user.
- Results of calculations can be sent to email recipient (via
  `"calculationEmailRecipient"`).

### Changed

- **Breaking** An authorization token is required via `Authorization` header (in
  the form of a bearer token) instead of its own `Token` header.
- Updated descriptions and formats for some fields to provide for better
  validation methods.
- **Breaking** Changed the name of the property `"content_type"` to
  `"contentType"`.
- **Breaking** Fixed spelling of the word `"success"` (was sometimes spelled as
  `"sucess"`).
- **Possibly Breaking** Removed the `"billed"` property everywhere.
- **Breaking** Renamed the property `"audaNetRecipient"` to `"calculationAudaNetRecipient"`.
- **Breaking** Renamed the property `"calculationId"` to
  `"calculationRequestId"` (schema `CreateCalculationRequestSuccessResponse`).


## [1.1.2] - 2022-12-20

### Added

- Added new enum values to the `calculationRequestCreated` callback:
  - `"calculationReady"`
  - `"calculationFailed"`

### Changed

- Changed URLs
  - `/api/v1/calculationRequest` ⇒ `/api/v1/calculation_request`
  - `/api/v1/expressLink` ⇒ `/api/v1/express_link`


## [1.1.1] - 2022-11-29

### Added

- CHANGELOG.md.
- Support for HEIF image formats (`image/heic` and `image/heif`) has been added.
  See https://mimetype.io/image/heic and https://mimetype.io/image/heif for an
  explanation of the types.
- Attribute for photos: `subject`.
- When sending an express link, the express link URL will be returned as
  `expressLinkUrl`.

### Changed

- Referenced the GitHub repo from within the OpenAPI spec (useful to get to the
  CHANGELOG.md).
- Renamed `SendExpressLink...` to `CreateExpressLink...` (no URLs have changed).



## [1.0.0] - 2022-10-18

### Added

- Initial revision.


[3.5.6]: https://github.com/fiasco-gmbh/openapi/compare/3.5.5...3.5.6
[3.5.5]: https://github.com/fiasco-gmbh/openapi/compare/3.5.4...3.5.5
[3.5.4]: https://github.com/fiasco-gmbh/openapi/compare/3.5.3...3.5.4
[3.5.3]: https://github.com/fiasco-gmbh/openapi/compare/3.5.2...3.5.3
[3.5.2]: https://github.com/fiasco-gmbh/openapi/compare/3.5.1...3.5.2
[3.5.1]: https://github.com/fiasco-gmbh/openapi/compare/3.5.0...3.5.1
[3.5.0]: https://github.com/fiasco-gmbh/openapi/compare/3.4.5...3.5.0
[3.4.5]: https://github.com/fiasco-gmbh/openapi/compare/3.4.4...3.4.5
[3.4.4]: https://github.com/fiasco-gmbh/openapi/compare/3.4.3...3.4.4
[3.4.3]: https://github.com/fiasco-gmbh/openapi/compare/3.4.2...3.4.3
[3.4.2]: https://github.com/fiasco-gmbh/openapi/compare/3.4.1...3.4.2
[3.4.1]: https://github.com/fiasco-gmbh/openapi/compare/3.4.0...3.4.1
[3.4.0]: https://github.com/fiasco-gmbh/openapi/compare/3.3.5...3.4.0
[3.3.5]: https://github.com/fiasco-gmbh/openapi/compare/3.3.4...3.3.5
[3.3.4]: https://github.com/fiasco-gmbh/openapi/compare/3.3.3...3.3.4
[3.3.3]: https://github.com/fiasco-gmbh/openapi/compare/3.3.2...3.3.3
[3.3.2]: https://github.com/fiasco-gmbh/openapi/compare/3.3.1...3.3.2
[3.3.1]: https://github.com/fiasco-gmbh/openapi/compare/3.3.0...3.3.1
[3.3.0]: https://github.com/fiasco-gmbh/openapi/compare/3.2.1...3.3.0
[3.2.1]: https://github.com/fiasco-gmbh/openapi/compare/3.2.0...3.2.1
[3.2.0]: https://github.com/fiasco-gmbh/openapi/compare/3.1.2...3.2.0
[3.1.2]: https://github.com/fiasco-gmbh/openapi/compare/3.1.1...3.1.2
[3.1.1]: https://github.com/fiasco-gmbh/openapi/compare/3.1.0...3.1.1
[3.1.0]: https://github.com/fiasco-gmbh/openapi/compare/3.0.0...3.1.0
[3.0.0]: https://github.com/fiasco-gmbh/openapi/compare/2.7.0...3.0.0
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


[keep-a-changelog]: https://keepachangelog.com/en/1.0.0/
[semver-spec]: https://semver.org/spec/v2.0.0.html
