import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' hide HitTestResult;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_state.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_state.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
// removed duplicate/unused imports
import 'diagram_painter.dart';

/// Content widget for DiagramViewer that handles:
/// - UI event capture and routing to EventManagementBloc
/// - Physical event enrichment with hit-testing and context
/// - Translation of PhysicalEvents to DiagramEvents
/// - Communication with the controller via DiagramEvents
/// - Rendering the diagram with current transform state
class DiagramViewerContent extends StatefulWidget {
  final IDiagramController controller;
  final DiagramConfiguration configuration;
  final bool debug;

  const DiagramViewerContent({
    super.key,
    required this.controller,
    required this.configuration,
    required this.debug,
  });

  @override
  State<DiagramViewerContent> createState() => _DiagramViewerContentState();
}

class _DiagramViewerContentState extends State<DiagramViewerContent> {
  final DiagramEventTranslator _translator = DiagramEventTranslator();
  final FocusNode _keyboardFocusNode = FocusNode();
  final Set<LogicalKeyboardKey> _pressedKeys = {};
  StreamSubscription<PhysicalEvent>? _physicalEventSubscription;
  StreamSubscription<DiagramCommand>? _commandSubscription;
  Timer? _autoScrollTimer;
  Offset _autoScrollVelocity = Offset.zero;
  bool _autoScrollActive = false;
  Size _lastViewportSize = Size.zero;
  bool _wasMultiTouchGesture = false;
  bool _draggingOnObject = false;

  @override
  void initState() {
    super.initState();
    // Set up listener for PhysicalEvents from EventManagementBloc
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Setup subscriptions after first frame
      final eventBloc = context.read<EventManagementBloc>();
      _physicalEventSubscription =
          eventBloc.physicalEvents.listen((physicalEvent) {
        // Translate PhysicalEvent to DiagramEventUnion
        final diagramEvent = _translator.translate(physicalEvent);
        if (diagramEvent != null) {
          // Forward DiagramEventUnion to controller
          widget.controller.eventsSink.add(diagramEvent);
        }
      });

      // Set up listener for DiagramCommands from controller
      _commandSubscription = widget.controller.commandStream.listen((command) {
        // Handle different types of commands
        command.when(
          applyDefaultPanZoom: (origin) {
            // Forward to EventManagementBloc for default pan/zoom behavior
            // Convert the PhysicalEvent back to the appropriate event type
            // The EventManagementBloc will handle the default pan/zoom behavior
            _handlePhysicalEventForDefaultBehavior(origin);
          },
          setTransform: (transform) {
            final transformBloc = context.read<TransformBloc>();
            // During an active pointer drag, we let the viewer handle pan internally
            final eventBloc = context.read<EventManagementBloc>();
            if (eventBloc.state is PointerActiveState) {
              return;
            }
            final state = transformBloc.state;
            // Cap to legal target while preserving centering window, without re-centering
            final capped = Transform2DUtils.capTransformWithZoomLimits(
              transform: transform,
              diagramRect: state.diagramRect,
              size: state.viewportSize,
              dynamic: false,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            transformBloc
                .add(TransformEvent.updateTransform(transform: capped));
          },
          redraw: (renderables, logicalExtent) {
            // Trigger rebuild when a redraw command is received
            setState(() {
              // This will trigger a rebuild with updated objects
            });

            // Update diagram bounds in TransformBloc so limits and centering adapt
            final transformBloc = context.read<TransformBloc>();
            final currentViewportSize = transformBloc.state.viewportSize;
            final eventBloc = context.read<EventManagementBloc>();
            final isPointerActive = eventBloc.state is PointerActiveState;
            if (isPointerActive) {
              transformBloc.setFrozenDuringDrag(true);
            }

            if (currentViewportSize != Size.zero) {
              transformBloc.add(
                TransformEvent.updateDiagramBounds(
                  diagramRect: logicalExtent,
                  viewportSize: currentViewportSize,
                ),
              );
            }
          },
          elasticBounceBack: (targetTransform, duration) {
            // Forward to TransformBloc for bounce back
            final transformBloc = context.read<TransformBloc>();
            transformBloc.add(
                TransformEvent.updateTransform(transform: targetTransform));
          },
          autoScrollStep: (velocity, stepDuration) {
            // Start or update auto-scroll loop driven by controller commands
            _autoScrollVelocity = velocity;
            final interval = widget.configuration.autoScrollInterval;
            // If velocity is near zero, stop the loop
            if (_autoScrollVelocity.dx.abs() < 0.0001 &&
                _autoScrollVelocity.dy.abs() < 0.0001) {
              // ignore: avoid_print
              print('[Viewer] stop auto-scroll due to ~zero velocity');
              _autoScrollTimer?.cancel();
              _autoScrollTimer = null;
              _autoScrollActive = false;
              return;
            }
            // If already running, do not recreate the timer
            if (_autoScrollActive && _autoScrollTimer != null) return;
            _autoScrollTimer?.cancel();
            _autoScrollActive = true;
            _autoScrollTimer = Timer.periodic(interval, (_) {
              if (!mounted) return;
              final transformBloc = context.read<TransformBloc>();
              final currentTransform = transformBloc.state.transform;
              final dtSeconds = interval.inMilliseconds / 1000.0;
              final delta = Offset(
                _autoScrollVelocity.dx * dtSeconds,
                _autoScrollVelocity.dy * dtSeconds,
              );
              // ignore: avoid_print
              print('[Viewer] auto-scroll tick delta=$delta');
              // If external stop was requested while looping
              if (!_autoScrollActive) {
                // ignore: avoid_print
                print(
                    '[Viewer] timer observed _autoScrollActive=false, cancelling');
                _autoScrollTimer?.cancel();
                _autoScrollTimer = null;
                return;
              }
              transformBloc.add(TransformEvent.pan(
                delta: delta,
                currentTransform: currentTransform,
              ));
            });
          },
          stopAutoScroll: () {
            // ignore: avoid_print
            print('[Viewer] stopAutoScroll command received');
            _autoScrollTimer?.cancel();
            _autoScrollTimer = null;
            _autoScrollVelocity = Offset.zero;
            _autoScrollActive = false;
          },
        );
      });
    });
  }

  // (removed duplicate dispose override; we already dispose at bottom)

  /// Handle PhysicalEvent for default pan/zoom behavior
  void _handlePhysicalEventForDefaultBehavior(PhysicalEvent event) {
    final eventBloc = context.read<EventManagementBloc>();

    // Handle different types of PhysicalEvent
    event.when(
      pointer: (eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          borderProximity,
          phase,
          rawEvent,
          delta,
          currentViewport,
          pressedMouseButtons,
          pressedKeys,
          activeInteraction) {
        // Forward pointer event to EventManagementBloc
        eventBloc.add(EventManagementEvent.startPointerEvent(
          rawEvent: rawEvent,
          logicalPosition: logicalPosition,
          hitResults: hitList
              .map((obj) => HitTestResult(
                    object: obj,
                    distanceFromCenter: 0.0,
                    hitPoint: logicalPosition,
                  ))
              .toList(),
          pressedKeys: pressedKeys,
        ));
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
          currentViewport,
          pressedKeys,
          activeInteraction) {
        // Forward gesture event to EventManagementBloc
        // Note: rawEvent is Object for gesture events, so we need to handle it differently
        // For now, we'll skip gesture events in this context
      },
      keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys,
          currentViewport, activeInteraction) {
        // Forward keyboard event to EventManagementBloc
        eventBloc.add(EventManagementEvent.startKeyboardEvent(
          rawEvent: rawEvent,
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransformBloc, TransformState>(
      builder: (context, transformState) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Get the media query to calculate the correct offset
            final mediaQuery = MediaQuery.of(context);
            final topPadding = mediaQuery.padding.top;

            // Calculate the total offset including AppBar height
            // AppBar height is typically kToolbarHeight (56.0) + status bar height
            final appBarHeight = kToolbarHeight + topPadding;

            // Detect viewport size change and update TransformBloc bounds
            final currentSize = constraints.biggest;
            if (currentSize != _lastViewportSize && currentSize != Size.zero) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                final transformBloc = context.read<TransformBloc>();
                final eventBloc = context.read<EventManagementBloc>();
                final isPointerActive = eventBloc.state.maybeWhen(
                  pointerActive: (
                    String eventId,
                    Set<MouseButton> pressedMouseButtons,
                    Set<LogicalKeyboardKey> pressedKeys,
                    DateTime startTime,
                    Offset startPosition,
                    Offset lastPosition,
                    List<DiagramObjectEntity> lastHitList,
                  ) =>
                      true,
                  orElse: () => false,
                );
                if (isPointerActive) {
                  transformBloc.setFrozenDuringDrag(true);
                }
                // Update bounds in TransformBloc
                transformBloc.add(
                  TransformEvent.updateDiagramBounds(
                    diagramRect: widget.controller.logicalExtent,
                    viewportSize: currentSize,
                  ),
                );

                // Keep EventManagementBloc dependencies in sync with latest viewport
                eventBloc.configureDependencies(
                  transformBloc: transformBloc,
                  configuration: widget.configuration,
                  viewportSize: currentSize,
                );
              });
              _lastViewportSize = currentSize;
            }

            return KeyboardListener(
              focusNode: _keyboardFocusNode,
              autofocus: true,
              onKeyEvent: (event) => _handleKeyEvent(context, event),
              child: Listener(
                onPointerDown: (event) {
                  // Request focus when user taps
                  _keyboardFocusNode.requestFocus();
                  _handlePointerDown(context, event, appBarHeight);
                },
                onPointerMove: (event) =>
                    _handlePointerMove(context, event, appBarHeight),
                onPointerUp: (event) => _handlePointerUp(context, event),
                onPointerSignal: (event) =>
                    _handlePointerSignal(context, event, appBarHeight),
                child: GestureDetector(
                  onScaleStart: (details) =>
                      _handleScaleStart(context, details, appBarHeight),
                  onScaleUpdate: (details) =>
                      _handleScaleUpdate(context, details, appBarHeight),
                  onScaleEnd: (details) => _handleScaleEnd(context, details),
                  child: CustomPaint(
                    painter: DiagramPainter(
                      transform: transformState.transform,
                      objects: widget.controller.objects,
                      logicalExtent: widget.controller.logicalExtent,
                      configuration: widget.configuration,
                      debug: widget.debug,
                    ),
                    size: Size.infinite,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Handle pointer down events
  void _handlePointerDown(
      BuildContext context, PointerDownEvent event, double topPadding) {
    // Any new input should stop auto-scroll
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
    _autoScrollVelocity = Offset.zero;
    _autoScrollActive = false;
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Correct the position by subtracting the top padding offset
    final correctedPosition =
        Offset(event.position.dx, event.position.dy - topPadding);

    // Perform hit-testing
    final hitResults = _performHitTesting(correctedPosition, currentTransform);

    // Convert to logical position
    final logicalPosition =
        currentTransform.physicalToLogical(correctedPosition);

    // Send to EventManagementBloc
    eventBloc.add(EventManagementEvent.startPointerEvent(
      rawEvent: event,
      logicalPosition: logicalPosition,
      hitResults: hitResults,
      pressedKeys: _pressedKeys,
    ));

    // Freeze transform recentering during drag/pan lifecycle
    context.read<TransformBloc>().setFrozenDuringDrag(true);

    // Record if this pointer interaction started on an object to isolate drag from pan
    _draggingOnObject = hitResults.isNotEmpty;
  }

  /// Handle pointer move events
  void _handlePointerMove(
      BuildContext context, PointerMoveEvent event, double topPadding) {
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Correct the position by subtracting the top padding offset
    final correctedPosition =
        Offset(event.position.dx, event.position.dy - topPadding);

    // Perform hit-testing
    final hitResults = _performHitTesting(correctedPosition, currentTransform);

    // Convert to logical position
    final logicalPosition =
        currentTransform.physicalToLogical(correctedPosition);

    // Send to EventManagementBloc
    eventBloc.add(EventManagementEvent.updatePointerEvent(
      rawEvent: event,
      logicalPosition: logicalPosition,
      hitResults: hitResults,
      pressedKeys: _pressedKeys,
    ));

    // Apply pan only when dragging empty area and we did not start on an object
    if (hitResults.isEmpty && !_draggingOnObject) {
      transformBloc.add(TransformEvent.pan(
        delta: event.delta,
        currentTransform: currentTransform,
      ));
    }

    // Do not synthesize DiagramDragContinue here; rely on translator from PhysicalEvents
  }

  /// Handle pointer up events
  void _handlePointerUp(BuildContext context, PointerUpEvent event) {
    // Stop auto-scroll on pointer up
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
    _autoScrollVelocity = Offset.zero;
    _autoScrollActive = false;
    final eventBloc = context.read<EventManagementBloc>();

    // Send to EventManagementBloc
    eventBloc.add(EventManagementEvent.endPointerEvent(
      rawEvent: event,
      pressedKeys: _pressedKeys,
    ));

    // Unfreeze and bounce-back at drag end using configured duration
    final transformBloc = context.read<TransformBloc>();
    transformBloc.setFrozenDuringDrag(false);
    transformBloc.clearBounceBackFlag();
    transformBloc.bounceBack(widget.configuration.bounceDuration);

    // Reset isolation flag
    _draggingOnObject = false;
  }

  /// Handle pointer signal events (mouse wheel)
  void _handlePointerSignal(
      BuildContext context, PointerSignalEvent event, double topPadding) {
    // Stop auto-scroll on new pointer signal
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
    _autoScrollVelocity = Offset.zero;
    _autoScrollActive = false;
    if (event is PointerScrollEvent) {
      final transformBloc = context.read<TransformBloc>();
      final currentTransform = transformBloc.state.transform;

      // Correct the position by subtracting the top padding offset
      final correctedPosition =
          Offset(event.position.dx, event.position.dy - topPadding);

      // Perform hit-testing
      final hitResults =
          _performHitTesting(correctedPosition, currentTransform);

      // Convert to logical position
      final logicalPosition =
          currentTransform.physicalToLogical(correctedPosition);

      // Use translator to create DiagramScroll event
      final diagramEvent = _translator.handleScrollEvent(
        DateTime.now().microsecondsSinceEpoch.toString(),
        logicalPosition,
        correctedPosition,
        currentTransform,
        hitResults.map((r) => r.object).toList(),
        event,
      );

      if (diagramEvent != null) {
        // Forward DiagramScroll event directly to controller
        widget.controller.eventsSink.add(diagramEvent);
      }
    }
  }

  /// Handle scale start events
  void _handleScaleStart(
      BuildContext context, ScaleStartDetails details, double topPadding) {
    // Stop auto-scroll on new gesture
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
    _autoScrollVelocity = Offset.zero;
    _autoScrollActive = false;
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Correct the position by subtracting the top padding offset
    final correctedPosition =
        Offset(details.focalPoint.dx, details.focalPoint.dy - topPadding);

    // Perform hit-testing
    final hitResults = _performHitTesting(correctedPosition, currentTransform);

    // Convert to logical position
    final logicalPosition =
        currentTransform.physicalToLogical(correctedPosition);

    // Start gesture only for multi-pointer interactions
    _wasMultiTouchGesture = details.pointerCount > 1;
    if (_wasMultiTouchGesture) {
      eventBloc.add(EventManagementEvent.startGestureEvent(
        rawEvent: details,
        logicalPosition: logicalPosition,
        hitResults: hitResults,
        pressedKeys: _pressedKeys,
      ));
    }
  }

  /// Handle scale update events
  void _handleScaleUpdate(
      BuildContext context, ScaleUpdateDetails details, double topPadding) {
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Correct the position by subtracting the top padding offset
    final correctedPosition =
        Offset(details.focalPoint.dx, details.focalPoint.dy - topPadding);

    // Perform hit-testing
    final hitResults = _performHitTesting(correctedPosition, currentTransform);

    // Convert to logical position
    final logicalPosition =
        currentTransform.physicalToLogical(correctedPosition);

    // Handle only zoom from scale details; do NOT handle pan here
    if (details.scale != 1.0 && details.pointerCount > 1) {
      transformBloc.add(TransformEvent.zoom(
        scale: details.scale,
        focalPoint: logicalPosition,
        currentTransform: currentTransform,
      ));

      // Send to EventManagementBloc for event tracking (gesture path)
      eventBloc.add(EventManagementEvent.updateGestureEvent(
        rawEvent: details,
        logicalPosition: logicalPosition,
        hitResults: hitResults,
        pressedKeys: _pressedKeys,
      ));
    }

    // For single-pointer, do not send gesture updates here; pointer move handlers manage drag/pan
  }

  /// Handle scale end events
  void _handleScaleEnd(BuildContext context, ScaleEndDetails details) {
    final eventBloc = context.read<EventManagementBloc>();

    // Send to EventManagementBloc
    eventBloc.add(EventManagementEvent.endGestureEvent(
      rawEvent: details,
      pressedKeys: _pressedKeys,
    ));

    // Ensure bounce-back only after real multi-touch gesture ends
    final transformBloc = context.read<TransformBloc>();
    transformBloc.setFrozenDuringDrag(false);
    if (_wasMultiTouchGesture) {
      // Dopo pinch: se la posizione corrente è già legale e centrata dove necessario, evita timer
      final state = transformBloc.state;
      final target = Transform2DUtils.capTransformWithZoomLimits(
        transform: state.transform,
        diagramRect: state.diagramRect,
        size: state.viewportSize,
        dynamic: false,
        minZoom: widget.configuration.minZoom,
        maxZoom: widget.configuration.maxZoom,
        preserveCentering: true,
        recenterSmallContent: true,
      );
      final distance =
          (target.translation - state.transform.translation).distance;
      if (distance > 0.5 ||
          (target.scale - state.transform.scale).abs() > 0.001) {
        transformBloc.clearBounceBackFlag();
        transformBloc.bounceBack(widget.configuration.bounceDuration);
      }
    }
    _wasMultiTouchGesture = false;
  }

  /// Handle key events for keyboard interaction
  void _handleKeyEvent(BuildContext context, KeyEvent event) {
    // Stop auto-scroll on keyboard activity
    _autoScrollTimer?.cancel();
    _autoScrollActive = false;
    _autoScrollTimer = null;
    _autoScrollVelocity = Offset.zero;
    // Ensure we have focus before processing keyboard events
    if (!_keyboardFocusNode.hasFocus) {
      _keyboardFocusNode.requestFocus();
    }

    if (event is KeyDownEvent) {
      _pressedKeys.add(event.logicalKey);
      // Update the EventManagementBloc with the new pressed keys
      final eventBloc = context.read<EventManagementBloc>();
      eventBloc.add(EventManagementEvent.updateModifierKeys(
        keys: Set.from(_pressedKeys),
      ));
    } else if (event is KeyUpEvent) {
      _pressedKeys.remove(event.logicalKey);
      // Update the EventManagementBloc with the updated pressed keys
      final eventBloc = context.read<EventManagementBloc>();
      eventBloc.add(EventManagementEvent.updateModifierKeys(
        keys: Set.from(_pressedKeys),
      ));
    }
  }

  /// Perform hit-testing to find objects at the given position
  List<HitTestResult> _performHitTesting(
      Offset position, Transform2D transform) {
    final logicalPosition = transform.physicalToLogical(position);
    final results = <HitTestResult>[];

    for (final object in widget.controller.objects) {
      if (object.isVisible &&
          object.isInteractive &&
          object.contains(logicalPosition)) {
        final distance = (logicalPosition - object.center).distance;
        results.add(HitTestResult(
          object: object,
          distanceFromCenter: distance,
          hitPoint: logicalPosition,
        ));
      }
    }

    // Sort by distance (closest first)
    results
        .sort((a, b) => a.distanceFromCenter.compareTo(b.distanceFromCenter));
    return results;
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _physicalEventSubscription?.cancel();
    _commandSubscription?.cancel();
    _keyboardFocusNode.dispose();
    super.dispose();
  }
}
