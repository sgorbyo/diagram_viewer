# Changelog

## [Unreleased]

### Added
- Autoscroll (beta):
  - Controller-driven orchestration using `borderProximity` metadata
  - Viewer executes `AutoScrollStep` via timer; immediate `StopAutoScroll` support
  - E2E widget autoscroll test stabilized and enabled
- Border proximity: computation enabled in `EventManagementBloc` and propagated to drag events
- Docs: Updated architecture, technical design, and functional requirements for autoscroll contract and border proximity

### Changed
- Removed temporary debug logs from runtime code; kept optional `DebugBlocObserver` behind configuration

## 0.0.1

Initial release of the diagram_viewer package.

### Features

* Interactive diagram viewing with pan, zoom, and rotation support
* Custom painter-based rendering for optimal performance
* Background and content layer separation
* Boundary control with inertial scrolling
* Configurable gesture controls (translation, scaling, rotation)
* Cross-platform support
