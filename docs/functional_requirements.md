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
  - Hit-test results (list of Renderable objects at the event location)
  - Border proximity information (configurable threshold)
  - Event phase (start, update, end)

### Platform-Agnostic Event Unification
- The package must unify similar physical input events from different platforms:
  - Mouse click/drag/release and touch start/move/end → same logical event sequence
  - Mouse wheel and touch pinch → single transformation event type
  - Double click and double tap → single repeated interaction event type

### Hit-Testing Responsibility
- The package must perform internal hit-testing:
  - Expose `hitTest(Point) → List<Renderable>` functionality
  - Handle computational costs of hit-testing internally
  - Include hit-test results in every physical event sent to the controller
  - Sort Renderables by z-order for proper hit-testing

### Command System (Controller → Diagrammer)
- The package must support commands from the controller:
  1. **ApplyDefaultPanZoom**: Execute default pan/zoom behavior for an event
  2. **SetTransform**: Apply specific transformation matrix
  3. **Redraw**: Update visualization with new Renderable list and logical extent
  4. **ElasticBounceBack**: Return to valid bounds with animation
  5. **AutoScrollStep**: Execute incremental scroll with specified velocity

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

### Renderable Management
- The package must:
  - Maintain a list of Renderable objects
  - Sort Renderables by z-order before painting
  - Provide a unified interface for objects to draw themselves
  - Handle the rendering pipeline with transformed canvas

### Dynamic Diagram Boundaries
- The controller must:
  - Calculate and manage the logical diagram area based on content
  - Communicate logical dimensions to the package via commands
  - Include appropriate padding around content
  - Ensure boundaries are never smaller than configured minimum size

- The package must:
  - Accept and respect boundaries provided by the controller
  - Use boundaries to constrain transformations and scrolling
  - Maintain configurable minimum view size
  - Automatically adjust minimum zoom on resize/orientation changes

### Auto-scrolling Behavior
- The controller must:
  - Orchestrate auto-scroll when objects approach diagram edges
  - Configure auto-scroll parameters (speed inversely proportional to distance)
  - Send AutoScrollStep commands to the package

- The package must:
  - Execute auto-scroll commands from the controller
  - Support configurable edge detection thresholds
  - Handle scroll momentum and damping

## Performance Requirements

### Rendering Performance
- The package must maintain ≤ 16 ms/frame (≈60 fps) on recent desktop/tablet devices
- Implement efficient hit-testing algorithms
- Support frame-coalescing for high-frequency events
- Handle overscroll/overzoom with spring animations

### Memory Management
- The package must implement proper stream ownership and disposal
- Support BLoC disposal policies for dynamic sub-components
- Handle memory-efficient rendering of large diagram sets

## Accessibility and Input Diversity
- The package must support:
  - Keyboard shortcuts with cross-platform mapping
  - Touch, mouse, and trackpad input
  - Screen reader compatibility (best-effort)
  - Configurable input sensitivity and thresholds