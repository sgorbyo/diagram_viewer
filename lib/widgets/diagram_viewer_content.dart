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
import 'package:diagram_viewer/internal/services/auto_scroll_service.dart';

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
  final AutoScrollService _autoScroll = AutoScrollService();
  bool _dragOverlayVisible = false;
  Offset _dragOverlayLocalPosition = Offset.zero; // local to viewer
  Object? _dragOverlaySpec;
  Size _lastViewportSize = Size.zero;
  bool _wasMultiTouchGesture = false;
  bool _draggingOnObject = false;
  bool _isDnDInside = false;
  CursorEffect _cursorEffect = CursorEffect.basic;
  Offset? _dragOverlayLocalCenter; // last pointer local center for overlay

  double _ghostDiameterFor(Object? spec, double scale) {
    try {
      if (spec is Map) {
        final radius = (spec['radius'] as num?)?.toDouble();
        if (radius != null) {
          final px = 2.0 * radius * (scale <= 0 ? 1.0 : scale);

          return px.clamp(8.0, 512.0);
        }
      }
    } catch (_) {}

    return 24.0;
  }

  bool _isGhostFullyVisible(
      {required Offset topLeft, required double diameter}) {
    final Size viewport = _lastViewportSize;
    if (viewport == Size.zero) return false;
    final double right = topLeft.dx + diameter;
    final double bottom = topLeft.dy + diameter;
    return topLeft.dx >= 0.0 &&
        topLeft.dy >= 0.0 &&
        right <= viewport.width &&
        bottom <= viewport.height;
  }

  // removed unused helpers

  MouseCursor _toMouseCursor(CursorEffect effect) {
    switch (effect) {
      case CursorEffect.basic:
        return SystemMouseCursors.basic;
      case CursorEffect.forbidden:
        return SystemMouseCursors.forbidden;
      case CursorEffect.click:
        return SystemMouseCursors.click;
      case CursorEffect.text:
        return SystemMouseCursors.text;
      case CursorEffect.grab:
        return SystemMouseCursors.grab;
      case CursorEffect.grabbing:
        return SystemMouseCursors.grabbing;
      case CursorEffect.move:
        return SystemMouseCursors.move;
      case CursorEffect.copy:
        return SystemMouseCursors.copy;
    }
  }

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
            final interval = widget.configuration.autoScrollInterval;
            _autoScroll.startOrUpdate(
              velocity: velocity,
              interval: interval,
              onTick: (delta) {
                if (!mounted) return;
                final transformBloc = context.read<TransformBloc>();
                final currentTransform = transformBloc.state.transform;
                transformBloc.add(TransformEvent.pan(
                  delta: delta,
                  currentTransform: currentTransform,
                ));
              },
            );
          },
          stopAutoScroll: () {
            _autoScroll.stop();
          },
          showDragOverlay: (ghostSpec, position) {
            final box = context.findRenderObject() as RenderBox?;
            final local = box != null ? box.globalToLocal(position) : position;
            final scale = context.read<TransformBloc>().state.transform.scale;
            final diameter = _ghostDiameterFor(ghostSpec, scale);
            final topLeft = local - Offset(diameter / 2, diameter / 2);
            setState(() {
              _dragOverlayVisible = true;
              _dragOverlaySpec = ghostSpec;
              _dragOverlayLocalPosition = topLeft;
              _dragOverlayLocalCenter = local;
            });
          },
          updateDragOverlay: (position) {
            final box = context.findRenderObject() as RenderBox?;
            final local = box != null ? box.globalToLocal(position) : position;
            final scale = context.read<TransformBloc>().state.transform.scale;
            final diameter = _ghostDiameterFor(_dragOverlaySpec, scale);
            final topLeft = local - Offset(diameter / 2, diameter / 2);
            setState(() {
              _dragOverlayLocalPosition = topLeft;
              _dragOverlayLocalCenter = local;
            });
          },
          hideDragOverlay: () {
            setState(() {
              _dragOverlayVisible = false;
              _dragOverlaySpec = null;
              _dragOverlayLocalCenter = null;
            });
          },
          setCursor: (effect) {
            // Desktop/web: update MouseRegion cursor; mobile platforms ignore
            setState(() {
              _cursorEffect = effect;
            });
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
      dndTargetEnter: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        // No default pan/zoom behavior for DnD target enter
      },
      dndTargetOver: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        // No default pan/zoom behavior for DnD target over
      },
      dndTargetLeave: (eventId, transformSnapshot, timestamp) {
        // No default pan/zoom behavior for DnD target leave
      },
      dndTargetDrop: (eventId, data, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        // No default pan/zoom behavior for DnD target drop
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
                final box = context.findRenderObject() as RenderBox?;
                final topLeftGlobal = box?.localToGlobal(Offset.zero);
                eventBloc.configureDependencies(
                  transformBloc: transformBloc,
                  configuration: widget.configuration,
                  viewportSize: currentSize,
                  viewportTopLeft: topLeftGlobal,
                );
              });
              _lastViewportSize = currentSize;
            }

            return KeyboardListener(
              focusNode: _keyboardFocusNode,
              autofocus: true,
              onKeyEvent: (event) => _handleKeyEvent(context, event),
              child: MouseRegion(
                key: ValueKey('cursor_${_cursorEffect.name}'),
                cursor: _toMouseCursor(_cursorEffect),
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
                  child: Stack(
                    children: [
                      GestureDetector(
                        onScaleStart: (details) =>
                            _handleScaleStart(context, details, appBarHeight),
                        onScaleUpdate: (details) =>
                            _handleScaleUpdate(context, details, appBarHeight),
                        onScaleEnd: (details) =>
                            _handleScaleEnd(context, details),
                        child: ClipRect(
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
                      // DnD ghost overlay and DragTarget layer
                      Positioned.fill(
                        child: DragTarget<Map<String, dynamic>>(
                          onWillAcceptWithDetails: (details) => true,
                          onAcceptWithDetails: (details) {
                            final globalPos = details.offset;
                            final box =
                                context.findRenderObject() as RenderBox?;
                            final localPos = box != null
                                ? box.globalToLocal(globalPos)
                                : globalPos;

                            // Centro di drop coincidente con il puntatore
                            final scale = transformState.transform.scale;
                            final ghostSize =
                                _ghostDiameterFor(details.data, scale);
                            // Opzione A: feedback e ghost centrati sul cursore
                            final localCenter = localPos;
                            final logicalPos = transformState.transform
                                .physicalToLogical(localCenter);
                            final globalCenter = globalPos;
                            // Se il ghost non è interamente visibile, annulla il drop
                            final topLeft = localCenter -
                                Offset(ghostSize / 2, ghostSize / 2);
                            final fullyVisible = _isGhostFullyVisible(
                                topLeft: topLeft, diameter: ghostSize);
                            if (!fullyVisible) {
                              setState(() {
                                _dragOverlayVisible = false;
                                _dragOverlaySpec = null;
                                _isDnDInside = false;
                              });
                              return;
                            }
                            final translatedDrop = _translator.translate(
                              PhysicalEvent.dndTargetDrop(
                                eventId: UniqueKey().toString(),
                                data: details.data,
                                screenPosition: globalCenter,
                                logicalPosition: logicalPos,
                                transformSnapshot: transformState.transform,
                                timestamp: Duration(
                                    milliseconds:
                                        DateTime.now().millisecondsSinceEpoch),
                              ),
                            );
                            if (translatedDrop != null) {
                              widget.controller.eventsSink.add(translatedDrop);
                            }
                            final translatedLeave = _translator.translate(
                              PhysicalEvent.dndTargetLeave(
                                eventId: UniqueKey().toString(),
                                transformSnapshot: transformState.transform,
                                timestamp: Duration(
                                    milliseconds:
                                        DateTime.now().millisecondsSinceEpoch),
                              ),
                            );
                            if (translatedLeave != null) {
                              widget.controller.eventsSink.add(translatedLeave);
                            }
                            // Hide overlay on drop
                            setState(() {
                              _dragOverlayVisible = false;
                              _dragOverlaySpec = null;
                              _isDnDInside = false;
                            });
                          },
                          onMove: (details) {
                            final globalPos = details.offset;
                            final box =
                                context.findRenderObject() as RenderBox?;
                            final localPos = box != null
                                ? box.globalToLocal(globalPos)
                                : globalPos;

                            // Opzione A: feedback e ghost centrati sul cursore
                            final localCenter = localPos;
                            final logicalPos = transformState.transform
                                .physicalToLogical(localCenter);
                            if (!_isDnDInside) {
                              final globalCenter = globalPos;
                              final translatedEnter = _translator.translate(
                                PhysicalEvent.dndTargetEnter(
                                  eventId: UniqueKey().toString(),
                                  dataPreview: details.data,
                                  screenPosition: globalCenter,
                                  logicalPosition: logicalPos,
                                  transformSnapshot: transformState.transform,
                                  timestamp: Duration(
                                      milliseconds: DateTime.now()
                                          .millisecondsSinceEpoch),
                                ),
                              );
                              if (translatedEnter != null) {
                                widget.controller.eventsSink
                                    .add(translatedEnter);
                              }
                              _isDnDInside = true;
                            }
                            final translatedOver = _translator.translate(
                              PhysicalEvent.dndTargetOver(
                                eventId: UniqueKey().toString(),
                                dataPreview: details.data,
                                screenPosition: globalPos,
                                logicalPosition: logicalPos,
                                transformSnapshot: transformState.transform,
                                timestamp: Duration(
                                    milliseconds:
                                        DateTime.now().millisecondsSinceEpoch),
                              ),
                            );
                            if (translatedOver != null) {
                              widget.controller.eventsSink.add(translatedOver);
                            }
                            // Aggiorna overlay centrato sulla posizione corrente (fallback automatico)
                            final scale = transformState.transform.scale;
                            final ghostDiameter =
                                _ghostDiameterFor(details.data, scale);
                            final topLeft = localCenter -
                                Offset(ghostDiameter / 2, ghostDiameter / 2);

                            setState(() {
                              _dragOverlayVisible = true;
                              _dragOverlaySpec = details.data;
                              _dragOverlayLocalPosition = topLeft;
                              _dragOverlayLocalCenter = localCenter;
                            });
                          },
                          onLeave: (data) {
                            widget.controller.eventsSink.add(
                              DiagramEventUnion.dragTargetLeave(
                                eventId: UniqueKey().toString(),
                                transformSnapshot: transformState.transform,
                                timestamp: Duration(
                                    milliseconds:
                                        DateTime.now().millisecondsSinceEpoch),
                              ),
                            );
                            setState(() {
                              _dragOverlayVisible = false;
                              _dragOverlaySpec = null;
                              _isDnDInside = false;
                            });
                          },
                          builder: (context, candidate, rejected) {
                            // Mostra il ghost solo quando il feedback entra realmente nella view (candidate non vuoto)
                            // e quando il centro calcolato coincide con la posizione del feedback (non solo del cursore)
                            if (!_dragOverlayVisible || candidate.isEmpty) {
                              return const SizedBox();
                            }
                            final scale = transformState.transform.scale;
                            final ghostDiameter =
                                _ghostDiameterFor(_dragOverlaySpec, scale);
                            // Re-centra dinamicamente in base alla center locale registrata
                            final center = _dragOverlayLocalCenter ??
                                (_dragOverlayLocalPosition +
                                    Offset(
                                        ghostDiameter / 2, ghostDiameter / 2));
                            final dynamicTopLeft = center -
                                Offset(ghostDiameter / 2, ghostDiameter / 2);
                            if (!_isGhostFullyVisible(
                                topLeft: dynamicTopLeft,
                                diameter: ghostDiameter)) {
                              return const SizedBox();
                            }

                            return IgnorePointer(
                              child: CustomSingleChildLayout(
                                delegate: _OverlayPositionDelegate(
                                  position: dynamicTopLeft,
                                  desiredSize:
                                      Size(ghostDiameter, ghostDiameter),
                                ),
                                child: RepaintBoundary(
                                  key: const ValueKey('drag_ghost_overlay'),
                                  child: _GhostWidget(
                                    spec: _dragOverlaySpec,
                                    size: Size(ghostDiameter, ghostDiameter),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
    _autoScroll.stop();
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Convert global position to viewer-local coordinates
    final box = context.findRenderObject() as RenderBox?;
    final correctedPosition =
        box != null ? box.globalToLocal(event.position) : event.position;

    // Perform hit-testing
    final hitResults = _performHitTesting(correctedPosition, currentTransform);

    // Convert to logical position
    final logicalPosition =
        currentTransform.physicalToLogical(correctedPosition);

    // Send to EventManagementBloc with original rawEvent; bloc will convert for viewport
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

    // Convert global position to viewer-local coordinates
    final box = context.findRenderObject() as RenderBox?;
    final correctedPosition =
        box != null ? box.globalToLocal(event.position) : event.position;

    // Perform hit-testing
    final hitResults = _performHitTesting(correctedPosition, currentTransform);

    // Convert to logical position
    final logicalPosition =
        currentTransform.physicalToLogical(correctedPosition);

    // Send to EventManagementBloc with original rawEvent; bloc will convert for viewport
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
    _autoScroll.stop();
    final eventBloc = context.read<EventManagementBloc>();

    // Send to EventManagementBloc with original rawEvent; bloc will convert for viewport
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
    _autoScroll.stop();
    if (event is PointerScrollEvent) {
      final transformBloc = context.read<TransformBloc>();
      final currentTransform = transformBloc.state.transform;

      // Convert global position to viewer-local coordinates
      final box = context.findRenderObject() as RenderBox?;
      final correctedPosition =
          box != null ? box.globalToLocal(event.position) : event.position;

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
    _autoScroll.stop();
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Convert global focal point to viewer-local coordinates
    final box = context.findRenderObject() as RenderBox?;
    final correctedPosition = box != null
        ? box.globalToLocal(details.focalPoint)
        : details.focalPoint;

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

    // Convert global focal point to viewer-local coordinates
    final box = context.findRenderObject() as RenderBox?;
    final correctedPosition = box != null
        ? box.globalToLocal(details.focalPoint)
        : details.focalPoint;

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
    _autoScroll.stop();
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
    _autoScroll.stop();
    _physicalEventSubscription?.cancel();
    _commandSubscription?.cancel();
    _keyboardFocusNode.dispose();
    super.dispose();
  }
}

class _OverlayPositionDelegate extends SingleChildLayoutDelegate {
  final Offset position; // local top-left
  final Size desiredSize;
  const _OverlayPositionDelegate(
      {required this.position, required this.desiredSize});

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Posiziona il ghost con il suo top-left al punto indicato
    final maxX = (size.width - childSize.width).clamp(0.0, double.infinity);
    final maxY = (size.height - childSize.height).clamp(0.0, double.infinity);
    final dx = position.dx.clamp(0.0, maxX);
    final dy = position.dy.clamp(0.0, maxY);
    return Offset(dx, dy);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // suggerisce al layout la size desiderata
    final w = desiredSize.width.clamp(0.0, constraints.maxWidth);
    final h = desiredSize.height.clamp(0.0, constraints.maxHeight);
    return Size(w, h);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // vincola il child alla size del ghost
    return BoxConstraints.tight(desiredSize);
  }

  @override
  bool shouldRelayout(covariant _OverlayPositionDelegate oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.desiredSize != desiredSize;
  }
}

class _GhostWidget extends StatelessWidget {
  final Object? spec;
  final Size size;
  const _GhostWidget({required this.spec, this.size = const Size(24, 24)});

  @override
  Widget build(BuildContext context) {
    // Ghost senza riempimento: solo bordo, per evitare un cerchio pieno invadente
    return Container(
      key: const ValueKey('drag_ghost_overlay_inner'),
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.7)),
      ),
    );
  }
}
