library diagram_viewer;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/internal/event_management_bloc.dart';

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

/// Extension to access internal state for testing purposes
extension DiagramViewerTesting on DiagramViewer {
  /// Get the current transform for testing purposes
  Transform2D? getCurrentTransform(State<DiagramViewer> state) {
    if (state is _DiagramViewerState) {
      return state._currentTransform;
    }
    return null;
  }
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

  // Internal BLoC for event management
  late EventManagementBloc _eventBloc;

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

    // Initialize internal BLoC
    _eventBloc = EventManagementBloc(widget.controller);

    // Listen to commands from the controller
    _commandSubscription =
        widget.controller.commandStream.listen(_executeCommand);

    // Initialize with controller's initial state
    _logicalExtent = widget.controller.logicalExtent;
    _objects = widget.controller.objects;
    // Use widget configuration if provided, otherwise use controller's
    _config = widget.configuration ?? widget.controller.configuration;

    // Recalculate constraints after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _recalculateTransformConstraints();
      }
    });
  }

  @override
  void dispose() {
    _commandSubscription?.cancel();
    _bounceController.dispose();
    _autoScrollController.dispose();
    _eventBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocProvider.value(
          value: _eventBloc,
          child: BlocListener<EventManagementBloc, EventManagementState>(
            listener: (context, state) {
              // Handle state changes if needed
            },
            child: Focus(
              autofocus: true,
              onKeyEvent: _handleKeyEvent,
              child: GestureDetector(
                onScaleStart: _handleScaleStart,
                onScaleUpdate: _handleScaleUpdate,
                onScaleEnd: _handleScaleEnd,
                child: Listener(
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
                ),
              ),
            ),
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

    // Start panning interaction via BLoC
    _eventBloc.add(EventManagementEvent.interactionStarted(
      InteractionType.pan,
      physicalEvent.eventId,
    ));

    // Send event to BLoC for processing
    _eventBloc.add(EventManagementEvent.physicalEventReceived(physicalEvent));
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

    // Send event to BLoC for processing
    _eventBloc.add(EventManagementEvent.physicalEventReceived(physicalEvent));
  }

  /// Handle pointer up events.
  void _handlePointerUp(PointerUpEvent event) {
    final physicalEvent = _createPhysicalEvent(
      event: event,
      phase: InteractionPhase.end,
    );

    // End interaction via BLoC
    _eventBloc
        .add(EventManagementEvent.interactionEnded(physicalEvent.eventId));

    // Send event to BLoC for processing
    _eventBloc.add(EventManagementEvent.physicalEventReceived(physicalEvent));

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

  /// Handle scale start events.
  void _handleScaleStart(ScaleStartDetails details) {
    final logicalPosition =
        _currentTransform.physicalToLogical(details.focalPoint);
    final hitList = _hitTestEngine.hitTest(logicalPosition, _objects);
    final borderProximity = _calculateBorderProximity(details.focalPoint);

    final physicalEvent = PhysicalEvent.gesture(
      eventId: _generateEventId(),
      logicalPosition: logicalPosition,
      screenPosition: details.focalPoint,
      transformSnapshot: _currentTransform,
      hitList: hitList,
      borderProximity: borderProximity,
      phase: InteractionPhase.start,
      rawEvent: details,
      scale: null,
      rotation: null,
      currentViewport: _calculateCurrentViewport(),
    );

    // Start zooming interaction via BLoC
    _eventBloc.add(EventManagementEvent.interactionStarted(
      InteractionType.zoom,
      physicalEvent.eventId,
    ));

    // Send event to BLoC for processing
    _eventBloc.add(EventManagementEvent.physicalEventReceived(physicalEvent));
  }

  /// Handle scale update events.
  void _handleScaleUpdate(ScaleUpdateDetails details) {
    final logicalPosition =
        _currentTransform.physicalToLogical(details.focalPoint);
    final hitList = _hitTestEngine.hitTest(logicalPosition, _objects);
    final borderProximity = _calculateBorderProximity(details.focalPoint);

    final physicalEvent = PhysicalEvent.gesture(
      eventId: _generateEventId(),
      logicalPosition: logicalPosition,
      screenPosition: details.focalPoint,
      transformSnapshot: _currentTransform,
      hitList: hitList,
      borderProximity: borderProximity,
      phase: InteractionPhase.update,
      rawEvent: details,
      scale: details.scale,
      rotation: details.rotation,
      currentViewport: _calculateCurrentViewport(),
    );

    // Send event to BLoC for processing
    _eventBloc.add(EventManagementEvent.physicalEventReceived(physicalEvent));
  }

  /// Handle scale end events.
  void _handleScaleEnd(ScaleEndDetails details) {
    // Use last pointer position or center of screen for scale end
    final screenPosition = _lastPointerPosition ?? Offset.zero;
    final logicalPosition = _currentTransform.physicalToLogical(screenPosition);
    final hitList = _hitTestEngine.hitTest(logicalPosition, _objects);
    final borderProximity = _calculateBorderProximity(screenPosition);

    final physicalEvent = PhysicalEvent.gesture(
      eventId: _generateEventId(),
      logicalPosition: logicalPosition,
      screenPosition: screenPosition,
      transformSnapshot: _currentTransform,
      hitList: hitList,
      borderProximity: borderProximity,
      phase: InteractionPhase.end,
      rawEvent: details,
      scale: null,
      rotation: null,
      currentViewport: _calculateCurrentViewport(),
    );

    // End interaction via BLoC
    _eventBloc
        .add(EventManagementEvent.interactionEnded(physicalEvent.eventId));

    // Send event to BLoC for processing
    _eventBloc.add(EventManagementEvent.physicalEventReceived(physicalEvent));
  }

  /// Calculate the current viewport in logical coordinates.
  Rect _calculateCurrentViewport() {
    final size = context.size;
    if (size == null) return Rect.zero;

    // Convert screen bounds to logical coordinates
    final topLeft = _currentTransform.physicalToLogical(Offset.zero);
    final bottomRight =
        _currentTransform.physicalToLogical(Offset(size.width, size.height));

    return Rect.fromLTRB(
        topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy);
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
    final currentViewport = _calculateCurrentViewport();

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
      currentViewport: currentViewport,
    );
  }

  /// Handle keyboard events.
  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final logicalPosition = _currentTransform.physicalToLogical(Offset.zero);
    final hitList = _hitTestEngine.hitTest(logicalPosition, _objects);
    final borderProximity = BorderProximity.none;

    final physicalEvent = PhysicalEvent.keyboard(
      eventId: _generateEventId(),
      logicalPosition: logicalPosition,
      transformSnapshot: _currentTransform,
      hitList: hitList,
      borderProximity: borderProximity,
      rawEvent: event,
      pressedKeys: {event.logicalKey},
      currentViewport: _calculateCurrentViewport(),
    );

    widget.controller.eventsSink.add(physicalEvent);
    return KeyEventResult.handled;
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

  /// Execute a command from the controller.
  void _executeCommand(DiagramCommand command) {
    command.when(
      applyDefaultPanZoom: (origin) {
        // The controller has decided to apply default pan/zoom behavior
        // This method should be called by the controller when it wants
        // the DiagramViewer to handle the event with its default behavior
        _handleDefaultPanZoom(origin);
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

        // Recalculate transform constraints when logical extent changes
        _recalculateTransformConstraints();

        // Force a complete repaint to prevent artifacts
        // This ensures the entire canvas is redrawn when the extent changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              // Trigger a repaint by updating a dummy value
              // This forces the CustomPaint to repaint completely
            });
          }
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

  /// Handle default pan/zoom behavior when requested by controller.
  void _handleDefaultPanZoom(PhysicalEvent origin) {
    final size = context.size;
    if (size == null) return;

    origin.when(
      pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
          hitList, borderProximity, phase, rawEvent, delta, currentViewport) {
        if (delta != null && phase == InteractionPhase.update) {
          // Handle pan events
          final newTransform = _currentTransform.applyPan(delta);

          // Apply transform limits
          final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: true,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );

          setState(() {
            _currentTransform = finalTransform;
          });
        } else if (rawEvent is PointerScrollEvent) {
          // Handle mouse wheel zoom
          const zoomFactor = 1.2; // 20% zoom per scroll unit
          final scrollDelta = rawEvent.scrollDelta.dy;

          // Determine zoom direction based on scroll direction
          final scale = scrollDelta < 0 ? zoomFactor : 1.0 / zoomFactor;

          // Convert screen position to logical coordinates for focal point
          final focalPointInLogical =
              _currentTransform.physicalToLogical(screenPosition);
          final newTransform =
              _currentTransform.applyZoom(scale, focalPointInLogical);

          // Apply transform limits
          final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: true,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );

          setState(() {
            _currentTransform = finalTransform;
          });
        }
      },
      gesture: (eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          borderProximity,
          phase,
          rawEvent,
          scale,
          rotation,
          currentViewport) {
        if (scale != null) {
          // Convert screen position to logical coordinates for focal point
          final focalPointInLogical =
              _currentTransform.physicalToLogical(screenPosition);
          final newTransform =
              _currentTransform.applyZoom(scale, focalPointInLogical);

          // Apply transform limits
          final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: true,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );

          setState(() {
            _currentTransform = finalTransform;
          });
        }
      },
      keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
          borderProximity, rawEvent, pressedKeys, currentViewport) {
        const panStep = 50.0;
        const zoomStep = 1.2;

        if (pressedKeys.contains(LogicalKeyboardKey.arrowLeft)) {
          final newTransform = _currentTransform.applyPan(Offset(panStep, 0));
          final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: false,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );
          setState(() {
            _currentTransform = cappedTransform;
          });
        } else if (pressedKeys.contains(LogicalKeyboardKey.arrowRight)) {
          final newTransform = _currentTransform.applyPan(Offset(-panStep, 0));
          final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: false,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );
          setState(() {
            _currentTransform = cappedTransform;
          });
        } else if (pressedKeys.contains(LogicalKeyboardKey.arrowUp)) {
          final newTransform = _currentTransform.applyPan(Offset(0, panStep));
          final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: false,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );
          setState(() {
            _currentTransform = cappedTransform;
          });
        } else if (pressedKeys.contains(LogicalKeyboardKey.arrowDown)) {
          final newTransform = _currentTransform.applyPan(Offset(0, -panStep));
          final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: false,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );
          setState(() {
            _currentTransform = cappedTransform;
          });
        } else if (pressedKeys.contains(LogicalKeyboardKey.equal) ||
            pressedKeys.contains(LogicalKeyboardKey.add)) {
          final newTransform =
              _currentTransform.applyZoom(zoomStep, logicalPosition);
          final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: false,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );
          setState(() {
            _currentTransform = cappedTransform;
          });
        } else if (pressedKeys.contains(LogicalKeyboardKey.minus)) {
          final newTransform =
              _currentTransform.applyZoom(1.0 / zoomStep, logicalPosition);
          final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
            transform: newTransform,
            diagramRect: _logicalExtent,
            size: size,
            dynamic: false,
            minZoom: _config.minZoom,
            maxZoom: _config.maxZoom,
          );
          setState(() {
            _currentTransform = cappedTransform;
          });
        }
      },
    );
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

  /// Recalculate transform constraints when logical extent or viewport changes.
  ///
  /// This ensures the current transform respects the new constraints
  /// (zoom limits and fit-to-viewport requirements).
  void _recalculateTransformConstraints() {
    final size = context.size;
    if (size == null) return;

    // Apply zoom limits to current transform
    final constrainedTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: _currentTransform,
      diagramRect: _logicalExtent,
      size: size,
      dynamic: false, // Use strict constraints for recalculation
      minZoom: _config.minZoom,
      maxZoom: _config.maxZoom,
    );

    // Only update if the transform actually changed
    if (constrainedTransform != _currentTransform) {
      setState(() {
        _currentTransform = constrainedTransform;
      });
    }
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

    // Draw background - ALWAYS paint the entire canvas first
    _drawBackground(canvas, size);

    // Draw diagram area (white background for the diagram)
    _drawDiagramArea(canvas);

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
      ..color = Colors.grey.shade200 // Light gray background
      ..style = PaintingStyle.fill;

    // Paint the entire transformed area to prevent artifacts
    // Use a large rect to ensure we cover all possible transformed areas
    final largeRect = Rect.fromCenter(
      center: Offset.zero,
      width: size.width * 10, // Much larger than needed
      height: size.height * 10,
    );
    canvas.drawRect(largeRect, backgroundPaint);
  }

  /// Draw the diagram area (white background).
  void _drawDiagramArea(Canvas canvas) {
    final diagramAreaPaint = Paint()
      ..color = Colors.white // White background for diagram area
      ..style = PaintingStyle.fill;

    // Paint the diagram area on top of the background
    canvas.drawRect(logicalExtent, diagramAreaPaint);
  }

  /// Draw all objects in z-order.
  void _drawObjects(Canvas canvas) {
    // Sort objects by z-order
    final sortedObjects = List<DiagramObjectEntity>.from(objects)
      ..sort((a, b) => a.zOrder.compareTo(b.zOrder));

    for (final object in sortedObjects) {
      if (object.isVisible) {
        object.paint(canvas); // ← RIMOSSO transform!
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
  bool shouldRepaint(covariant _DiagramPainter oldDelegate) {
    return transform != oldDelegate.transform ||
        objects != oldDelegate.objects ||
        logicalExtent != oldDelegate.logicalExtent ||
        configuration != oldDelegate.configuration ||
        debug != oldDelegate.debug;
  }
}
