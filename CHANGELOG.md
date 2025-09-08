# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.5] - 2025-09-08

### Added
- Automatic comma thousands separator formatting for numbers >=1000 in calculator input and result display.

### Changed
- N/A

### Fixed
- Note preview stretching issue in notes list by limiting content display to 3 lines with ellipsis overflow.
- Calculator error when continuing operations (e.g., appending operator or number after =) by unformatting result before concatenation for accurate parsing.

## [0.2.4] - 2025-08-20

### Added
- Added bottom modal sheet for delete confirmation

### Changed
- Updated empty state 
- updated bottom navbar better ui

### Fixed
- Minor bug fixes

## [0.1.4] - 2025-08-15

### Added
- N/A

### Changed
- Enhanced UX on Calculator

### Fixed
- Minor bug fixes

## [0.1.3] - 2025-07-11

### Added
- Bug fixes and performance improvements
- Enhanced UI/UX experience

### Changed
- Updated dependencies

### Fixed
- Minor bug fixes

## [0.1.2] - 2025

### Added
- Todo management with GetX state management
- Notes app with rich text editing
- Calculator with scientific functions
- Multilingual support (English & Indonesian)
- Dark/Light theme switching
- Persistent storage with GetStorage

### Changed
- Initial release of the application

### Fixed
- N/A 