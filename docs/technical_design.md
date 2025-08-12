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

### PhysicalEvent Enhancement

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
- Immediate stop on `StopAutoScroll` or any new user input (pointer/gesture/keyboard) via the service.
- Widget-level E2E autoscroll test stabilized and active.

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
);
```

Key options in `DiagramConfiguration` used by the implementation:
- `overscrollPixels`: controls elastic margins beyond bounds
- `bounceDuration` and `bounceCurve`: tune bounce-back animation
- `enableBlocDebugObserver`: enable verbose BLoC logging in debug
- Presets: `touchOptimized`, `desktopOptimized`

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
