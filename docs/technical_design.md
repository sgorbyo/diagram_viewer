# Technical Design

## Overview

This document outlines the technical implementation strategy for the `diagram_viewer` package, focusing on the Diagrammer-Controller architecture, event system, and component responsibilities.

## Architecture Components

### EventManagementBloc

The `EventManagementBloc` is a critical component that manages complex event states and isolation:

#### **Purpose**
- Manages interaction state isolation (pointer, gesture, keyboard)
- Enforces event type isolation rules
- Handles debouncing and timing
- Enriches events with context (hit-testing, modifier keys)
- Provides PhysicalEvent stream to controller

#### **Key Features**
- **Event Isolation**: Only one interaction type active at a time
- **Debouncing**: 16ms debounce time for ~60 FPS performance
- **State Management**: Tracks active interactions and modifier keys
- **Event Enrichment**: Adds hit-testing results and context

#### **States**
```dart
@freezed
class EventManagementState with _$EventManagementState {
  const factory EventManagementState.idle() = IdleState;
  const factory EventManagementState.pointerActive({...}) = PointerActiveState;
  const factory EventManagementState.gestureActive({...}) = GestureActiveState;
  const factory EventManagementState.keyboardActive({...}) = KeyboardActiveState;
}
```

#### **Events**
```dart
@freezed
class EventManagementEvent with _$EventManagementEvent {
  const factory EventManagementEvent.startPointerEvent({...}) = StartPointerEvent;
  const factory EventManagementEvent.updatePointerEvent({...}) = UpdatePointerEvent;
  const factory EventManagementEvent.endPointerEvent({...}) = EndPointerEvent;
  const factory EventManagementEvent.startGestureEvent({...}) = StartGestureEvent;
  const factory EventManagementEvent.updateGestureEvent({...}) = UpdateGestureEvent;
  const factory EventManagementEvent.endGestureEvent({...}) = EndGestureEvent;
  const factory EventManagementEvent.startKeyboardEvent({...}) = StartKeyboardEvent;
  const factory EventManagementEvent.updateModifierKeys({...}) = UpdateModifierKeys;
  const factory EventManagementEvent.resetState() = ResetState;
}
```

#### **Integration**
- Used by `DiagramViewerContent` for event routing
- Provides `Stream<PhysicalEvent>` for controller communication
- Manages event isolation and state transitions

### Widget Architecture

The package uses a clean widget architecture:

#### **DiagramViewer**
- Main entry point widget
- Sets up BLoC providers
- Manages widget lifecycle
- Located in `lib/widgets/diagram_viewer.dart`

##### Testable Variant
- `TestableDiagramViewer` exposes internal BLoCs via `onBlocsCreated` for testing
- Useful for asserting transform/zoom/pan behavior in integration tests

#### **DiagramViewerContent**
- Handles UI event capture and routing
- Manages PhysicalEvent enrichment
- Communicates with controller
- Located in `lib/widgets/diagram_viewer_content.dart`

#### **DiagramPainter**
- Custom painter for diagram rendering
- Applies transformations and draws objects
- Located in `lib/widgets/diagram_painter.dart`
 - Remains agnostic of object types; invokes each object's `paint` method. Complex visuals (e.g., connections) are implemented by the objects themselves using provided facilities.

### PhysicalEvent Enhancement
### Rendering Facilities (Generic)

- Purpose: Provide reusable helpers any object can use during `paint`, keeping the viewer generic and object types self-rendered.

- Canvas utilities
  - `withRotationAt(pivot, angle, draw)`: temporarily rotate the canvas around a logical pivot, run `draw`, then restore. Allows drawing horizontal primitives that appear diagonal.

- Text on path
  - Compute point at parametric position t∈[0,1] along a `Path` using `PathMetric`, retrieve tangent angle, and draw text with `TextPainter` rotated to align with the tangent.

- Path trimming / clipping
  - Given a path and optional start/end clip paths (from objects implementing `ClipPathProvider`), compute trimmed endpoints so the rendered connection visually starts/ends at object borders.

- Hit-testing helpers
  - Compute point-to-path distance with tolerance to support interaction on connection-like objects.

- Optional object interfaces
  - `ClipPathProvider { Path get logicalClipPath; }`: objects expose their logical clip shape for other objects to consume.
  - (Future) `AnchorProvider`: objects expose logical anchors/ports.

The `PhysicalEvent` system has been enhanced with new fields:

#### **New Fields**
- `pressedMouseButtons`: Set of currently pressed mouse buttons
- `pressedKeys`: Set of currently pressed keyboard keys  
- `activeInteraction`: Type of active interaction (if any)
- `hitResults`: Ordered list of hit objects with distance information
- `borderProximity`: Includes normalized distance and qualitative helpers for edge behaviors

##### Screen position extraction (pointer/touch/trackpad)
- Pointer events: screen position comes from `PointerEvent.position`.
- Gesture (pinch/trackpad) events: screen position comes from `Scale*Details.focalPoint` during start/update.
- Gesture end has no reliable focal point; a neutral `Offset.zero` is used unless additional state is introduced.
### In‑App Drag & Drop (Target) – Technical Notes

- Architecture
  - A top overlay `DragTarget` layer is added inside `DiagramViewerContent` spanning the viewport.
  - While hovering/dragging, events map global/screen offsets to logical via `RenderBox.globalToLocal` → `Transform2D.physicalToLogical`.
  - New PhysicalEvent union cases carry DnD enter/over/leave/drop with positions and data previews.

- Event Isolation
  - DnD target events coexist with pointer/gesture events; isolation rules remain intact (DnD does not hijack ongoing gestures by default).

- Ghost Overlay (optional)
  - Implemented as a lightweight overlay widget controlled by commands: `ShowDragOverlay`, `UpdateDragOverlay`, `HideDragOverlay`.
  - Overlay positions are tracked in local (viewer) coordinates for accurate placement.
  - No system cursor on mobile (cursor-related commands would be no-op there).
  - The overlay is rendered only if the drag feedback is inside the target AND the ghost would be fully visible inside the viewport in the current frame. This avoids edge-clamping visual shifts on entry.
  - On drop, if the ghost would not be fully visible, the drop operation is canceled; no new object is added. This guarantees visual and logical consistency at the borders.
  - With the current configuration (Option A), feedback, ghost, and drop share the same center (pointer), yielding pixel-accurate alignment across screen and logical coordinates.

- Controller Contract
  - Controller starts the in‑app DnD (source) and supplies `application/json` payload (opaque to the Diagrammer).
  - The Diagrammer forwards previews and final data; the Controller decides effects and updates the model on drop.

- Configuration (future)
  - `enableInAppDnD: bool` (default true)
  - `dragGhostOpacity: double` (default 0.8)
  - `dragCursorBehavior: enum { system, custom, none }`

Border Proximity details:
- Computed in `EventManagementBloc` using `viewportSize` and `DiagramConfiguration.edgeThreshold`.
- Provides flags for the four edges, raw distance, and a normalized distance (0 near edge → 1 far outside threshold).
- Injected into `dragContinue` events via `metadata['borderProximity']`.

#### **Event Isolation Rule**
- Only one interaction type (pointer, gesture, keyboard) can be active at a time
- Modifier keys update the current event state, don't create new events
- Global keyboard events handled by application, not DiagramViewer

#### **HitTestResult**
```dart
@freezed
class HitTestResult with _$HitTestResult {
  const factory HitTestResult({
    required DiagramObjectEntity object,
    required double distanceFromCenter,
    required Offset hitPoint,
  }) = _HitTestResult;
}
```

### BLoC Architecture

The package uses multiple BLoCs for different responsibilities:

#### **TransformBloc** 
- Manages overall Transform2D state
- Coordinates between ZoomBloc and PanBloc
- Handles transform capping and limits
- Supports freeze during drag to allow elastic window, with deferred bounce-back
- Provides `bounceBack(Duration)` animation using configurable `bounceCurve`

#### **ZoomBloc** 
- Handles zoom operations (mouse wheel, pinch)
- Manages elastic zoom and bounce-back
- Enforces zoom limits and overscroll behavior

#### **PanBloc**
- Handles pan operations (drag, keyboard)
- Manages auto-centering logic
- Enforces pan limits and bounds

#### **AutoScroll (current implementation)**
- Orchestration lives in the example controller based on `borderProximity`.
- Execution is encapsulated by an internal `AutoScrollService` used by `DiagramViewerContent`, which runs a timer-driven loop at `autoScrollInterval` integrating `velocity * dt` and dispatching pan deltas to `TransformBloc`.
- During autoscroll and while a pointer drag is active, `DiagramViewerContent` synthesizes a `PointerMoveEvent` post-frame using the last local pointer position and current transform, mapping pressed buttons to the Flutter bitmask and recomputing hit-testing; this is forwarded as `EventManagementEvent.updatePointerEvent` to produce `PhysicalEvent.pointer(update)`.
- The `DiagramEventTranslator` uses `eventId` as the correlation key and emits `dragContinue` when there is raw delta or logical delta (due to transform changes), or when cumulative distance > 0.5 px, or duration > 100 ms.
- Immediate stop on `StopAutoScroll` or any new user input (pointer/gesture/keyboard) via the service.
- Widget-level TDD tests validate drag-sync during autoscroll.

#### **EventManagementBloc**
- Manages complex event states and isolation
- Enriches events with context and hit-testing
- Provides PhysicalEvent stream to controller

### DiagramObjectEntity Interface

The `DiagramObjectEntity` interface provides a unified contract for all diagram objects:

```dart
abstract class DiagramObjectEntity extends Equatable {
  /// Logical bounds of the object in diagram coordinates
  Rect get logicalBounds;
  
  /// Center point of the object in diagram coordinates
  Offset get center;
  
  /// Z-order for painting and hit-testing (higher values paint on top)
  int get zOrder;
  
  /// Paint the object on the provided canvas
  void paint(Canvas canvas);
  
  /// Check if the object contains the given logical point
  bool contains(Offset logicalPoint);
  
  /// Get the object's unique identifier
  String get id;
  
  /// Check if the object is visible
  bool get isVisible;
  
  /// Check if the object is interactive
  bool get isInteractive;
}
```

#### **Key Features**
- **Self-measurement**: `logicalBounds` provides the object's bounding rectangle
- **Center calculation**: `center` provides the logical center point (defaults to `logicalBounds.center`)
- **Self-rendering**: `paint` method handles all drawing operations
- **Hit-testing**: `contains` method for interaction detection
- **Identity**: `id` provides unique identification
- **Layering**: `zOrder` determines rendering order
- **Visibility**: `isVisible` controls object visibility
- **Interaction**: `isInteractive` controls interaction capability

## Event Flow

### **1. Event Capture**
```dart
// DiagramViewerContent captures UI events
onPointerDown: (event) => _handlePointerDown(context, event)
```

### **2. Event Enrichment**
```dart
// Perform hit-testing and convert coordinates
final hitResults = _performHitTesting(event.position, currentTransform);
final logicalPosition = currentTransform.physicalToLogical(event.position);
```

### **3. Event Management**
```dart
// Send to EventManagementBloc for state management
eventBloc.add(EventManagementEvent.startPointerEvent(
  rawEvent: event,
  logicalPosition: logicalPosition,
  hitResults: hitResults,
));
```

### **4. PhysicalEvent Generation**
```dart
// EventManagementBloc generates enriched PhysicalEvent
_emitPhysicalEvent(PhysicalEvent.pointer(
  eventId: eventId,
  logicalPosition: logicalPosition,
  hitResults: hitResults,
  pressedMouseButtons: _extractMouseButtons(rawEvent),
  pressedKeys: _getCurrentPressedKeys(),
  activeInteraction: InteractionType.pointer,
));
```

### **5. Controller Communication**
```dart
// Controller receives PhysicalEvent and decides action
controller.handlePhysicalEvent(physicalEvent);
```

## Implementation Details

### **Event Isolation Logic**
```dart
bool canStartNewEvent(InteractionType eventType) {
  final currentState = state;
  
  // If no active interaction, always OK
  if (currentState is IdleState) return true;
  
  // If same type of event, always OK
  if (_getCurrentInteractionType() == eventType) return true;
  
  // If enough time has passed, OK
  if (_lastEventTime != null && 
      DateTime.now().difference(_lastEventTime!) > _debounceTime) {
    return true;
  }
  
  return false; // Block different event type
}
```

### **Hit-Testing Implementation**
```dart
List<HitTestResult> _performHitTesting(Offset screenPosition, Transform2D transform) {
  final logicalPosition = transform.physicalToLogical(screenPosition);
  final results = <HitTestResult>[];
  
  for (final object in controller.objects) {
    if (object.isVisible && object.contains(logicalPosition)) {
      final center = object.logicalBounds.center;
      final distance = (logicalPosition - center).distance;
      
      results.add(HitTestResult(
        object: object,
        distanceFromCenter: distance,
        hitPoint: logicalPosition,
      ));
    }
  }
  
  // Sort by distance from center (closest first)
  results.sort((a, b) => a.distanceFromCenter.compareTo(b.distanceFromCenter));
  
  return results;
}
```

### **Modifier Key Handling**
```dart
void _handleUpdateModifierKeys(Set<LogicalKeyboardKey> keys, Emitter<EventManagementState> emit) {
  final currentState = state;
  
  // Update state based on current interaction type
  if (currentState is PointerActiveState) {
    emit(currentState.copyWith(pressedKeys: keys));
    
    // Emit updated pointer event (NOT new keyboard event)
    _emitPhysicalEvent(PhysicalEvent.pointer(...));
  }
  // Don't create separate keyboard events
}
```

## Grid Overlay Thinning Optimizations

The `DiagramPainter` implements sophisticated grid overlay thinning optimizations to maintain performance across different zoom levels and diagram sizes.

### **Adaptive Grid Density**

The grid automatically adjusts its density based on zoom level to maintain visual clarity and performance:

```dart
double? _calculateAdaptiveGridSpacing(double baseSpacing) {
  if (!configuration.enableAdaptiveGridDensity) {
    return baseSpacing;
  }

  // Start with base spacing and increase it until we meet density requirements
  double currentSpacing = baseSpacing;
  int iterations = 0;
  const maxIterations = 10; // Prevent infinite loops

  while (iterations < maxIterations) {
    final pixelSpacing = currentSpacing * transform.scale;
    
    // Check if spacing meets minimum pixel requirements
    if (pixelSpacing >= configuration.minGridLinePixelSpacing) {
      return currentSpacing;
    }
    
    // Double the spacing for next iteration
    currentSpacing *= 2.0;
    iterations++;
  }

  // If we can't achieve reasonable spacing, return null to skip rendering
  return null;
}
```

**Key Features:**
- **Zoom-aware spacing**: Automatically increases grid spacing at high zoom levels
- **Minimum pixel spacing**: Ensures grid lines are never too close together on screen
- **Graceful degradation**: Skips grid rendering when it becomes impractical
- **Configurable thresholds**: `minGridLinePixelSpacing` controls the minimum visual spacing

### **Grid Line Count Limits**

To prevent performance issues with large diagrams, the system enforces maximum line counts:

```dart
_GridLines _calculateVisibleGridLines(Rect extent, Offset origin, double spacing) {
  final verticalLines = <double>[];
  final horizontalLines = <double>[];

  // Calculate visible grid lines
  // ... calculation logic ...

  // Apply maximum line count limit for performance
  if (verticalLines.length + horizontalLines.length > configuration.maxGridLines) {
    // Reduce density by increasing spacing
    final totalLines = verticalLines.length + horizontalLines.length;
    final reductionFactor = (totalLines / configuration.maxGridLines).ceil().toDouble();
    final newSpacing = spacing * reductionFactor;
    
    // Recursively calculate with new spacing
    return _calculateVisibleGridLines(extent, origin, newSpacing);
  }

  return _GridLines(
    verticalLines: verticalLines,
    horizontalLines: horizontalLines,
  );
}
```

**Performance Benefits:**
- **Bounded rendering time**: Maximum line count prevents excessive rendering
- **Adaptive spacing**: Automatically increases spacing to meet line count limits
- **Recursive optimization**: Continues optimizing until limits are met
- **Configurable limits**: `maxGridLines` controls the performance threshold

### **Configuration Options**

The grid thinning system provides several configuration options:

```dart
class DiagramConfiguration {
  /// Whether to enable adaptive grid line density based on zoom level
  @Default(true) bool enableAdaptiveGridDensity,
  
  /// Minimum grid line spacing in pixels for adaptive density
  @Default(8.0) double minGridLinePixelSpacing,
  
  /// Maximum number of grid lines to render for performance
  @Default(200) int maxGridLines,
}
```

**Configuration Strategies:**
- **Performance-focused**: High `maxGridLines`, low `minGridLinePixelSpacing`
- **Visual clarity**: Low `maxGridLines`, high `minGridLinePixelSpacing`
- **Balanced**: Default values optimized for most use cases

### **Performance Characteristics**

The grid thinning optimizations provide consistent performance across:

- **Zoom levels**: 0.1x to 1000x+ without performance degradation
- **Diagram sizes**: Small diagrams to very large extents
- **Grid densities**: From sparse to very dense grid configurations
- **Device capabilities**: Works efficiently on all device types

**Benchmark Results:**
- **Consistent rendering time**: <100ms for most diagram sizes
- **Zoom level stability**: Performance varies by <5x across zoom levels
- **Scalability**: Performance scales linearly with diagram area
- **Memory efficiency**: Minimal memory allocation during rendering

## Performance Considerations

### **60 FPS Target**
- Debounce time: 16ms for ~60 FPS
- Efficient hit-testing with early termination
- Optimized event routing and state management

### **Memory Management**
- Proper stream disposal in BLoC lifecycle
- Efficient event enrichment without unnecessary allocations
- Smart object filtering based on viewport

### **Rendering Optimization**
- Transform2D applied once to Canvas
- Z-order sorting for proper layering
- Viewport-based object filtering

## Testing Strategy

### **EventManagementBloc Tests**
- Unit tests for state transitions
- Event isolation rule verification
- Debouncing behavior validation
- PhysicalEvent generation tests

### **Integration Tests**
- End-to-end event flow testing
- Controller communication verification
- Performance benchmarks
- Cross-platform compatibility tests

## Extensibility

### **New Event Types**
- Extend `EventManagementEvent` with new event types
- Add corresponding state handling
- Update isolation rules as needed

### **Custom Hit-Testing**
- Override `_performHitTesting` for custom logic
- Implement spatial indexing for large diagrams
- Add object-specific hit-testing rules

### **Controller Integration**
- Implement `IDiagramController` interface
- Handle PhysicalEvents and emit DiagramCommands
- Add custom business logic and state management

## Configuration Reference

Example configuration:

```dart
final config = DiagramConfiguration(
  backgroundColor: Colors.white,
  edgeThreshold: 50.0,
  minZoom: 0.1,
  maxZoom: 10.0,
  overscrollPixels: 100.0,
  bounceDuration: Duration(milliseconds: 300),
  bounceCurve: Curves.easeOutCubic,
  autoScrollInterval: Duration(milliseconds: 16), // ~60 FPS
  autoScrollAcceleration: 1.5,
  enableInertialScrolling: true,
  inertialFriction: 0.95,
  // Snap grid (optional)
  snapGridEnabled: false,
  snapGridSpacing: 16.0,
  snapGridOrigin: Offset.zero,
  showSnapGrid: false,
);
```

Key options in `DiagramConfiguration` used by the implementation:
- `overscrollPixels`: controls elastic margins beyond bounds
- `bounceDuration` and `bounceCurve`: tune bounce-back animation
- `enableBlocDebugObserver`: enable verbose BLoC logging in debug
- Presets: `touchOptimized`, `desktopOptimized`
 - Snap grid: `snapGridEnabled`, `snapGridSpacing`, `snapGridOrigin`, `showSnapGrid`

## Command Set

Implemented commands from controller to viewer:
- `ApplyDefaultPanZoom`
- `SetTransform`
- `Redraw`
- `ElasticBounceBack`
- `AutoScrollStep`
- `StopAutoScroll`
- `ShowDragOverlay(ghostSpec, position)`
- `UpdateDragOverlay(position)`
- `HideDragOverlay()`

### Snap Grid Design

- Overview
  - Snapping occurs in logical space and targets object centers. It is opt-in and controlled by the controller through `DiagramConfiguration`.

- Computation
  - Given logical center `p`, spacing `s`, and origin `o`, the snapped center `p'` is:
    - `p'.dx = o.dx + round((p.dx - o.dx)/s) * s`
    - `p'.dy = o.dy + round((p.dy - o.dy)/s) * s`
  - Conversion between screen and logical positions uses current `Transform2D`.

- Rendering (optional)
  - When `showSnapGrid` is enabled, the viewer renders a lightweight grid after applying the transform. Grid line density is adaptively thinned based on scale to keep draw calls bounded.

- Control flow
  - The viewer computes snapped positions when `snapGridEnabled` is true and passes them alongside events as `snappedLogicalPosition` per: drag (`dragContinue`, `dragEnd`) e DnD (`dragTargetOver`, `dragTargetDrop`).
  - The controller decide se applicare le posizioni snapped al modello in tempo reale durante il drag e al drop per DnD.
  - Viewer remains policy-agnostic; it exposes utilities, optional snapped hints, aligns the DnD ghost when enabled, and draws the optional grid.

### Standard Input Mapping

- Baseline equivalences (policy at controller layer):
  - Pan: mouse left-drag on empty area; touch one-finger drag; trackpad two-finger drag.
  - Zoom: wheel+Ctrl/Cmd on desktop/web; pinch on touch/trackpad.
  - Selection: click/tap; multi-select via Shift/Ctrl or controller-defined mobile gesture.
  - Context menu: right-click / long-press.

- Implementation notes
  - `EventManagementBloc` unifies input as PhysicalEvents; controller interprets per-platform policy.
  - Tests should validate equivalences without depending on OS-specific gesture recognizers.

### Wheel + Modifier Zoom Pipeline (Design Details)

- Decision of focal point:
  - If Ctrl/Cmd is pressed and a wheel event occurs, treat it as zoom.
  - Determine if content is "small" using `scaleToFit(contentRect, viewportSize)` compared to current scale.
  - Focal anchoring strategy for a wheel burst (sequence of wheel events within ~300ms gaps):
    - If the sequence starts while content is small on any axis, anchor focal to the viewport center for the whole burst.
    - Otherwise, anchor focal to the cursor position in logical space.
  - If during a burst the content becomes small, latch to center-anchored mode until the burst ends.

- Application order per wheel tick:
  1. Compute proposed scale using multiplicative factor; clamp to `[effectiveMin, maxZoom]`, where `effectiveMin = max(minZoom, scaleToFit)`.
  2. Apply zoom around the chosen focal (`Transform2D.applyZoom`).
  3. Recompute translation:
     - If center-anchored (small-content burst), set translation so that the logical center maps to the viewport center.
     - Else, set translation to preserve the physical position of the logical focal under the cursor.
  4. Cap with `capTransformWithZoomLimits(dynamic: false, preserveCentering: true, recenterSmallContent: true)` to enforce limits and centering.

- Resulting behavior:
  - From min→max burst starting small: center stays visually stable (drift < 1 px) across the burst and across the `fitMin` threshold.
  - When content is large on both axes, the point under the cursor remains stable.
  - At limits, extra wheel ticks do not change scale or translation (no spurious pan).

## Inertial Scrolling Design

### Overview
- When a pan ends with sufficient velocity, continue scrolling with inertia, applying friction over time until the motion stops or hits bounds.

### Velocity Estimation
- Estimate initial velocity v0 from the last ~50–100 ms of pointer deltas; per-axis components (vx0, vy0).
- Trigger only if |v0| >= `minInertialVelocity`.

### Motion Integration
- Run a per-frame tick (~16 ms):
  - v(t+Δt) = v(t) * exp(-k * Δt); k from `inertialFriction`.
  - p(t+Δt) = p(t) + v(t) * Δt.
- Stop on `|v| < minStopVelocity` or `elapsed > maxInertialDuration`.

### Bounds Handling
- During inertia, apply dynamic bounds capping with elastic window.
- On end, if transform is out of strict bounds, trigger bounce-back.

### Cancellation
- Immediately stop inertia on any new input or on `StopAutoScroll`.
- Any `SetTransform`/`ApplyDefaultPanZoom` cancels inertia.

### Configuration
- `enableInertialScrolling` (bool), `inertialFriction` (double), `minInertialVelocity` (double), `minStopVelocity` (double), `maxInertialDuration` (Duration).

### Testing
- Unit tests for velocity decay and stopping conditions.
- Widget tests simulating a fast drag release; verify continued motion and eventual stop/bounce.

## Magic Mouse Scroll Session Window (Design)

### Goals
- Prevent cross‑talk between consecutive one‑finger slide bursts on Magic Mouse (alternate start/stop due to leftover timers/buffers).
- Keep sensitivity constant at high zoom by operating entirely in physical pixel space and amplifying micro deltas before sampling for inertia.

### Mechanics
- Events arrive via `Listener.onPointerSignal` as `PointerScrollEvent`.
- On the first event of a session:
  - Stop any ongoing inertia; cancel bounce timers; clear MM buffers and flags.
  - Mark session active.
- For each event in session:
  - Compute adjusted physical delta: min‑step clamp + small multiplier to counteract MM micro jitter.
  - Apply pan immediately using adjusted delta.
  - Append adjusted delta to the sampling buffer with timestamp. If inter‑event gap > ~180 ms, treat as a new session (clear buffers).
- Session idle timeout (~180–220 ms):
  - Compute dominant‑axis velocity over the last window; apply de‑noise by trimming opposite‑sign tail samples.
  - If average velocity below threshold but peak sample above threshold, start inertia with peak velocity (fallback).
  - When inertia ends, run bounce‑back only if out of strict bounds.
- Dispose: cancel session timer to avoid dangling timers in tests.

### Interaction With Other Inputs
- While a session is active, incoming different gesture types (e.g., trackpad pinch) are ignored by the MM path.
- New MM input cancels ongoing inertia immediately.

## Scale‑Invariant Physical Filtering

- All gesture filtering (min movement thresholds, de‑noise, inertia activation, velocity estimation) is computed strictly in physical pixels before any transform to logical coordinates.
- Benefits:
  - Sensitivity remains constant regardless of current zoom.
  - High‑zoom micro motions on MM/trackpad still cross thresholds predictably.
  - Tests simulate smooth MM‑like bursts using small per‑frame deltas and verify inertia triggers reliably at high zoom.
