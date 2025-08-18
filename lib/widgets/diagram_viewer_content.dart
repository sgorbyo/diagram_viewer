import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' hide HitTestResult;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/services/inertial_scroll_service.dart';
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
  final InertialScrollService _inertia = InertialScrollService();
  // Wheel inertia sampling
  final List<Offset> _recentWheelDeltas = <Offset>[]; // px per event
  final List<int> _recentWheelDeltaMs = <int>[]; // ms between events
  DateTime? _lastWheelEventTime;
  Duration? _lastWheelEventMonotonic;
  Timer? _wheelInertiaTimer;
  static const int _wheelInertiaMaxSamples = 24;
  bool _dragOverlayVisible = false;
  Offset _dragOverlayLocalPosition = Offset.zero; // local to viewer
  Object? _dragOverlaySpec;
  Size _lastViewportSize = Size.zero;
  bool _wasMultiTouchGesture = false;
  bool _draggingOnObject = false;
  bool _isDnDInside = false;
  CursorEffect _cursorEffect = CursorEffect.basic;
  Offset? _dragOverlayLocalCenter; // last pointer local center for overlay
  bool _overlayControlledByController = false;
  bool _isBouncingBack = false;
  Timer? _bounceFlagTimer;
  // Session window for Magic Mouse wheel scroll bursts
  Timer? _wheelScrollSessionTimer;
  bool _wheelScrollSessionActive = false;
  // Debounce timer for Ctrl/Cmd+wheel zoom to trigger bounce-back after user stops
  Timer? _wheelZoomBounceTimer;
  // Wheel-zoom anchoring: keep a stable focal across a burst to avoid drift
  Offset? _wheelZoomAnchorFocalLogical;
  Timer? _wheelZoomAnchorTimer;
  // Recent pointer movement samples for velocity estimation (physical space)
  DateTime? _lastPointerMoveTime;
  final List<Offset> _recentPointerDeltas = <Offset>[]; // px
  final List<int> _recentPointerDeltaMs = <int>[]; // ms per sample
  Offset? _lastPointerLocalPosition;
  bool _wasTwoFingerPan = false;

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
          // Optionally enrich with snapped positions based on configuration
          final cfg = widget.configuration;
          final enriched = diagramEvent.maybeWhen(
            dragTargetOver: (
              String eventId,
              Object dataPreview,
              Offset screenPosition,
              Offset logicalPosition,
              Transform2D transformSnapshot,
              Duration timestamp,
              Offset? existingSnapped,
            ) {
              final snapped = cfg.snapGridEnabled
                  ? Transform2DUtils.snapPointToGrid(
                      point: logicalPosition,
                      spacing: cfg.snapGridSpacing,
                      origin: cfg.snapGridOrigin,
                    )
                  : existingSnapped;
              return DiagramEventUnion.dragTargetOver(
                eventId: eventId,
                dataPreview: dataPreview,
                screenPosition: screenPosition,
                logicalPosition: logicalPosition,
                transformSnapshot: transformSnapshot,
                timestamp: timestamp,
                snappedLogicalPosition: snapped,
              );
            },
            dragContinue: (dragEvent) {
              final snapped = cfg.snapGridEnabled
                  ? Transform2DUtils.snapPointToGrid(
                      point: dragEvent.logicalPosition,
                      spacing: cfg.snapGridSpacing,
                      origin: cfg.snapGridOrigin,
                    )
                  : null;
              return DiagramEventUnion.dragContinue(
                dragEvent.copyWith(snappedLogicalPosition: snapped),
              );
            },
            dragEnd: (dragEndEvent) {
              final snapped = cfg.snapGridEnabled
                  ? Transform2DUtils.snapPointToGrid(
                      point: dragEndEvent.logicalPosition,
                      spacing: cfg.snapGridSpacing,
                      origin: cfg.snapGridOrigin,
                    )
                  : null;
              return DiagramEventUnion.dragEnd(
                dragEndEvent.copyWith(snappedLogicalPosition: snapped),
              );
            },
            dragTargetDrop: (
              String eventId,
              Object data,
              Offset screenPosition,
              Offset logicalPosition,
              Transform2D transformSnapshot,
              Duration timestamp,
              Offset? existingSnapped,
            ) {
              final snapped = cfg.snapGridEnabled
                  ? Transform2DUtils.snapPointToGrid(
                      point: logicalPosition,
                      spacing: cfg.snapGridSpacing,
                      origin: cfg.snapGridOrigin,
                    )
                  : existingSnapped;
              return DiagramEventUnion.dragTargetDrop(
                eventId: eventId,
                data: data,
                screenPosition: screenPosition,
                logicalPosition: logicalPosition,
                transformSnapshot: transformSnapshot,
                timestamp: timestamp,
                snappedLogicalPosition: snapped,
              );
            },
            orElse: () => diagramEvent,
          );

          // Forward DiagramEventUnion to controller
          widget.controller.eventsSink.add(enriched);
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

                // NEW: keep drag/object in sync during auto-scroll by synthesizing a pointer update
                final eventBloc = context.read<EventManagementBloc>();
                final state = eventBloc.state;
                if (state is PointerActiveState &&
                    _lastPointerLocalPosition != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted) return;
                    // Recompute hit results and logical position under current (updated) transform
                    final tNow = context.read<TransformBloc>().state.transform;
                    final local = _lastPointerLocalPosition!;
                    final hitResults = _performHitTesting(local, tNow);
                    final logicalPosition = tNow.physicalToLogical(local);
                    // Map pressed buttons from bloc state to Flutter PointerEvent bitmask
                    int buttonsMask = 0;
                    for (final b in state.pressedMouseButtons) {
                      switch (b) {
                        case MouseButton.left:
                          buttonsMask |= 1;
                          break;
                        case MouseButton.right:
                          buttonsMask |= 2;
                          break;
                        case MouseButton.middle:
                          buttonsMask |= 4;
                          break;
                        case MouseButton.back:
                          buttonsMask |= 8;
                          break;
                        case MouseButton.forward:
                          buttonsMask |= 16;
                          break;
                      }
                    }
                    // Synthesize a PointerMoveEvent with correct global position and buttons bitmask
                    final box = context.findRenderObject() as RenderBox?;
                    final global =
                        box != null ? box.localToGlobal(local) : local;
                    final synthetic = PointerMoveEvent(
                        position: global, buttons: buttonsMask);
                    eventBloc.add(EventManagementEvent.updatePointerEvent(
                      rawEvent: synthetic,
                      logicalPosition: logicalPosition,
                      hitResults: hitResults,
                      pressedKeys: _pressedKeys,
                    ));
                  });
                }
              },
            );
          },
          stopAutoScroll: () {
            _autoScroll.stop();
          },
          showDragOverlay: (ghostSpec, position) {
            final box = context.findRenderObject() as RenderBox?;
            final local = box != null ? box.globalToLocal(position) : position;
            final transform = context.read<TransformBloc>().state.transform;
            final scale = transform.scale;
            final diameter = _ghostDiameterFor(ghostSpec, scale);
            // Apply snap-to-grid if enabled (align ghost center to snapped logical)
            final cfg = widget.configuration;
            final snappedLocalCenter = cfg.snapGridEnabled
                ? transform.logicalToPhysical(
                    Transform2DUtils.snapPointToGrid(
                      point: transform.physicalToLogical(local),
                      spacing: cfg.snapGridSpacing,
                      origin: cfg.snapGridOrigin,
                    ),
                  )
                : local;
            final topLeft =
                snappedLocalCenter - Offset(diameter / 2, diameter / 2);
            setState(() {
              _dragOverlayVisible = true;
              _dragOverlaySpec = ghostSpec;
              _dragOverlayLocalPosition = topLeft;
              _dragOverlayLocalCenter = snappedLocalCenter;
              _overlayControlledByController = true;
            });
          },
          updateDragOverlay: (position) {
            final box = context.findRenderObject() as RenderBox?;
            final local = box != null ? box.globalToLocal(position) : position;
            final transform = context.read<TransformBloc>().state.transform;
            final scale = transform.scale;
            final diameter = _ghostDiameterFor(_dragOverlaySpec, scale);
            // Apply snap-to-grid if enabled (align ghost center to snapped logical)
            final cfg = widget.configuration;
            final snappedLocalCenter = cfg.snapGridEnabled
                ? transform.logicalToPhysical(
                    Transform2DUtils.snapPointToGrid(
                      point: transform.physicalToLogical(local),
                      spacing: cfg.snapGridSpacing,
                      origin: cfg.snapGridOrigin,
                    ),
                  )
                : local;
            final topLeft =
                snappedLocalCenter - Offset(diameter / 2, diameter / 2);
            setState(() {
              _dragOverlayLocalPosition = topLeft;
              _dragOverlayLocalCenter = snappedLocalCenter;
              _overlayControlledByController = true;
            });
          },
          hideDragOverlay: () {
            setState(() {
              _dragOverlayVisible = false;
              _dragOverlaySpec = null;
              _dragOverlayLocalCenter = null;
              _overlayControlledByController = false;
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
                  behavior: HitTestBehavior.opaque,
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
                            // Aggiorna overlay centrato sulla posizione corrente (snap opzionale)
                            final scale = transformState.transform.scale;
                            final ghostDiameter =
                                _ghostDiameterFor(details.data, scale);
                            // If snap grid enabled, align overlay center to snapped position
                            final cfg = widget.configuration;
                            final snappedLocalCenter = cfg.snapGridEnabled
                                ? transformState.transform.logicalToPhysical(
                                    Transform2DUtils.snapPointToGrid(
                                      point: transformState.transform
                                          .physicalToLogical(localCenter),
                                      spacing: cfg.snapGridSpacing,
                                      origin: cfg.snapGridOrigin,
                                    ),
                                  )
                                : localCenter;
                            final topLeft = snappedLocalCenter -
                                Offset(ghostDiameter / 2, ghostDiameter / 2);
                            if (!_overlayControlledByController) {
                              setState(() {
                                _dragOverlayVisible = true;
                                _dragOverlaySpec = details.data;
                                _dragOverlayLocalPosition = topLeft;
                                _dragOverlayLocalCenter = snappedLocalCenter;
                              });
                            }
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

                            // CRITICAL FIX: Update overlay position when transform changes (e.g., during auto-scroll)
                            if (_dragOverlayLocalCenter != null) {
                              final currentTransform = transformState.transform;
                              final scale = currentTransform.scale;
                              final ghostDiameter =
                                  _ghostDiameterFor(_dragOverlaySpec, scale);

                              // Convert stored logical center to new physical coordinates
                              final newPhysicalCenter =
                                  currentTransform.logicalToPhysical(
                                currentTransform.physicalToLogical(
                                    _dragOverlayLocalCenter!),
                              );

                              // Apply snap-to-grid if enabled
                              final cfg = widget.configuration;
                              final snappedPhysicalCenter = cfg.snapGridEnabled
                                  ? currentTransform.logicalToPhysical(
                                      Transform2DUtils.snapPointToGrid(
                                        point:
                                            currentTransform.physicalToLogical(
                                                _dragOverlayLocalCenter!),
                                        spacing: cfg.snapGridSpacing,
                                        origin: cfg.snapGridOrigin,
                                      ),
                                    )
                                  : newPhysicalCenter;

                              final newTopLeft = snappedPhysicalCenter -
                                  Offset(ghostDiameter / 2, ghostDiameter / 2);

                              // Update overlay position to match current transform
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  setState(() {
                                    _dragOverlayLocalPosition = newTopLeft;
                                    _dragOverlayLocalCenter =
                                        snappedPhysicalCenter;
                                  });
                                }
                              });
                            }

                            final scale = transformState.transform.scale;
                            final ghostDiameter =
                                _ghostDiameterFor(_dragOverlaySpec, scale);
                            // Re-centra dinamicamente in base alla center locale registrata
                            Offset center = _dragOverlayLocalCenter ??
                                (_dragOverlayLocalPosition +
                                    Offset(
                                        ghostDiameter / 2, ghostDiameter / 2));
                            // Enforce snap-to-grid at paint time as well, to guarantee alignment
                            if (widget.configuration.snapGridEnabled) {
                              final t = transformState.transform;
                              final snappedLogical =
                                  Transform2DUtils.snapPointToGrid(
                                point: t.physicalToLogical(center),
                                spacing: widget.configuration.snapGridSpacing,
                                origin: widget.configuration.snapGridOrigin,
                              );
                              center = t.logicalToPhysical(snappedLogical);
                            }
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
    if (_isBouncingBack) return;
    // Any new input should stop auto-scroll
    _autoScroll.stop();
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Convert global position to viewer-local coordinates
    final box = context.findRenderObject() as RenderBox?;
    final correctedPosition =
        box != null ? box.globalToLocal(event.position) : event.position;
    _lastPointerLocalPosition = correctedPosition;

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
    if (_isBouncingBack) return;
    final eventBloc = context.read<EventManagementBloc>();
    final transformBloc = context.read<TransformBloc>();
    final currentTransform = transformBloc.state.transform;

    // Convert global position to viewer-local coordinates
    final box = context.findRenderObject() as RenderBox?;
    final correctedPosition =
        box != null ? box.globalToLocal(event.position) : event.position;
    _lastPointerLocalPosition = correctedPosition;

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
    if (hitResults.isEmpty && !_draggingOnObject && event.buttons != 0) {
      transformBloc.add(TransformEvent.pan(
        delta: event.delta,
        currentTransform: currentTransform,
      ));
    }

    // Velocity sampling for inertia (physical)
    final now = DateTime.timestamp();
    if (_lastPointerMoveTime != null) {
      final dtMs = now.difference(_lastPointerMoveTime!).inMilliseconds;
      _recentPointerDeltaMs.add(dtMs);
      _recentPointerDeltas.add(event.delta);
      // Keep only last ~6 samples (~100ms at ~16ms/frame)
      while (_recentPointerDeltas.length > 6) {
        _recentPointerDeltas.removeAt(0);
        _recentPointerDeltaMs.removeAt(0);
      }
    }
    _lastPointerMoveTime = now;

    // Do not synthesize DiagramDragContinue here; rely on translator from PhysicalEvents
  }

  /// Handle pointer up events
  void _handlePointerUp(BuildContext context, PointerUpEvent event) {
    if (_isBouncingBack) return;
    // Stop auto-scroll on pointer up
    _autoScroll.stop();
    // Cancel any previous inertia
    _inertia.stop();
    final eventBloc = context.read<EventManagementBloc>();

    // Send to EventManagementBloc with original rawEvent; bloc will convert for viewport
    eventBloc.add(EventManagementEvent.endPointerEvent(
      rawEvent: event,
      pressedKeys: _pressedKeys,
    ));

    // Compute inertia if enabled and recent pointer velocity is high enough
    final transformBloc = context.read<TransformBloc>();
    final cfg = widget.configuration;
    if (cfg.enableInertialScrolling) {
      // If a bounce just started, do not start inertia
      if (_isBouncingBack) {
        _recentPointerDeltas.clear();
        _recentPointerDeltaMs.clear();
        return;
      }
      // Approximate velocity from recent pointer deltas
      Offset initialV = Offset.zero;
      int totalMs = 0;
      for (int i = 0; i < _recentPointerDeltas.length; i++) {
        initialV += _recentPointerDeltas[i];
        totalMs += _recentPointerDeltaMs[i];
      }
      if (totalMs > 0) {
        final seconds = totalMs / 1000.0;
        initialV = Offset(initialV.dx / seconds, initialV.dy / seconds);
      }
      if (initialV.distance > cfg.inertialMinStartVelocity) {
        // Start inertia in physical space
        _inertia.start(
          initialVelocity: initialV,
          interval: cfg.autoScrollInterval,
          frictionFactor: cfg.inertialFriction,
          minStopVelocity: cfg.inertialMinStopVelocity,
          maxDuration: cfg.inertialMaxDuration,
          onTick: (delta) {
            if (!mounted) return;
            // If a bounce-back is already in progress, stop inertia and ignore further ticks
            if (_isBouncingBack) {
              _inertia.stop();
              return;
            }
            // If a bounce-back is in progress, stop inertia immediately
            if (_isBouncingBack) {
              _inertia.stop();
              return;
            }
            final stateBefore = transformBloc.state;
            final proposed = stateBefore.transform.applyPan(delta);
            final dynamicCapped = Transform2DUtils.capTransformWithZoomLimits(
              transform: proposed,
              diagramRect: stateBefore.diagramRect,
              size: stateBefore.viewportSize,
              dynamic: true,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            final strict = Transform2DUtils.capTransformWithZoomLimits(
              transform: stateBefore.transform,
              diagramRect: stateBefore.diagramRect,
              size: stateBefore.viewportSize,
              dynamic: false,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            // Apply pan
            transformBloc.add(TransformEvent.pan(
              delta: delta,
              currentTransform: stateBefore.transform,
            ));
            // If capping altered the proposed translation, we hit elastic boundary → bounce now
            // For pointer-drag inertia, bounce earlier to match expectations
            final deviates =
                (proposed.translation - dynamicCapped.translation).distance >
                    0.5;
            // Or if proposed is beyond the dynamic window and delta keeps pushing outward, bounce now
            bool pinnedOutward = false;
            const double eps = 0.5;
            final border = Transform2DUtils.dynamicBorderWidth;
            final leftLimit = strict.translation.dx - border + eps;
            final rightLimit = strict.translation.dx + border - eps;
            final topLimit = strict.translation.dy - border + eps;
            final bottomLimit = strict.translation.dy + border - eps;
            final px = proposed.translation.dx;
            final py = proposed.translation.dy;
            if ((px <= leftLimit && delta.dx < 0) ||
                (px >= rightLimit && delta.dx > 0) ||
                (py <= topLimit && delta.dy < 0) ||
                (py >= bottomLimit && delta.dy > 0)) {
              pinnedOutward = true;
            }
            if (deviates || pinnedOutward) {
              _inertia.stop();
              transformBloc.setFrozenDuringDrag(false);
              transformBloc.clearBounceBackFlag();
              // Immediate bounce towards strict bounds
              _isBouncingBack = true;
              _bounceFlagTimer?.cancel();
              _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
                if (mounted) _isBouncingBack = false;
                _bounceFlagTimer = null;
              });
              transformBloc.bounceBack(widget.configuration.bounceDuration);
            }
          },
          onStop: () {
            if (!mounted) return;
            // If a bounce-back has already been initiated during inertia, avoid double-bounce
            if (_isBouncingBack) return;
            // After inertia ends, run bounce-back to return within limits
            transformBloc.setFrozenDuringDrag(false);
            transformBloc.clearBounceBackFlag();
            _isBouncingBack = true;
            _bounceFlagTimer?.cancel();
            _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
              if (mounted) _isBouncingBack = false;
              _bounceFlagTimer = null;
            });
            transformBloc.bounceBack(widget.configuration.bounceDuration);
          },
        );
      } else {
        // No inertia: normal bounce-back
        transformBloc.setFrozenDuringDrag(false);
        transformBloc.clearBounceBackFlag();
        _isBouncingBack = true;
        _bounceFlagTimer?.cancel();
        _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
          if (mounted) _isBouncingBack = false;
          _bounceFlagTimer = null;
        });
        transformBloc.bounceBack(widget.configuration.bounceDuration);
      }
    } else {
      // Inertia disabled: normal bounce-back
      transformBloc.setFrozenDuringDrag(false);
      transformBloc.clearBounceBackFlag();
      _isBouncingBack = true;
      _bounceFlagTimer?.cancel();
      _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
        if (mounted) _isBouncingBack = false;
        _bounceFlagTimer = null;
      });
      transformBloc.bounceBack(widget.configuration.bounceDuration);
    }

    // Reset isolation flag
    _draggingOnObject = false;
  }

  /// Handle pointer signal events (mouse wheel)
  void _handlePointerSignal(
      BuildContext context, PointerSignalEvent event, double topPadding) {
    if (_isBouncingBack) {
      _bounceFlagTimer?.cancel();
      _isBouncingBack = false;
      final tfb = context.read<TransformBloc>();
      tfb.setFrozenDuringDrag(false);
      tfb.clearBounceBackFlag();
      // Also clear any pending inertia/timers and samples from previous burst
      _inertia.stop();
      _wheelInertiaTimer?.cancel();
      _recentWheelDeltas.clear();
      _recentWheelDeltaMs.clear();
    }
    // Stop auto-scroll on new pointer signal
    _autoScroll.stop();
    _inertia.stop();
    // Ensure we have keyboard focus to detect modifiers reliably
    if (!_keyboardFocusNode.hasFocus) {
      _keyboardFocusNode.requestFocus();
    }
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

      // If Ctrl/Cmd pressed, interpret wheel as zoom instead of scroll.
      // Use global hardware keyboard state to avoid focus-related misses.
      final Set<LogicalKeyboardKey> globalKeys =
          HardwareKeyboard.instance.logicalKeysPressed;
      final Set<LogicalKeyboardKey> rawKeys = RawKeyboard.instance.keysPressed;
      final bool ctrlOrCmdPressed =
          _pressedKeys.contains(LogicalKeyboardKey.controlLeft) ||
              _pressedKeys.contains(LogicalKeyboardKey.controlRight) ||
              _pressedKeys.contains(LogicalKeyboardKey.metaLeft) ||
              _pressedKeys.contains(LogicalKeyboardKey.metaRight) ||
              globalKeys.contains(LogicalKeyboardKey.controlLeft) ||
              globalKeys.contains(LogicalKeyboardKey.controlRight) ||
              globalKeys.contains(LogicalKeyboardKey.metaLeft) ||
              globalKeys.contains(LogicalKeyboardKey.metaRight) ||
              globalKeys.contains(LogicalKeyboardKey.control) ||
              globalKeys.contains(LogicalKeyboardKey.meta) ||
              rawKeys.contains(LogicalKeyboardKey.controlLeft) ||
              rawKeys.contains(LogicalKeyboardKey.controlRight) ||
              rawKeys.contains(LogicalKeyboardKey.control) ||
              rawKeys.contains(LogicalKeyboardKey.metaLeft) ||
              rawKeys.contains(LogicalKeyboardKey.metaRight) ||
              rawKeys.contains(LogicalKeyboardKey.meta);

      // DEBUG: log incoming scroll and modifiers
      debugPrint(
          '[Viewer] PointerScroll kind=${event.kind} delta=${event.scrollDelta} ts=${event.timeStamp.inMilliseconds}ms');
      debugPrint(
          '[Viewer] Keys: local=$_pressedKeys hardware=$globalKeys raw=$rawKeys ctrlOrCmd=$ctrlOrCmdPressed');

      if (ctrlOrCmdPressed) {
        // Gentler zoom for MM/wheel
        const double zoomFactor = 1.04;
        // Use dominant axis (supports Magic Mouse horizontal scroll)
        final double dx = event.scrollDelta.dx;
        final double dy = event.scrollDelta.dy;
        final double dominant = (dx.abs() > dy.abs()) ? dx : dy;
        final double scale = dominant < 0 ? zoomFactor : 1.0 / zoomFactor;
        debugPrint(
            '[Viewer] Wheel->ZOOM dominant=$dominant scale=$scale currentScale=${currentTransform.scale}');
        // Skip if effective scale would not change (already at limit)
        final double currentScale = currentTransform.scale;
        final double proposedScale = currentScale * scale;
        // Compute dynamic min based on content fit
        final transformState = context.read<TransformBloc>().state;
        final double fitMin = Transform2DUtils.scaleToFit(
          contentRect: transformState.diagramRect,
          viewSize: transformState.viewportSize,
        );
        final double effectiveMin = (fitMin)
            .clamp(widget.configuration.minZoom, widget.configuration.maxZoom);
        final double clampedScale = proposedScale.clamp(
          effectiveMin,
          widget.configuration.maxZoom,
        );
        const double eps = 1e-6;
        if ((clampedScale - currentScale).abs() <= eps) {
          debugPrint(
              '[Viewer] Zoom skipped: clampedScale=$clampedScale equals currentScale');
          return;
        }
        // Choose and persist focal for this wheel burst to avoid drift
        final tState = context.read<TransformBloc>().state;
        final double fitMinNow = Transform2DUtils.scaleToFit(
          contentRect: tState.diagramRect,
          viewSize: tState.viewportSize,
        );
        final bool isSmallContent = currentScale <= fitMinNow + 1e-6;
        debugPrint('[Viewer] Anchor select: isSmall=$isSmallContent');
        if (_wheelZoomAnchorFocalLogical == null) {
          _wheelZoomAnchorFocalLogical =
              isSmallContent ? tState.diagramRect.center : logicalPosition;
          debugPrint(
              '[Viewer] Anchor set logical=${_wheelZoomAnchorFocalLogical}');
        }
        final Offset focalLogical = _wheelZoomAnchorFocalLogical!;
        // Apply zoom around chosen focal point
        transformBloc.add(TransformEvent.zoom(
          scale: scale,
          focalPoint: focalLogical,
          currentTransform: currentTransform,
        ));
        // Refresh anchor lifetime; clear after inactivity
        _wheelZoomAnchorTimer?.cancel();
        _wheelZoomAnchorTimer = Timer(const Duration(milliseconds: 250), () {
          _wheelZoomAnchorFocalLogical = null;
          debugPrint('[Viewer] Anchor cleared (burst end)');
        });
        return; // Do not forward as scroll
      }

      // Otherwise, treat as pan/scroll (Magic Mouse/trackpad)
      debugPrint('[Viewer] Wheel->SCROLL forward to controller');
      // Amplify small deltas for better sensitivity, especially for MM
      Offset adjusted = event.scrollDelta;
      const double minStep = 0.6;
      const double mouseMultiplier = 1.8; // classic mouse/MM
      if (event.kind == PointerDeviceKind.mouse) {
        adjusted = Offset(
          (adjusted.dx.abs() < minStep
                  ? (adjusted.dx == 0 ? 0 : adjusted.dx.sign * minStep)
                  : adjusted.dx) *
              mouseMultiplier,
          (adjusted.dy.abs() < minStep
                  ? (adjusted.dy == 0 ? 0 : adjusted.dy.sign * minStep)
                  : adjusted.dy) *
              mouseMultiplier,
        );
      }
      // Determine if this is a classic (coarse) wheel vs smooth (MM/trackpad-like)
      final bool isMouse = event.kind == PointerDeviceKind.mouse;
      final bool isSmooth = event.scrollDelta.dx.abs() <= 4.0 &&
          event.scrollDelta.dy.abs() <= 4.0;

      if (isMouse && !isSmooth) {
        // Classic wheel: strict clamping (no elastic overscroll, no session, no inertia)
        final tBloc = context.read<TransformBloc>();
        final stNow = tBloc.state;
        final proposed = stNow.transform.applyPan(adjusted);
        final strict = Transform2DUtils.capTransformWithZoomLimits(
          transform: proposed,
          diagramRect: stNow.diagramRect,
          size: stNow.viewportSize,
          dynamic: false,
          minZoom: widget.configuration.minZoom,
          maxZoom: widget.configuration.maxZoom,
          preserveCentering: true,
          recenterSmallContent: false,
        );
        tBloc.add(TransformEvent.updateTransform(transform: strict));
      } else {
        // Smooth path (MM/trackpad): start/extend session and apply dynamic pan
        if (!_wheelScrollSessionActive) {
          _wheelScrollSessionActive = true;
          // Clear residual inertia/bounce and buffers
          _inertia.stop();
          _bounceFlagTimer?.cancel();
          _isBouncingBack = false;
          _recentWheelDeltas.clear();
          _recentWheelDeltaMs.clear();
        }
        _wheelScrollSessionTimer?.cancel();
        _wheelScrollSessionTimer = Timer(const Duration(milliseconds: 200), () {
          // Session ends by idle → evaluate inertia and possible bounce in existing logic
          _wheelScrollSessionActive = false;
        });

        // Apply immediate pan internally so behavior does not depend on controller
        context.read<TransformBloc>().add(TransformEvent.pan(
              delta: adjusted,
              currentTransform: currentTransform,
            ));
      }
      final synthetic = PointerScrollEvent(
        position: event.position,
        scrollDelta: adjusted,
        timeStamp: event.timeStamp,
        kind: event.kind,
      );
      final diagramEvent = _translator.handleScrollEvent(
        DateTime.now().microsecondsSinceEpoch.toString(),
        logicalPosition,
        correctedPosition,
        currentTransform,
        hitResults.map((r) => r.object).toList(),
        synthetic,
      );

      if (diagramEvent != null) {
        widget.controller.eventsSink.add(diagramEvent);
      }

      // Start inertia after a short pause (skip for classic wheel mouse)
      final bool allowInertia =
          !isMouse || isSmooth; // allow MM, skip coarse wheel
      if (widget.configuration.enableInertialScrolling && allowInertia) {
        // Use monotonic event timestamp for robust dt even in tests
        final Duration tNow = event.timeStamp;
        if (_lastWheelEventMonotonic != null) {
          final int dtMs = (tNow - _lastWheelEventMonotonic!).inMilliseconds;
          if (dtMs >= 0) {
            // New burst detection: large gap → clear previous samples
            if (dtMs > 180) {
              _recentWheelDeltas.clear();
              _recentWheelDeltaMs.clear();
            }
            _recentWheelDeltaMs.add(dtMs);
            // Sample adjusted deltas to keep inertia consistent with applied pan
            final Offset sampleDelta = event.kind == PointerDeviceKind.mouse
                ? adjusted
                : event.scrollDelta;
            _recentWheelDeltas.add(sampleDelta);
            while (_recentWheelDeltas.length > 8) {
              _recentWheelDeltas.removeAt(0);
              _recentWheelDeltaMs.removeAt(0);
            }
            // Ensure we don't exceed max buffer length
            while (_recentWheelDeltas.length > _wheelInertiaMaxSamples) {
              _recentWheelDeltas.removeAt(0);
            }
            while (_recentWheelDeltaMs.length > _wheelInertiaMaxSamples) {
              _recentWheelDeltaMs.removeAt(0);
            }
          }
        }
        _lastWheelEventMonotonic = tNow;
        _wheelInertiaTimer?.cancel();
        _wheelInertiaTimer = Timer(const Duration(milliseconds: 80), () {
          if (!mounted) return;
          // Copy samples and de-noise tail small opposite-sign jitters
          final List<Offset> deltas = List.of(_recentWheelDeltas);
          final List<int> dts = List.of(_recentWheelDeltaMs);
          _recentWheelDeltas.clear();
          _recentWheelDeltaMs.clear();
          if (deltas.isEmpty || dts.isEmpty) return;
          Offset rawSum = Offset.zero;
          for (final d in deltas) rawSum += d;
          final bool xDominant = rawSum.dx.abs() >= rawSum.dy.abs();
          final int signMajor =
              xDominant ? (rawSum.dx >= 0 ? 1 : -1) : (rawSum.dy >= 0 ? 1 : -1);
          // Trim trailing tiny opposite-sign samples
          const double tailEps = 1.5; // px
          while (deltas.isNotEmpty) {
            final last = deltas.last;
            final double comp = xDominant ? last.dx : last.dy;
            if (comp != 0 &&
                (comp.sign != signMajor) &&
                comp.abs() <= tailEps) {
              deltas.removeLast();
              if (dts.isNotEmpty) dts.removeLast();
              continue;
            }
            break;
          }
          // Compute velocity from remaining samples
          Offset sum = Offset.zero;
          int totalMs = 0;
          for (int i = 0; i < deltas.length; i++) {
            sum += deltas[i];
            totalMs += (i < dts.length) ? dts[i] : 0;
          }
          if (totalMs <= 0) return;
          final seconds = totalMs / 1000.0;
          Offset vPxPerSec = Offset(sum.dx / seconds, sum.dy / seconds);
          // Derived wheel threshold to accommodate smaller deltas
          final double startThreshold =
              (widget.configuration.inertialMinStartVelocity * 0.15)
                  .clamp(5.0, widget.configuration.inertialMinStartVelocity);
          debugPrint(
              '[Viewer] Wheel inertia check: v=${vPxPerSec.distance.toStringAsFixed(1)} thr=$startThreshold');
          // Peak-speed fallback if average is small
          if (vPxPerSec.distance <= startThreshold) {
            double peak = 0;
            Offset peakVec = Offset.zero;
            for (int i = 0; i < deltas.length && i < dts.length; i++) {
              final dt = dts[i] / 1000.0;
              if (dt <= 0) continue;
              final speed = deltas[i].distance / dt;
              if (speed > peak) {
                peak = speed;
                peakVec = Offset(
                  xDominant ? deltas[i].dx : 0,
                  xDominant ? 0 : deltas[i].dy,
                );
              }
            }
            if (peak > startThreshold) {
              // Use peak direction
              final dir = xDominant
                  ? Offset(peakVec.dx.sign.toDouble(), 0)
                  : Offset(0, peakVec.dy.sign.toDouble());
              vPxPerSec = dir * peak;
              debugPrint(
                  '[Viewer] Wheel inertia fallback: peak=${peak.toStringAsFixed(1)} used');
            }
          }
          if (vPxPerSec.distance > startThreshold) {
            // Ensure no existing inertia is running
            _inertia.stop();
            final transformBlocNow = context.read<TransformBloc>();
            _inertia.start(
              initialVelocity: vPxPerSec,
              interval: widget.configuration.autoScrollInterval,
              frictionFactor: widget.configuration.inertialFriction,
              minStopVelocity: widget.configuration.inertialMinStopVelocity,
              maxDuration: widget.configuration.inertialMaxDuration,
              onTick: (delta) {
                if (!mounted) return;
                if (_isBouncingBack) {
                  _inertia.stop();
                  return;
                }
                final stateBefore = transformBlocNow.state;
                final proposed = stateBefore.transform.applyPan(delta);
                final dynamicCapped =
                    Transform2DUtils.capTransformWithZoomLimits(
                  transform: proposed,
                  diagramRect: stateBefore.diagramRect,
                  size: stateBefore.viewportSize,
                  dynamic: true,
                  minZoom: widget.configuration.minZoom,
                  maxZoom: widget.configuration.maxZoom,
                  preserveCentering: true,
                  recenterSmallContent: false,
                );
                final strict = Transform2DUtils.capTransformWithZoomLimits(
                  transform: stateBefore.transform,
                  diagramRect: stateBefore.diagramRect,
                  size: stateBefore.viewportSize,
                  dynamic: false,
                  minZoom: widget.configuration.minZoom,
                  maxZoom: widget.configuration.maxZoom,
                  preserveCentering: true,
                  recenterSmallContent: false,
                );
                transformBlocNow.add(TransformEvent.pan(
                  delta: delta,
                  currentTransform: stateBefore.transform,
                ));
                final deviates =
                    (proposed.translation - dynamicCapped.translation)
                            .distance >
                        0.1;
                bool pinnedOutward = false;
                const double eps = 0.5;
                final border = Transform2DUtils.dynamicBorderWidth;
                final leftLimit = strict.translation.dx - border + eps;
                final rightLimit = strict.translation.dx + border - eps;
                final topLimit = strict.translation.dy - border + eps;
                final bottomLimit = strict.translation.dy + border - eps;
                final px = proposed.translation.dx;
                final py = proposed.translation.dy;
                if ((px <= leftLimit && delta.dx < 0) ||
                    (px >= rightLimit && delta.dx > 0) ||
                    (py <= topLimit && delta.dy < 0) ||
                    (py >= bottomLimit && delta.dy > 0)) {
                  pinnedOutward = true;
                }
                if (deviates || pinnedOutward) {
                  debugPrint(
                      '[Viewer] Wheel inertia: bounce triggered (deviates=$deviates pinned=$pinnedOutward)');
                  _inertia.stop();
                  transformBlocNow.setFrozenDuringDrag(false);
                  transformBlocNow.clearBounceBackFlag();
                  _isBouncingBack = true;
                  _bounceFlagTimer?.cancel();
                  _bounceFlagTimer =
                      Timer(widget.configuration.bounceDuration, () {
                    if (mounted) _isBouncingBack = false;
                    _bounceFlagTimer = null;
                  });
                  transformBlocNow
                      .bounceBack(widget.configuration.bounceDuration);
                }
              },
              onStop: () {
                if (!mounted) return;
                if (_isBouncingBack) return;
                debugPrint('[Viewer] Wheel inertia: onStop -> bounce');
                final transformBlocFinal = context.read<TransformBloc>();
                transformBlocFinal.setFrozenDuringDrag(false);
                transformBlocFinal.clearBounceBackFlag();
                _isBouncingBack = true;
                _bounceFlagTimer?.cancel();
                _bounceFlagTimer =
                    Timer(widget.configuration.bounceDuration, () {
                  if (mounted) _isBouncingBack = false;
                  _bounceFlagTimer = null;
                });
                transformBlocFinal
                    .bounceBack(widget.configuration.bounceDuration);
              },
            );
          } else {
            // No inertia: if overscrolled, bounce back to legal bounds
            debugPrint(
                '[Viewer] Wheel inertia: below threshold -> bounce check');
            final transformBlocNow = context.read<TransformBloc>();
            final stateNow = transformBlocNow.state;
            final strict = Transform2DUtils.capTransformWithZoomLimits(
              transform: stateNow.transform,
              diagramRect: stateNow.diagramRect,
              size: stateNow.viewportSize,
              dynamic: false,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            final needsBounce =
                (strict.translation - stateNow.transform.translation).distance >
                        0.5 ||
                    (strict.scale - stateNow.transform.scale).abs() > 0.001;
            if (needsBounce) {
              debugPrint('[Viewer] Wheel burst end: bouncing back');
              transformBlocNow.setFrozenDuringDrag(false);
              transformBlocNow.clearBounceBackFlag();
              _isBouncingBack = true;
              _bounceFlagTimer?.cancel();
              _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
                if (mounted) _isBouncingBack = false;
                _bounceFlagTimer = null;
              });
              transformBlocNow.bounceBack(widget.configuration.bounceDuration);
            }
          }
        });
      }
    }
  }

  /// Handle scale start events
  void _handleScaleStart(
      BuildContext context, ScaleStartDetails details, double topPadding) {
    if (_isBouncingBack) return;
    // Stop auto-scroll on new gesture
    _autoScroll.stop();
    _inertia.stop();
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
    if (_isBouncingBack) return;
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

    // Detect modifiers for Magic Mouse zoom mapping
    final Set<LogicalKeyboardKey> globalKeys =
        HardwareKeyboard.instance.logicalKeysPressed;
    final Set<LogicalKeyboardKey> rawKeys = RawKeyboard.instance.keysPressed;
    final bool ctrlOrCmdPressed =
        _pressedKeys.contains(LogicalKeyboardKey.controlLeft) ||
            _pressedKeys.contains(LogicalKeyboardKey.controlRight) ||
            _pressedKeys.contains(LogicalKeyboardKey.metaLeft) ||
            _pressedKeys.contains(LogicalKeyboardKey.metaRight) ||
            globalKeys.contains(LogicalKeyboardKey.controlLeft) ||
            globalKeys.contains(LogicalKeyboardKey.controlRight) ||
            globalKeys.contains(LogicalKeyboardKey.metaLeft) ||
            globalKeys.contains(LogicalKeyboardKey.metaRight) ||
            globalKeys.contains(LogicalKeyboardKey.control) ||
            globalKeys.contains(LogicalKeyboardKey.meta) ||
            rawKeys.contains(LogicalKeyboardKey.controlLeft) ||
            rawKeys.contains(LogicalKeyboardKey.controlRight) ||
            rawKeys.contains(LogicalKeyboardKey.control) ||
            rawKeys.contains(LogicalKeyboardKey.metaLeft) ||
            rawKeys.contains(LogicalKeyboardKey.metaRight) ||
            rawKeys.contains(LogicalKeyboardKey.meta);

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
    } else if (ctrlOrCmdPressed && details.scale == 1.0) {
      // Magic Mouse: Cmd/Ctrl + finger slide should map to zoom (dominant axis)
      final Offset d = details.focalPointDelta;
      final double dominant = (d.dx.abs() > d.dy.abs()) ? d.dx : d.dy;
      const double zoomFactor = 1.04;
      final double scale = dominant < 0 ? zoomFactor : 1.0 / zoomFactor;
      // Small-content anchoring like wheel
      final tState = context.read<TransformBloc>().state;
      final double fitMinNow = Transform2DUtils.scaleToFit(
        contentRect: tState.diagramRect,
        viewSize: tState.viewportSize,
      );
      final bool isSmallContent = currentTransform.scale <= fitMinNow + 1e-6;
      final Offset focalLogical =
          isSmallContent ? tState.diagramRect.center : logicalPosition;
      debugPrint(
          '[Viewer] Gesture->ZOOM (MM) dominant=$dominant scale=$scale small=$isSmallContent');
      transformBloc.add(TransformEvent.zoom(
        scale: scale,
        focalPoint: focalLogical,
        currentTransform: currentTransform,
      ));

      // Track gesture path
      eventBloc.add(EventManagementEvent.updateGestureEvent(
        rawEvent: details,
        logicalPosition: logicalPosition,
        hitResults: hitResults,
        pressedKeys: _pressedKeys,
      ));
      _wasTwoFingerPan = false;
      _lastPointerMoveTime = DateTime.timestamp();
    } else if (details.pointerCount > 1 && details.scale == 1.0) {
      // Two-finger trackpad pan when no pinch scale is applied
      // Amplify small deltas for sensitivity
      const double minStep = 0.4;
      const double trackpadMultiplier = 1.8;
      Offset panDelta = details.focalPointDelta;
      panDelta = Offset(
        (panDelta.dx.abs() < minStep
                ? (panDelta.dx == 0 ? 0 : panDelta.dx.sign * minStep)
                : panDelta.dx) *
            trackpadMultiplier,
        (panDelta.dy.abs() < minStep
                ? (panDelta.dy == 0 ? 0 : panDelta.dy.sign * minStep)
                : panDelta.dy) *
            trackpadMultiplier,
      );
      transformBloc.add(TransformEvent.pan(
        delta: panDelta,
        currentTransform: currentTransform,
      ));
      _wasTwoFingerPan = true;
      // Sample for inertia (reuse pointer sampling buffers)
      final now = DateTime.timestamp();
      if (_lastPointerMoveTime != null) {
        final dtMs = now.difference(_lastPointerMoveTime!).inMilliseconds;
        _recentPointerDeltaMs.add(dtMs);
        _recentPointerDeltas.add(panDelta);
        while (_recentPointerDeltas.length > 8) {
          _recentPointerDeltas.removeAt(0);
          _recentPointerDeltaMs.removeAt(0);
        }
      }
      _lastPointerMoveTime = now;

      // Track gesture path
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
    if (_isBouncingBack) return;
    final eventBloc = context.read<EventManagementBloc>();

    // Send to EventManagementBloc
    eventBloc.add(EventManagementEvent.endGestureEvent(
      rawEvent: details,
      pressedKeys: _pressedKeys,
    ));

    // Ensure bounce-back only after real multi-touch gesture ends
    final transformBloc = context.read<TransformBloc>();
    transformBloc.setFrozenDuringDrag(false);
    if (_wasTwoFingerPan && widget.configuration.enableInertialScrolling) {
      // Start inertia for two-finger pan end using sampled gesture deltas
      // De-noise tail samples that flip sign on the dominant axis
      if (_recentPointerDeltas.isNotEmpty) {
        double sumAbsDx = 0;
        double sumAbsDy = 0;
        for (final d in _recentPointerDeltas) {
          sumAbsDx += d.dx.abs();
          sumAbsDy += d.dy.abs();
        }
        final bool useX = sumAbsDx >= sumAbsDy;
        // Intended sign is the sign of the last non-zero delta on dominant axis
        double intendedSign = 0;
        for (int i = _recentPointerDeltas.length - 1; i >= 0; i--) {
          final v =
              useX ? _recentPointerDeltas[i].dx : _recentPointerDeltas[i].dy;
          if (v != 0) {
            intendedSign = v.sign;
            break;
          }
        }
        // Remove small opposite-sign tail samples
        const double tailEpsilon = 2.0; // physical px
        while (_recentPointerDeltas.length > 1) {
          final last = _recentPointerDeltas.last;
          final v = useX ? last.dx : last.dy;
          if (v != 0 && v.sign != intendedSign && v.abs() <= tailEpsilon) {
            _recentPointerDeltas.removeLast();
            if (_recentPointerDeltaMs.isNotEmpty) {
              _recentPointerDeltaMs.removeLast();
            }
            continue;
          }
          break;
        }
      }

      // Compute velocity from recent samples
      final double lastSampleDistance = _recentPointerDeltas.isNotEmpty
          ? _recentPointerDeltas.last.distance
          : 0.0;
      final int lastSampleDtMs =
          _recentPointerDeltaMs.isNotEmpty ? _recentPointerDeltaMs.last : 16;
      final double lastSampleVelocity = lastSampleDtMs > 0
          ? lastSampleDistance / (lastSampleDtMs / 1000.0)
          : 0.0;
      Offset initialV = Offset.zero;
      int totalMs = 0;
      for (int i = 0; i < _recentPointerDeltas.length; i++) {
        initialV += _recentPointerDeltas[i];
        totalMs += _recentPointerDeltaMs[i];
      }
      if (totalMs > 0) {
        final seconds = totalMs / 1000.0;
        initialV = Offset(initialV.dx / seconds, initialV.dy / seconds);
      }
      final double gestureStartThreshold =
          (widget.configuration.inertialMinStartVelocity * 0.4)
              .clamp(30.0, widget.configuration.inertialMinStartVelocity);
      if (initialV.distance > gestureStartThreshold ||
          // Fallback: if average is low but the last sample had a strong velocity, use it to kick inertia
          lastSampleVelocity >= gestureStartThreshold * 0.75) {
        _recentPointerDeltas.clear();
        _recentPointerDeltaMs.clear();
        _inertia.start(
          initialVelocity: initialV,
          interval: widget.configuration.autoScrollInterval,
          frictionFactor: widget.configuration.inertialFriction,
          minStopVelocity: widget.configuration.inertialMinStopVelocity,
          maxDuration: widget.configuration.inertialMaxDuration,
          onTick: (delta) {
            if (!mounted) return;
            if (_isBouncingBack) {
              _inertia.stop();
              return;
            }
            final stateBefore = transformBloc.state;
            final proposed = stateBefore.transform.applyPan(delta);
            final dynamicCapped = Transform2DUtils.capTransformWithZoomLimits(
              transform: proposed,
              diagramRect: stateBefore.diagramRect,
              size: stateBefore.viewportSize,
              dynamic: true,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            final strict = Transform2DUtils.capTransformWithZoomLimits(
              transform: stateBefore.transform,
              diagramRect: stateBefore.diagramRect,
              size: stateBefore.viewportSize,
              dynamic: false,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            transformBloc.add(TransformEvent.pan(
              delta: delta,
              currentTransform: stateBefore.transform,
            ));
            final deviates =
                (proposed.translation - dynamicCapped.translation).distance >
                    0.1;
            bool pinnedOutward = false;
            const double eps = 0.5;
            final border = Transform2DUtils.dynamicBorderWidth;
            final leftLimit = strict.translation.dx - border + eps;
            final rightLimit = strict.translation.dx + border - eps;
            final topLimit = strict.translation.dy - border + eps;
            final bottomLimit = strict.translation.dy + border - eps;
            final px = proposed.translation.dx;
            final py = proposed.translation.dy;
            if ((px <= leftLimit && delta.dx < 0) ||
                (px >= rightLimit && delta.dx > 0) ||
                (py <= topLimit && delta.dy < 0) ||
                (py >= bottomLimit && delta.dy > 0)) {
              pinnedOutward = true;
            }
            if (deviates || pinnedOutward) {
              _inertia.stop();
              transformBloc.setFrozenDuringDrag(false);
              transformBloc.clearBounceBackFlag();
              _isBouncingBack = true;
              _bounceFlagTimer?.cancel();
              _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
                if (mounted) _isBouncingBack = false;
                _bounceFlagTimer = null;
              });
              transformBloc.bounceBack(widget.configuration.bounceDuration);
            }
          },
          onStop: () {
            if (!mounted) return;
            if (_isBouncingBack) return;
            transformBloc.setFrozenDuringDrag(false);
            transformBloc.clearBounceBackFlag();
            _isBouncingBack = true;
            _bounceFlagTimer?.cancel();
            _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
              if (mounted) _isBouncingBack = false;
              _bounceFlagTimer = null;
            });
            transformBloc.bounceBack(widget.configuration.bounceDuration);
          },
        );
      } else {
        _recentPointerDeltas.clear();
        _recentPointerDeltaMs.clear();
        // No inertia: if overscrolled after two-finger pan, bounce now
        final stateNow = transformBloc.state;
        final strict = Transform2DUtils.capTransformWithZoomLimits(
          transform: stateNow.transform,
          diagramRect: stateNow.diagramRect,
          size: stateNow.viewportSize,
          dynamic: false,
          minZoom: widget.configuration.minZoom,
          maxZoom: widget.configuration.maxZoom,
          preserveCentering: true,
          recenterSmallContent: false,
        );
        final needsBounce =
            (strict.translation - stateNow.transform.translation).distance >
                    0.5 ||
                (strict.scale - stateNow.transform.scale).abs() > 0.001;
        if (needsBounce) {
          transformBloc.setFrozenDuringDrag(false);
          transformBloc.clearBounceBackFlag();
          _isBouncingBack = true;
          _bounceFlagTimer?.cancel();
          _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
            if (mounted) _isBouncingBack = false;
            _bounceFlagTimer = null;
          });
          transformBloc.bounceBack(widget.configuration.bounceDuration);
        }
      }
    } else if (_wasMultiTouchGesture) {
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
    _wasTwoFingerPan = false;
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
    _inertia.stop();
    _bounceFlagTimer?.cancel();
    _wheelZoomBounceTimer?.cancel();
    _wheelZoomAnchorTimer?.cancel();
    _wheelInertiaTimer?.cancel();
    _wheelScrollSessionTimer?.cancel();
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
