# Changelog

## [Unreleased]

### Added
- Autoscroll (beta):
  - Controller-driven orchestration using `borderProximity` metadata
  - Viewer executes `AutoScrollStep` via timer; immediate `StopAutoScroll` support
  - E2E widget autoscroll test stabilized and enabled
- Border proximity: computation enabled in `EventManagementBloc` and propagated to drag events
- Docs: Updated architecture, technical design, and functional requirements for autoscroll contract and border proximity
 - In‑App Drag & Drop (Target):
   - Added DnD target events (enter/over/leave/drop) with screen and logical positions
   - Added ghost overlay commands (show/update/hide) and technical notes on global→local→logical mapping
    - Ghost overlay rendered only when drag feedback is over the viewer and the ghost is fully visible within viewport bounds; drop is canceled if ghost is not fully visible at release time
    - Option A alignment: feedback, ghost, and drop are centered on the pointer with zero offset for pixel-accurate positioning
    - Viewer background clarified: grey outside logical diagram extent; white inside the diagram area for clear visual distinction
  - Snap Grid (planned):
    - Configurable snap-to grid for object centers in logical space (`snapGridEnabled`, `snapGridSpacing`, `snapGridOrigin`, `showSnapGrid`)
    - Controller-driven policy for preview and drop snapping
  - Standard Input Mapping (baseline):
    - Documented cross-platform equivalences for pan/zoom/select/context actions; controller can override per domain

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
