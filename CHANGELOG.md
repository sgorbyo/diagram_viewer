# Changelog

## [Unreleased]

### Added
- Autoscroll (beta):
  - Controller-driven orchestration using `borderProximity` metadata
  - Viewer executes `AutoScrollStep` via timer; immediate `StopAutoScroll` support
  - Known: one widget E2E test is temporarily skipped while stabilizing timer-driven flows
- Border proximity: computation enabled in `EventManagementBloc` and propagated to drag events
- Docs: Updated architecture, technical design, and functional requirements for autoscroll contract and border proximity

## 0.0.1

Initial release of the diagram_viewer package.

### Features

* Interactive diagram viewing with pan, zoom, and rotation support
* Custom painter-based rendering for optimal performance
* Background and content layer separation
* Boundary control with inertial scrolling
* Configurable gesture controls (translation, scaling, rotation)
* Cross-platform support
