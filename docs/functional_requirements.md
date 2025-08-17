# Functional Requirements for diagram_viewer Package

## Architecture Overview

The package implements a **Diagrammer-Controller architecture** where:
- **Diagrammer**: The rendering engine/widget, independent from diagram business logic
- **Controller**: The component that owns diagram business logic and drives the Diagrammer through commands

## Vector Space Management
- The package must internally manage the matrix that controls zoom and scroll (intended as the offset of the top-left corner) of the diagram. Data exchanged with the client must always be described in the vector space constituted by the original diagram coordinates.
- Zoom and scroll data must remain accessible and subscribable by the client.

## Event and Command System

### Physical Events (Diagrammer → Controller)
- The package must capture UI events (pointer, touch, wheel, keyboard) and enrich them with:
  - Logical coordinates (converted from screen coordinates)
  - Transform snapshot at the time of the event
  - Hit-test results (list of DiagramObjectEntity objects at the event location)
  - Border proximity information (configurable threshold)
  - Event phase (start, update, end)

### Platform-Agnostic Event Unification
- The package must unify similar physical input events from different platforms:
  - Mouse click/drag/release and touch start/move/end → same logical event sequence
  - Mouse wheel and touch pinch → single transformation event type
  - Double click and double tap → single repeated interaction event type

### Zoom Behavior Requirements
- The package must implement zoom behavior that maintains the focal point:
  - **Pinch-to-zoom**: The point between the user's fingers (focal point) must remain stationary in the viewport during zoom operations
  - **Mouse wheel zoom**: The point under the mouse cursor must remain stationary during zoom operations when the content is "large" (fills both axes). When the content is "small" on at least one axis, the focal is anchored to the viewport center for the duration of the wheel burst to preserve centering; upon becoming large, focal anchoring switches to the cursor.
  - **Keyboard zoom**: The center of the viewport must remain stationary during zoom operations
  - **Zoom constraints**: All zoom operations must respect minimum and maximum zoom limits while maintaining focal point stability. When at effective min/max, further wheel zooms are ignored (no spurious pan).
  - **Small-content centering during zoom**: When the diagram is smaller than the viewport on any axis, it must remain centered on those axes throughout interaction and during zoom bursts from min→max; the physical center drift of the logical center must remain < 1 px across the burst.

### Hit-Testing Responsibility
- The package must perform internal hit-testing:
  - Expose `hitTest(Point) → List<DiagramObjectEntity>` functionality
  - Handle computational costs of hit-testing internally
  - Include hit-test results in every physical event sent to the controller
  - Sort DiagramObjectEntity objects by z-order for proper hit-testing

### Command System (Controller → Diagrammer)
- The package must support commands from the controller:
  1. **ApplyDefaultPanZoom**: Execute default pan/zoom behavior for an event
  2. **SetTransform**: Apply specific transformation matrix
  3. **Redraw**: Update visualization with new DiagramObjectEntity list and logical extent
  4. **ElasticBounceBack**: Return to valid bounds with animation
  5. **AutoScrollStep**: Execute incremental scroll with specified velocity
  6. **StopAutoScroll**: Immediately stop any ongoing auto-scroll
  7. **ShowDragOverlay**: Show an optional ghost overlay at a given pointer position
  8. **UpdateDragOverlay**: Update the ghost overlay position
  9. **HideDragOverlay**: Hide the ghost overlay

### Event Flow and Control
- The package must:
  - Capture and enrich UI events with logical coordinates and hit-test results
  - Forward physical events to the controller via stream
  - Execute commands received from the controller
  - Maintain default behaviors for diagram manipulation (pan, zoom, etc.)
  - Execute default behaviors only when explicitly requested via commands

- The controller must:
  - Receive physical events with hit-test results
  - Decide whether to mutate the model or request default behavior
  - Send appropriate commands back to the package
  - Manage diagram business logic independently

## Diagram Space Management

### DiagramObjectEntity Management
- The package must:
  - Maintain a list of DiagramObjectEntity objects
  - Sort DiagramObjectEntity objects by z-order before painting
  - Provide a unified interface for objects to draw themselves
  - Handle the rendering pipeline with transformed canvas
  - Remain agnostic of object types (nodes, connections, etc.); objects are self-rendering and can leverage generic facilities

### Dynamic Diagram Boundaries
- The controller must:
  - Calculate and manage the logical diagram area based on content
  - Communicate logical dimensions to the package via commands
  - Include appropriate padding around content
  - Ensure boundaries are never smaller than configured minimum size (512x512)

- The package must:
  - Accept and respect boundaries provided by the controller
  - Use boundaries to constrain transformations and scrolling
  - Maintain configurable minimum view size
  - Automatically adjust minimum zoom on resize/orientation changes

### Auto-scrolling Behavior
- The controller must:
  - Orchestrate auto-scroll when objects approach diagram edges, using `borderProximity` provided in PhysicalEvents
  - Configure auto-scroll parameters (inverse speed vs. distance, curve/easing)
  - Send `AutoScrollStep` with a velocity vector and `StopAutoScroll` when leaving the edge threshold or on drag end

- The package must:
  - Execute auto-scroll commands with a periodic tick based on `DiagramConfiguration.autoScrollInterval`
  - Support configurable edge detection thresholds via `DiagramConfiguration.edgeThreshold`
  - Integrate velocity per tick and apply it via `TransformBloc`
  - During an active pointer drag, synthesize pointer updates post-frame to keep event flow coherent (`dragContinue` without physical pointer moves), preserving correlation via `eventId` and correct button bitmask
  - Stop immediately on `StopAutoScroll` or on any new user input

### In‑App Drag & Drop (Target)

- Scope and Platforms
  - The Diagrammer must act as an in‑app drag-and-drop target on Android, iOS, Web, macOS, Windows, and Linux.
  - Only in‑app DnD (within the Flutter application). Cross‑app OS‑level DnD is out of scope.

- Controller responsibilities (Source lives outside the Diagrammer)
  - Initiate a drag operation from external widgets within the same app, providing an `application/json` payload (schema owned by the controller).
  - Handle business rules during drag (accept/reject, allowed effects) and perform the final model update on drop.
  - Drive visual feedback via commands (cursor/effect where applicable, optional ghost overlay).

- Diagrammer responsibilities
  - Expose a drag target layer that emits continuous target events until drop/end.
  - Enrich DnD events with both screen and logical positions (global→local→logical mapping).
  - Execute controller commands for visual feedback (cursor/effect where supported, ghost overlay if enabled).

- Supported payloads
  - `application/json` from the controller; the Diagrammer treats the payload as opaque and forwards it.

- Physical Events (Diagrammer → Controller)
  - `DragTargetEnter(dataPreview, screenPosition, logicalPosition)`
  - `DragTargetOver(dataPreview, screenPosition, logicalPosition)`
  - `DragTargetLeave()`
  - `DragTargetDrop(data, screenPosition, logicalPosition)`

- Commands (Controller → Diagrammer)
  - `SetCursor(effect | notAllowed)` (desktop/web; no-op on mobile)
  - `ShowDragOverlay(ghostSpec, position)`
  - `UpdateDragOverlay(position)`
  - `HideDragOverlay()`

- Visual feedback and drop rules
  - The ghost overlay is rendered only when the drag feedback is inside the viewer target and the ghost would be fully visible within the viewport bounds in the current frame.
  - If, at drop time, the ghost would not be fully visible (e.g., cursor too close to edges), the drop operation is canceled and no object is added.
  - Positions used for ghost and drop are centered on the current pointer location (same center for feedback, ghost, and drop) and are accurate in both screen and logical coordinates.

- Acceptance criteria
  - Starting an in‑app drag from an external widget yields continuous Over events to the Diagrammer while hovering; releasing results in a Drop event carrying the original JSON.
  - Visual feedback (cursor/effect where supported, ghost overlay) updates within one frame after relevant commands.
  - Positions are accurate in both screen and logical coordinates.

### Snap Grid for Object Centers

- Objective
  - Provide an optional, configurable snap-to grid applied to the centers of diagram objects.

- Configuration (DiagramConfiguration)
  - `snapGridEnabled: bool` (default false)
  - `snapGridSpacing: double` (logical units; default 16.0)
  - `snapGridOrigin: Offset` (logical origin for grid alignment; default `Offset.zero`)
  - `showSnapGrid: bool` (visualization of grid; default false)

- Responsibilities
  - Controller:
    - Enables/disables snapping and adjusts grid parameters at runtime.
    - Decides policy for quando usare lo snapping fornito dal package (e.g., su drag preview vs. solo su drop) applicandolo al modello.
  - Diagrammer:
    - Exposes configuration and helper mapping utilities in logical space.
    - Computes and includes `snappedLogicalPosition` in drag events (`dragContinue`/`dragEnd`) e nei DnD target events (`dragTargetOver`/`dragTargetDrop`) quando `snapGridEnabled` è true; il controller può usare o ignorare questo valore.
    - Optionally renders a lightweight grid overlay when `showSnapGrid` is true and aligns the DnD ghost to the snapped position when enabled.

- Behavior
  - Snapping operates in logical coordinates; the snapped position is computed by projecting the logical center to the nearest grid node defined by `snapGridOrigin` and `snapGridSpacing`.
  - When enabled, the package computes snapped positions and exposes them in events; the controller applies them to the model according to its policy sia:
    - in tempo reale durante il drag di oggetti esistenti (usando l’hint `snappedLogicalPosition`), e
    - al momento del drop per inserimenti DnD (usando l’hint `snappedLogicalPosition`).
  - The controller may optionally provide a preview (e.g., ghost/marker) aligned to the snapped center during drag.
  - Grid visualization (if enabled) respects current transform (zoom/pan) with pixel-density-aware thinning to avoid overdraw.

- Acceptance criteria
  - With snapping enabled, a drag movement of an existing object updates its center in real time to the nearest grid node; a drop results in the center aligned to the nearest grid node in logical space.
  - With snapping disabled, behavior is unchanged from free placement.
  - Toggling snapping and changing spacing/origin at runtime takes effect within one frame.
  - Optional grid overlay appears/disappears within one frame when toggled.

### Inertial Scrolling
## Connections (Client-defined Entities)

- Scope
  - Connections are self-rendering objects defined by the controller, just like nodes. The viewer does not provide predefined visual styles for connections.

- Responsibilities
  - Controller:
    - Defines the connection objects, their endpoints (anchors in logical space), and visual policies (shape, style, labels, z-order).
    - Optionally exposes anchors/ports on nodes to be used by connections.
  - Diagrammer (package):
    - Invokes `paint` on connection objects and provides generic rendering facilities usable by any object:
      - Local canvas rotation around a pivot to simplify drawing at arbitrary angles
      - Text-on-path helpers (position at t∈[0,1] and tangent-aligned orientation)
      - Path end trimming against other objects' clip paths
      - Generic path hit-testing utilities (point-to-path distance with tolerance)

- Optional Interfaces
  - `ClipPathProvider`: objects can expose a `logicalClipPath` used by other objects (e.g., connections) for trimming/clipping purposes.
  - `AnchorProvider` (optional, future): objects can expose logical anchor points/ports for consistent connections.

- Acceptance Criteria
  - Connections render correctly across arbitrary orientations using local rotation helpers without altering global viewer transform.
  - Labels remain aligned with the connection's local tangent using text-on-path utilities.
  - When trimming is requested, connection endpoints are visually clipped against the target/source objects' clip paths, avoiding overlap on node bodies.
  - The system maintains 60 FPS for typical scenarios with multiple connections.

- Objective: When a pan ends with sufficient velocity, scrolling must continue with inertia in the same direction, progressively slowing down due to friction until it stops or hits bounds.
- Trigger:
  - Pointer drag end on empty area with velocity above a configurable threshold.
  - (Optional, future) Aggregated velocity from repeated directional key presses.
- Initial velocity estimation:
  - Compute initial velocity v0 = (vx0, vy0) from the last ~50–100 ms of pointer deltas.
  - Activate only when |v0| >= `minInertialVelocity` (configurable).
- Motion model:
  - Per-frame integration (~16 ms) with velocity decay: v(t+Δt) = v(t) * exp(-k * Δt), where k is derived from `inertialFriction`.
  - Position update: p(t+Δt) = p(t) + v(t) * Δt.
  - Maximum duration: `maxInertialDuration` (configurable) to avoid very long runs.
  - Stop when |v(t)| < `minStopVelocity`.
- Bounds and overscroll:
  - While inertia is active, apply dynamic capping with elastic window (same behavior as active pan).
  - When inertia ends and transform is outside strict bounds, trigger bounce-back using `bounceDuration` and `bounceCurve`.
- Axis independence:
  - Inertia is applied per-axis; one axis may stop earlier or hit bounds while the other continues.
- Cancellation:
  - Inertia stops immediately upon new user input (pointer down, pinch/zoom, key), or when `StopAutoScroll` command is received.
  - Any `SetTransform`/`ApplyDefaultPanZoom` interrupts inertia.
- Configuration (DiagramConfiguration):
  - `enableInertialScrolling: bool` (default true)
  - `inertialFriction: double` (friction coefficient)
  - `minInertialVelocity: double` (px/s)
  - `minStopVelocity: double` (px/s)
  - `maxInertialDuration: Duration`
  - Reuse: `overscrollPixels`, `bounceDuration`, `bounceCurve`.
- Acceptance criteria:
  - After a fast pan end with |v0| >= threshold, translation continues in the same direction and slows according to friction, stopping within `maxInertialDuration` or when |v| < `minStopVelocity`.
  - Inertia respects bounds with elastic window and ends with bounce-back if needed.
  - Any new input interrupts inertia within one frame (≤16 ms).
  - Per-axis behavior is preserved.

## Interaction State Management

### Gesture Concurrency Rules
- **Scale beats Pan**: Multi-touch gestures prioritize scale over pan
- **Object-Drag overrides View-Pan**: When objects are hit, object dragging takes priority
- **LongPress activates LassoSelecting**: In empty areas, long press activates selection mode
- **Modifier keys rewire Scroll**: Ctrl/Cmd + scroll = zoom instead of pan

### Interaction States
- **Idle**: No active interaction
- **Panning**: Viewport pan in progress
- **Zooming**: Zoom operation in progress
- **ObjectDragging**: Object manipulation in progress

### State Management Requirements
- The package must implement a semaphore system to ensure stable interactions
- Once an interaction starts, all subsequent events must be handled directly by the viewer until the interaction ends
- This prevents other operations from interfering with active interactions
- Limits must be reapplied at interaction end

## Zoom Constraints and Elastic Behavior

### Zoom Limits
- **Configurable Limits**: minZoom and maxZoom from DiagramConfiguration
- **Dynamic Min Zoom**: Calculated to ensure entire diagram is visible
- **Minimum Size**: 512x512 minimum diagram size even if empty
- **Continuous Enforcement**: Limits must be enforced on initial load, window resize, diagram area changes, and user interactions

### Elastic Overscroll
- **Pan Overscroll**: Allow temporary panning beyond diagram bounds (150px)
- **Zoom Overscroll**: Allow temporary zooming beyond min/max limits during active interaction
- **Bounce-back Animation**: Smooth animation back to valid limits when interaction ends
- **Background Visibility**: Show background when over-bounds to indicate overscroll

### Zoom Blocking
- When at effective zoom limits (considering dynamic min = max(config.minZoom, scaleToFit)), further wheel/pinch zoom events must be blocked; no translation side-effects must be introduced.
- Overscroll state allows temporary zooming beyond limits
- Bounce-back animation returns to strict limits after interaction ends

## Auto-Centering Behavior

### Centering Requirements
- When the diagram does not occupy the full width or height of the available space, the offset in that direction must be set to ensure the diagram remains centered
- This shows an equal amount of background on both sides
- Centering must be applied during transform capping operations
- Centering must be preserved when applying translation limits
- During zoom from a "small" state, the logical center must remain aligned with the viewport center for the duration of a wheel burst; once content becomes large on both axes, zoom focal switches to cursor and center anchoring is released.

## Performance Requirements

### Rendering Performance
- **60 FPS Target**: ≤ 16ms per frame for smooth interactions
- **Optimized Rendering**: Apply Transform2D once to Canvas instead of per object
- **Efficient Hit-Testing**: Spatial indexing for large diagrams (hundreds to thousands of objects)
- **Memory Management**: Proper stream disposal and BLoC lifecycle

### Communication Optimization
- **Viewport Sharing**: Include current viewport in PhysicalEvents for efficient object filtering
- **Reduced Data Transfer**: Minimize object list passing during redraw operations
- **Event Throttling**: Throttle high-frequency events to maintain performance budget

## Accessibility and Input Diversity

### Input Support
- **Keyboard**: Full keyboard navigation and shortcuts
- **Touch**: Multi-touch gestures and touch-optimized interactions
- **Mouse**: Mouse wheel zoom, drag operations, and context menus
- **Trackpad**: Pinch-to-zoom and multi-finger gestures
- **Screen Reader**: Best-effort accessibility support

### Debuggability and Testability
- The package must optionally enable BLoC transition logging when `enableBlocDebugObserver` is true in `DiagramConfiguration`.
- A `TestableDiagramViewer` widget must expose internal BLoCs for tests via an optional `onBlocsCreated` callback.

### Cross-Platform Consistency
- **Unified Events**: Same logical events across all platforms
- **Platform-Specific Optimizations**: Optimize for each platform's input methods
- **Gesture Mapping**: Consistent gesture behavior across platforms

### Standard Input Mapping and Equivalences

- Baseline equivalences (controller may override or extend):
  - Panning:
    - Desktop/Web: left-drag on empty area; Trackpad: two-finger drag; Touch: one-finger drag.
  - Zooming:
    - Desktop/Web: wheel + Ctrl/Cmd for zoom about cursor; Trackpad: pinch gesture; Touch: pinch-to-zoom.
  - Selection/Tap:
    - Desktop/Web: left-click; Touch: tap; Long-press can map to context-specific actions.
  - Multi-select modifier:
    - Desktop/Web: Shift/Ctrl; Mobile: secondary finger + drag or long-press + drag (controller-defined).
  - Context actions:
    - Desktop/Web: right-click/context menu key; Mobile: long-press.

- Generalization rules
  - Viewer provides unified PhysicalEvents; the controller defines the policy mapping PhysicalEvents to domain actions per platform.
  - A standard set of equivalences must be honored by default across desktop, mobile, and trackpad, with controller-level overrides allowed.
  - Platform-specific edge cases (e.g., Magic Mouse momentum, OS gesture conflicts) must not break the baseline mapping and can be handled by controller policy.

## Testing Requirements

### Test-Driven Development
- Write failing tests first to demonstrate problems
- Implement code to make tests pass
- Refactor while maintaining test coverage

### Test Categories
- **Unit Tests**: Individual component behavior
- **Integration Tests**: BLoC communication and event flow
- **Widget Tests**: UI interaction and rendering
- **Performance Tests**: 60 FPS requirement validation
- **Cross-Platform Tests**: Ensure consistent behavior across platforms

## Extensibility Requirements

### Controller Independence
- Different diagram types (ERD, Genogram, STD) must use the same Diagrammer
- Controllers must be implementable without modifying the package
- Clear interfaces must be defined for controller implementation

### Event System Extensibility
- Extensible event types for custom interactions
- Support for custom event enrichment
- Plugin architecture for custom event handlers

### Command System Extensibility
- Extensible command types for custom behaviors
- Support for custom command execution
- Plugin architecture for custom commands

### Object System Extensibility
- Unified interface for custom diagram objects
- Support for custom rendering and hit-testing
- Plugin architecture for custom object types
