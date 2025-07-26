# Technical Design

## Architecture Overview

This document describes the technical implementation of the **Diagrammer-Controller architecture** where:

- **Diagrammer**: The rendering engine/widget that handles UI events, hit-testing, and rendering
- **Controller**: The business logic component that interprets events and sends commands to the Diagrammer

## Core Components

### Transform2D
```dart
@freezed
class Transform2D with _$Transform2D {
  const factory Transform2D({
    required double scale,
    required Offset translation,
    @Default(0.0) double rotation,
  }) = _Transform2D;

  Matrix4 toMatrix4() {
    return Matrix4.identity()
      ..translate(translation.dx, translation.dy)
      ..scale(scale)
      ..rotateZ(rotation);
  }

  Transform2D applyZoom(double factor, Offset focalPoint) {
    final newScale = scale * factor;
    final scaleChange = factor - 1.0;
    final newTranslation = translation - focalPoint * scaleChange;
    
    return copyWith(
      scale: newScale,
      translation: newTranslation,
    );
  }

  Transform2D applyPan(Offset delta) {
    return copyWith(
      translation: translation + delta,
    );
  }

  Offset logicalToPhysical(Offset logical) {
    final matrix = toMatrix4();
    final vector = Vector4(logical.dx, logical.dy, 0, 1);
    final transformed = matrix.transform(vector);
    return Offset(transformed.x, transformed.y);
  }

  Offset physicalToLogical(Offset physical) {
    final matrix = toMatrix4().inverted();
    final vector = Vector4(physical.dx, physical.dy, 0, 1);
    final transformed = matrix.transform(vector);
    return Offset(transformed.x, transformed.y);
  }
}
```

### Renderable Interface
```dart
abstract class Renderable {
  /// Logical bounds of the renderable in diagram coordinates
  Rect get logicalBounds;
  
  /// Z-order for painting and hit-testing (higher values paint on top)
  int get zOrder;
  
  /// Paint the renderable on the provided canvas with the given transform
  void paint(Canvas canvas, Transform2D transform);
  
  /// Check if the renderable contains the given logical point
  bool contains(Offset logicalPoint);
  
  /// Get the renderable's unique identifier
  String get id;
}
```

## Event System

### Physical Events (Diagrammer → Controller)
```dart
@freezed
class PhysicalEvent with _$PhysicalEvent {
  const factory PhysicalEvent.pointer({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<Renderable> hitList,
    required BorderProximity borderProximity,
    required InteractionPhase phase,
    required PointerEvent rawEvent,
    Offset? delta,
  }) = PointerPhysicalEvent;

  const factory PhysicalEvent.gesture({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<Renderable> hitList,
    required BorderProximity borderProximity,
    required InteractionPhase phase,
    required GestureEvent rawEvent,
    double? scale,
    double? rotation,
  }) = GesturePhysicalEvent;

  const factory PhysicalEvent.keyboard({
    required String eventId,
    required Offset logicalPosition,
    required Transform2D transformSnapshot,
    required List<Renderable> hitList,
    required BorderProximity borderProximity,
    required KeyEvent rawEvent,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = KeyboardPhysicalEvent;
}

@freezed
class BorderProximity with _$BorderProximity {
  const factory BorderProximity({
    required bool isNearLeft,
    required bool isNearRight,
    required bool isNearTop,
    required bool isNearBottom,
    required double distanceFromEdge,
    @Default(50.0) double threshold,
  }) = _BorderProximity;

  bool get isNearAnyBorder => 
    isNearLeft || isNearRight || isNearTop || isNearBottom;
}

enum InteractionPhase {
  start,
  update,
  end,
  cancel,
}
```

### Hit-Testing Engine
```dart
class HitTestEngine {
  final List<Renderable> renderables;
  
  HitTestEngine(this.renderables);
  
  /// Perform hit-testing at the given logical point
  List<Renderable> hitTest(Offset logicalPoint) {
    final hits = <Renderable>[];
    
    // Sort by z-order (highest first) for proper hit-testing
    final sorted = List<Renderable>.from(renderables)
      ..sort((a, b) => b.zOrder.compareTo(a.zOrder));
    
    for (final renderable in sorted) {
      if (renderable.contains(logicalPoint)) {
        hits.add(renderable);
      }
    }
    
    return hits;
  }
  
  /// Get all renderables in the given logical rectangle
  List<Renderable> hitTestRect(Rect logicalRect) {
    return renderables.where((r) => 
      r.logicalBounds.overlaps(logicalRect)
    ).toList();
  }
}
```

## Command System (Controller → Diagrammer)

```dart
@freezed
class DiagramCommand with _$DiagramCommand {
  /// Execute default pan/zoom behavior for the given event
  const factory DiagramCommand.applyDefaultPanZoom({
    required PhysicalEvent origin,
  }) = ApplyDefaultPanZoomCommand;

  /// Apply specific transformation matrix
  const factory DiagramCommand.setTransform({
    required Transform2D transform,
  }) = SetTransformCommand;

  /// Update visualization with new renderables and extent
  const factory DiagramCommand.redraw({
    required List<Renderable> renderables,
    required Rect logicalExtent,
  }) = RedrawCommand;

  /// Return to valid bounds with animation
  const factory DiagramCommand.elasticBounceBack({
    required Transform2D targetTransform,
    @Default(Duration(milliseconds: 300)) Duration duration,
  }) = ElasticBounceBackCommand;

  /// Execute incremental scroll with specified velocity
  const factory DiagramCommand.autoScrollStep({
    required Offset velocity,
    @Default(Duration(milliseconds: 16)) Duration stepDuration,
  }) = AutoScrollStepCommand;

  /// Stop any ongoing auto-scroll
  const factory DiagramCommand.stopAutoScroll() = StopAutoScrollCommand;
}
```

## Diagrammer Implementation

### DiagrammerWidget
```dart
class DiagrammerWidget extends StatefulWidget {
  final Stream<DiagramCommand> commandStream;
  final Sink<PhysicalEvent> eventsSink;
  final List<Renderable> initialRenderables;
  final Rect initialLogicalExtent;
  final DiagrammerConfiguration configuration;

  const DiagrammerWidget({
    required this.commandStream,
    required this.eventsSink,
    required this.initialRenderables,
    required this.initialLogicalExtent,
    required this.configuration,
    super.key,
  });

  @override
  State<DiagrammerWidget> createState() => _DiagrammerWidgetState();
}

class _DiagrammerWidgetState extends State<DiagrammerWidget>
    with TickerProviderStateMixin {
  late Transform2D _transform;
  late List<Renderable> _renderables;
  late Rect _logicalExtent;
  late HitTestEngine _hitTestEngine;
  
  // Controllers for animations
  late AnimationController _bounceController;
  late AnimationController _autoScrollController;
  
  @override
  void initState() {
    super.initState();
    _transform = const Transform2D(scale: 1.0, translation: Offset.zero);
    _renderables = widget.initialRenderables;
    _logicalExtent = widget.initialLogicalExtent;
    _hitTestEngine = HitTestEngine(_renderables);
    
    _setupAnimations();
    _setupCommandListener();
  }
  
  void _setupAnimations() {
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _autoScrollController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    );
  }
  
  void _setupCommandListener() {
    widget.commandStream.listen(_handleCommand);
  }
  
  void _handleCommand(DiagramCommand command) {
    command.when(
      applyDefaultPanZoom: _handleApplyDefaultPanZoom,
      setTransform: _handleSetTransform,
      redraw: _handleRedraw,
      elasticBounceBack: _handleElasticBounceBack,
      autoScrollStep: _handleAutoScrollStep,
      stopAutoScroll: _handleStopAutoScroll,
    );
  }
  
  void _handleApplyDefaultPanZoom(PhysicalEvent origin) {
    // Implement default pan/zoom behavior based on event type
    origin.when(
      pointer: (eventId, logicalPosition, screenPosition, transformSnapshot, 
                hitList, borderProximity, phase, rawEvent, delta) {
        if (delta != null) {
          _transform = _transform.applyPan(delta);
          _constrainTransform();
        }
      },
      gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) {
        if (scale != null) {
          _transform = _transform.applyZoom(scale, logicalPosition);
          _constrainTransform();
        }
      },
      keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                 borderProximity, rawEvent, pressedKeys) {
        // Handle keyboard shortcuts for pan/zoom
      },
    );
    
    setState(() {});
  }
  
  void _handleSetTransform(Transform2D transform) {
    _transform = transform;
    _constrainTransform();
    setState(() {});
  }
  
  void _handleRedraw(List<Renderable> renderables, Rect logicalExtent) {
    _renderables = renderables;
    _logicalExtent = logicalExtent;
    _hitTestEngine = HitTestEngine(_renderables);
    setState(() {});
  }
  
  void _constrainTransform() {
    // Implement transform constraints based on logical extent
    // and configuration limits
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _handlePanUpdate,
      onScaleUpdate: _handleScaleUpdate,
      onTapDown: _handleTapDown,
      child: CustomPaint(
        painter: DiagramPainter(
          transform: _transform,
          renderables: _renderables,
          configuration: widget.configuration,
        ),
        size: Size.infinite,
      ),
    );
  }
  
  void _handlePanUpdate(DragUpdateDetails details) {
    final logicalPosition = _transform.physicalToLogical(details.localPosition);
    final hitList = _hitTestEngine.hitTest(logicalPosition);
    final borderProximity = _calculateBorderProximity(details.localPosition);
    
    final event = PhysicalEvent.pointer(
      eventId: _generateEventId(),
      logicalPosition: logicalPosition,
      screenPosition: details.localPosition,
      transformSnapshot: _transform,
      hitList: hitList,
      borderProximity: borderProximity,
      phase: InteractionPhase.update,
      rawEvent: details, // Simplified for example
      delta: details.delta,
    );
    
    widget.eventsSink.add(event);
  }
  
  BorderProximity _calculateBorderProximity(Offset screenPosition) {
    // Calculate proximity to viewport edges
    final size = context.size ?? Size.zero;
    final threshold = widget.configuration.edgeThreshold;
    
    return BorderProximity(
      isNearLeft: screenPosition.dx < threshold,
      isNearRight: screenPosition.dx > size.width - threshold,
      isNearTop: screenPosition.dy < threshold,
      isNearBottom: screenPosition.dy > size.height - threshold,
      distanceFromEdge: _calculateMinDistance(screenPosition, size),
      threshold: threshold,
    );
  }
  
  String _generateEventId() => 
    DateTime.now().microsecondsSinceEpoch.toString();
}
```

### DiagramPainter
```dart
class DiagramPainter extends CustomPainter {
  final Transform2D transform;
  final List<Renderable> renderables;
  final DiagrammerConfiguration configuration;

  DiagramPainter({
    required this.transform,
    required this.renderables,
    required this.configuration,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint background
    _paintBackground(canvas, size);
    
    // Apply transform
    canvas.save();
    canvas.transform(transform.toMatrix4().storage);
    
    // Paint renderables in z-order
    final sorted = List<Renderable>.from(renderables)
      ..sort((a, b) => a.zOrder.compareTo(b.zOrder));
    
    for (final renderable in sorted) {
      renderable.paint(canvas, transform);
    }
    
    canvas.restore();
  }
  
  void _paintBackground(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = configuration.backgroundColor
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant DiagramPainter oldDelegate) {
    return transform != oldDelegate.transform ||
           renderables != oldDelegate.renderables ||
           configuration != oldDelegate.configuration;
  }
}
```

## Configuration

### DiagrammerConfiguration
```dart
@freezed
class DiagrammerConfiguration with _$DiagrammerConfiguration {
  const factory DiagrammerConfiguration({
    @Default(Colors.white) Color backgroundColor,
    @Default(50.0) double edgeThreshold,
    @Default(10.0) double maxZoom,
    @Default(0.1) double minZoom,
    @Default(100.0) double overscrollPixels,
    @Default(Duration(milliseconds: 300)) Duration bounceDuration,
    @Default(Duration(milliseconds: 16)) Duration autoScrollInterval,
    @Default(1.5) double autoScrollAcceleration,
  }) = _DiagrammerConfiguration;
}
```

## Example Use Cases

### Case 1: Object Dragging with Auto-scroll
```dart
class Controller {
  void handlePhysicalEvent(PhysicalEvent event) {
    event.when(
      pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, delta) {
        if (hitList.isNotEmpty && borderProximity.isNearAnyBorder) {
          // Object is being dragged near edge - start auto-scroll
          final velocity = _calculateAutoScrollVelocity(borderProximity);
          _sendCommand(DiagramCommand.autoScrollStep(velocity: velocity));
        } else if (hitList.isNotEmpty) {
          // Object manipulation - update model and redraw
          _updateObjectPosition(hitList.first, logicalPosition);
          _sendRedrawCommand();
        } else {
          // No object hit - apply default pan behavior
          _sendCommand(DiagramCommand.applyDefaultPanZoom(origin: event));
        }
      },
      gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) {
        // Handle gesture events (zoom, rotation)
        _sendCommand(DiagramCommand.applyDefaultPanZoom(origin: event));
      },
      keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                 borderProximity, rawEvent, pressedKeys) {
        // Handle keyboard shortcuts
      },
    );
  }
}
```

### Case 2: Model Update and Redraw
```dart
class Controller {
  void updateModel(List<Renderable> newRenderables) {
    // Update internal model
    _model.updateRenderables(newRenderables);
    
    // Calculate new logical extent
    final newExtent = _calculateLogicalExtent(newRenderables);
    
    // Send redraw command
    _sendCommand(DiagramCommand.redraw(
      renderables: newRenderables,
      logicalExtent: newExtent,
    ));
  }
}
```

## Performance Considerations

### Frame Budget Management
- Target: ≤ 16ms per frame (60fps)
- Implement frame-coalescing for high-frequency events
- Use efficient hit-testing algorithms
- Optimize renderable sorting and painting

### Memory Management
- Proper disposal of animation controllers
- Stream subscription management
- Efficient renderable list updates
- Spatial indexing for large diagram sets (future enhancement)