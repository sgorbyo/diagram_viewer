library diagram_viewer;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

// Export interfaces for client implementation
export 'interfaces/interfaces.dart';

// Export events and commands for client usage
export 'events/events.dart';

/// A DiagramViewer that implements the Diagrammer-Controller architecture.
///
/// This widget accepts an external IDiagramController and manages the rendering
/// and event handling while delegating business logic to the controller.
///
/// ## Architecture
///
/// The DiagramViewer:
/// 1. Accepts an IDiagramController for business logic
/// 2. Manages internal state (transform, objects, etc.)
/// 3. Captures and enriches UI events
/// 4. Performs hit-testing
/// 5. Sends PhysicalEvents to the controller
/// 6. Executes DiagramCommands from the controller
/// 7. Maintains compatibility with ScrollingBloc for pure scrolling
///
/// ## Usage
///
/// ```dart
/// DiagramViewer(
///   controller: myDiagramController,
///   configuration: DiagramConfiguration.defaults,
/// )
/// ```
class DiagramViewer extends StatefulWidget {
  /// The external controller that provides business logic.
  ///
  /// This controller is responsible for:
  /// - Interpreting PhysicalEvents
  /// - Making business logic decisions
  /// - Sending DiagramCommands back to the viewer
  /// - Managing diagram content and extent
  final IDiagramController controller;

  /// Configuration for the diagram viewer.
  ///
  /// This provides settings for appearance, interactions, and animations.
  /// If not provided, uses DiagramConfiguration.defaults.
  final DiagramConfiguration? configuration;

  /// Whether to enable debug information.
  ///
  /// When true, shows debug information like bounds, hit areas, etc.
  final bool debug;

  /// Creates a new DiagramViewer.
  ///
  /// [controller] - The external controller for business logic
  /// [configuration] - Optional configuration (defaults to DiagramConfiguration.defaults)
  /// [debug] - Whether to show debug information
  const DiagramViewer({
    Key? key,
    required this.controller,
    this.configuration,
    this.debug = false,
  }) : super(key: key);

  @override
  State<DiagramViewer> createState() => _DiagramViewerState();
}

class _DiagramViewerState extends State<DiagramViewer>
    with TickerProviderStateMixin {
  // Internal state
  Transform2D _currentTransform = Transform2D.identity;
  List<DiagramObjectEntity> _objects = [];
  Rect _logicalExtent = Rect.zero;

  // Animation controllers
  late AnimationController _bounceController;
  late AnimationController _autoScrollController;

  // Stream subscriptions
  StreamSubscription<DiagramCommand>? _commandSubscription;

  // Event tracking
  String _currentEventId = '';
  Offset? _lastPointerPosition;

  // Hit-testing engine
  final _hitTestEngine = _HitTestEngine();

  // Configuration
  late DiagramConfiguration _config;

  @override
  void initState() {
    super.initState();

    // Initialize configuration
    _config = widget.configuration ?? DiagramConfiguration.defaults;

    // Initialize animation controllers
    _bounceController = AnimationController(
      duration: _config.bounceDuration,
      vsync: this,
    );

    _autoScrollController = AnimationController(
      duration: _config.autoScrollInterval,
      vsync: this,
    );

    // Listen to commands from the controller
    _commandSubscription =
        widget.controller.commandStream.listen(_handleCommand);

    // Initialize with controller's initial state
    _logicalExtent = widget.controller.logicalExtent;
    _objects = widget.controller.objects;
    _config = widget.controller.configuration;
  }

  @override
  void dispose() {
    _commandSubscription?.cancel();
    _bounceController.dispose();
    _autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Listener(
          onPointerDown: _handlePointerDown,
          onPointerMove: _handlePointerMove,
          onPointerUp: _handlePointerUp,
          onPointerCancel: _handlePointerCancel,
          child: CustomPaint(
            painter: _DiagramPainter(
              transform: _currentTransform,
              objects: _objects,
              logicalExtent: _logicalExtent,
              configuration: _config,
              debug: widget.debug,
            ),
            size: Size(constraints.maxWidth, constraints.maxHeight),
          ),
        );
      },
    );
  }

  /// Handle pointer down events.
  void _handlePointerDown(PointerDownEvent event) {
    _currentEventId = _generateEventId();
    _lastPointerPosition = event.position;

    final physicalEvent = _createPhysicalEvent(
      event: event,
      phase: InteractionPhase.start,
    );

    widget.controller.eventsSink.add(physicalEvent);
  }

  /// Handle pointer move events.
  void _handlePointerMove(PointerMoveEvent event) {
    if (_lastPointerPosition == null) return;

    final delta = event.position - _lastPointerPosition!;
    _lastPointerPosition = event.position;

    final physicalEvent = _createPhysicalEvent(
      event: event,
      phase: InteractionPhase.update,
      delta: delta,
    );

    widget.controller.eventsSink.add(physicalEvent);
  }

  /// Handle pointer up events.
  void _handlePointerUp(PointerUpEvent event) {
    final physicalEvent = _createPhysicalEvent(
      event: event,
      phase: InteractionPhase.end,
    );

    widget.controller.eventsSink.add(physicalEvent);

    _lastPointerPosition = null;
  }

  /// Handle pointer cancel events.
  void _handlePointerCancel(PointerCancelEvent event) {
    final physicalEvent = _createPhysicalEvent(
      event: event,
      phase: InteractionPhase.end,
    );

    widget.controller.eventsSink.add(physicalEvent);

    _lastPointerPosition = null;
  }

  /// Create a PhysicalEvent from a raw pointer event.
  PhysicalEvent _createPhysicalEvent({
    required PointerEvent event,
    required InteractionPhase phase,
    Offset? delta,
  }) {
    final logicalPosition = _currentTransform.physicalToLogical(event.position);
    final hitList = _hitTestEngine.hitTest(logicalPosition, _objects);
    final borderProximity = _calculateBorderProximity(event.position);

    return PhysicalEvent.pointer(
      eventId: _currentEventId,
      logicalPosition: logicalPosition,
      screenPosition: event.position,
      transformSnapshot: _currentTransform,
      hitList: hitList,
      borderProximity: borderProximity,
      phase: phase,
      rawEvent: event,
      delta: delta,
    );
  }

  /// Calculate border proximity for a screen position.
  BorderProximity _calculateBorderProximity(Offset screenPosition) {
    final size = context.size;
    if (size == null) return BorderProximity.none;

    final leftDistance = screenPosition.dx;
    final rightDistance = size.width - screenPosition.dx;
    final topDistance = screenPosition.dy;
    final bottomDistance = size.height - screenPosition.dy;

    final minDistance = [
      leftDistance,
      rightDistance,
      topDistance,
      bottomDistance
    ].reduce((a, b) => a < b ? a : b);

    if (minDistance > _config.edgeThreshold) {
      return BorderProximity.none;
    }

    // Return a simple BorderProximity with calculated values
    return BorderProximity(
      isNearLeft: leftDistance <= _config.edgeThreshold,
      isNearRight: rightDistance <= _config.edgeThreshold,
      isNearTop: topDistance <= _config.edgeThreshold,
      isNearBottom: bottomDistance <= _config.edgeThreshold,
      distanceFromEdge: minDistance,
      threshold: _config.edgeThreshold,
    );
  }

  /// Handle commands from the controller.
  void _handleCommand(DiagramCommand command) {
    command.when(
      applyDefaultPanZoom: (origin) {
        // Delegate to ScrollingBloc for pure scrolling behavior
        _applyDefaultPanZoom(origin);
      },
      setTransform: (transform) {
        setState(() {
          _currentTransform = transform;
        });
      },
      redraw: (renderables, logicalExtent) {
        setState(() {
          _objects = renderables;
          _logicalExtent = logicalExtent;
        });
      },
      elasticBounceBack: (targetTransform, duration) {
        _animateElasticBounceBack(targetTransform, duration);
      },
      autoScrollStep: (velocity, stepDuration) {
        _executeAutoScrollStep(velocity, stepDuration);
      },
      stopAutoScroll: () {
        _stopAutoScroll();
      },
    );
  }

  /// Apply default pan/zoom behavior.
  void _applyDefaultPanZoom(PhysicalEvent origin) {
    // This will be implemented to delegate to ScrollingBloc
    // for pure scrolling behavior when no business logic is needed
  }

  /// Animate elastic bounce back to valid bounds.
  void _animateElasticBounceBack(
      Transform2D targetTransform, Duration duration) {
    _bounceController.duration = duration;
    _bounceController.forward(from: 0.0);

    // Animation will be implemented to smoothly transition to targetTransform
  }

  /// Execute an auto-scroll step.
  void _executeAutoScrollStep(Offset velocity, Duration stepDuration) {
    // Auto-scroll implementation will be added
  }

  /// Stop auto-scrolling.
  void _stopAutoScroll() {
    _autoScrollController.stop();
  }

  /// Generate a unique event ID.
  String _generateEventId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}

/// Hit-testing engine for finding objects at a given position.
class _HitTestEngine {
  /// Perform hit-testing at the given logical position.
  ///
  /// Returns a list of objects that contain the point, ordered by z-order
  /// (highest z-order first).
  List<DiagramObjectEntity> hitTest(
      Offset logicalPosition, List<DiagramObjectEntity> objects) {
    final hitObjects = <DiagramObjectEntity>[];

    for (final object in objects) {
      if (object.isVisible &&
          object.isInteractive &&
          object.contains(logicalPosition)) {
        hitObjects.add(object);
      }
    }

    // Sort by z-order (highest first)
    hitObjects.sort((a, b) => b.zOrder.compareTo(a.zOrder));

    return hitObjects;
  }
}

/// Custom painter for the diagram.
class _DiagramPainter extends CustomPainter {
  final Transform2D transform;
  final List<DiagramObjectEntity> objects;
  final Rect logicalExtent;
  final DiagramConfiguration configuration;
  final bool debug;

  _DiagramPainter({
    required this.transform,
    required this.objects,
    required this.logicalExtent,
    required this.configuration,
    required this.debug,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Apply transformation
    canvas.save();
    canvas.transform(transform.toMatrix4().storage);

    // Draw background
    _drawBackground(canvas, size);

    // Draw objects in z-order
    _drawObjects(canvas);

    // Draw debug information
    if (debug) {
      _drawDebugInfo(canvas, size);
    }

    canvas.restore();
  }

  /// Draw the diagram background.
  void _drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = configuration.backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset.zero & size, backgroundPaint);
  }

  /// Draw all objects in z-order.
  void _drawObjects(Canvas canvas) {
    // Sort objects by z-order
    final sortedObjects = List<DiagramObjectEntity>.from(objects)
      ..sort((a, b) => a.zOrder.compareTo(b.zOrder));

    for (final object in sortedObjects) {
      if (object.isVisible) {
        object.paint(canvas, transform);
      }
    }
  }

  /// Draw debug information.
  void _drawDebugInfo(Canvas canvas, Size size) {
    final debugPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw logical extent
    canvas.drawRect(logicalExtent, debugPaint);

    // Draw object bounds
    for (final object in objects) {
      final boundsPaint = Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;

      canvas.drawRect(object.logicalBounds, boundsPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint for now, can be optimized later
  }
}
