# Architecture Overview

## Core Architecture: Diagrammer-Controller Pattern

The `diagram_viewer` package implements a **Diagrammer-Controller architecture** that separates rendering concerns from business logic:

### **Diagrammer (DiagramViewer)**
- **Rendering Engine**: Handles UI events, hit-testing, and rendering
- **Transform Management**: Owns the transformation matrix (zoom + pan)
- **Event Capture**: Captures and enriches UI events with logical coordinates
- **Passive Behavior**: Executes commands from Controller, doesn't make business decisions

### **Controller (External)**
- **Business Logic**: Owns diagram-specific logic (ERD, Genogram, STD, etc.)
- **Event Interpretation**: Decides between model mutation or default behavior
- **State Management**: Manages diagram state through BLoCs
- **Command Emission**: Sends commands to Diagrammer for execution

## Vector Space Management

### **Coordinate Systems**
- **Logical Space**: Original diagram coordinates (client's domain)
- **Physical Space**: Screen coordinates after zoom/pan transformations
- **Transform2D**: Custom 2D transformation class for efficient operations

### **Transform Operations**
```dart
class Transform2D {
  final double scale;
  final Offset translation;
  final double rotation;
  
  Transform2D applyZoom(double factor, Offset focalPoint);
  Transform2D applyPan(Offset delta);
  Offset logicalToPhysical(Offset logical);
  Offset physicalToLogical(Offset physical);
}
```

## Event and Command System

### **Physical Events (Diagrammer → Controller)**
- **Unified Events**: Platform-agnostic events (pointer, gesture, keyboard)
- **Enriched Context**: Logical coordinates, hit-test results, border proximity
- **Event Phases**: Start, update, end for continuous interactions

### **Diagram Commands (Controller → Diagrammer)**
- **ApplyDefaultPanZoom**: Execute default pan/zoom behavior
- **SetTransform**: Apply specific transformation
- **Redraw**: Update visualization with new objects
- **ElasticBounceBack**: Return to valid bounds with animation
- **AutoScrollStep**: Execute incremental scroll

## Component Responsibilities

### **Diagrammer Responsibilities**
- Event capture and enrichment
- Hit-testing and object detection
- Transform management and bounds checking
- Rendering pipeline with z-order sorting
- Default pan/zoom behaviors
- Performance optimization (60 FPS target)

### **Controller Responsibilities**
- Business logic interpretation
- Model state management
- Object selection and manipulation
- Auto-scroll orchestration
- Diagram extent calculation
- State machine coordination (BLoCs)

## Data Flow

```
User Gesture → Diagrammer (enrichment) → Controller (interpretation) → Commands → Diagrammer (execution) → Rendering
```

## Performance Requirements

- **60 FPS Rendering**: ≤ 16ms per frame
- **Efficient Hit-Testing**: Spatial indexing for large diagrams
- **Memory Management**: Proper stream disposal and BLoC lifecycle
- **Responsive Interactions**: Immediate feedback for user gestures

## Extensibility

- **Controller Independence**: Different diagram types use same Diagrammer
- **Event System**: Extensible event types for custom interactions
- **Command System**: Extensible command types for custom behaviors
- **Object System**: Unified interface for custom diagram objects

## BLoC Architecture

### **Internal BLoCs (Diagrammer)**
- **TransformBloc**: Manages current transform state
- **ZoomBloc**: Handles zoom operations and elastic limits
- **PanBloc**: Handles pan operations and auto-centering

### **External BLoCs (Controller)**
- **MainDiagramBloc**: Global diagram state management
- **EventInterpreter**: Maps events to domain intents
- **AutoScrollService**: Orchestrates auto-scroll behavior

## Interaction State Management

### **Gesture Concurrency Rules**
- **Scale beats Pan**: Multi-touch gestures prioritize scale
- **Object-Drag overrides View-Pan**: When objects are hit
- **LongPress activates LassoSelecting**: In empty areas
- **Modifier keys rewire Scroll**: Ctrl/Cmd + scroll = zoom

### **Interaction States**
- **Idle**: No active interaction
- **Panning**: Viewport pan in progress
- **Zooming**: Zoom operation in progress
- **ObjectDragging**: Object manipulation in progress

## Zoom Behavior Requirements

### **Focal Point Stability**
- **Pinch-to-zoom**: Point between fingers remains stationary
- **Mouse wheel zoom**: Point under cursor remains stationary
- **Keyboard zoom**: Center of viewport remains stationary

### **Zoom Constraints**
- **Configurable Limits**: minZoom and maxZoom from configuration
- **Dynamic Min Zoom**: Ensures entire diagram is visible
- **Elastic Overscroll**: Temporary zoom beyond limits with bounce-back
- **Minimum Size**: 512x512 minimum diagram size

## Auto-Centering and Bounds

### **Auto-Centering**
- Automatically centers diagram when smaller than viewport
- Maintains equal background on both sides
- Applied during transform capping operations

### **Elastic Bounds**
- **Pan Overscroll**: 150px beyond diagram bounds
- **Zoom Overscroll**: Temporary zoom beyond min/max limits
- **Bounce-back Animation**: Smooth return to valid bounds
- **Background Visibility**: Shows background when over-bounds

## Testing Strategy

### **Test-Driven Development**
- Write failing tests first
- Implement code to make tests pass
- Refactor while maintaining test coverage

### **Test Categories**
- **Unit Tests**: Individual component behavior
- **Integration Tests**: BLoC communication
- **Widget Tests**: UI interaction and rendering
- **Performance Tests**: 60 FPS requirement validation

