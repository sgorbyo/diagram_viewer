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
  // DateTime? _lastWheelEventTime; // removed unused
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
  // Flag: wheel inertia started immediately by latest command (skip debounce re-start)
  // bool _wheelInertiaImmediate = false; // removed unused
  // Recent pointer movement samples for velocity estimation (physical space)
  DateTime? _lastPointerMoveTime;
  final List<Offset> _recentPointerDeltas = <Offset>[]; // px
  final List<int> _recentPointerDeltaMs = <int>[]; // ms per sample
  Offset? _lastPointerLocalPosition;
  bool _wasTwoFingerPan = false;
  // Magic Mouse residual accumulator to avoid losing tiny deltas near limits
  Offset _mmResidual = Offset.zero;
  // Magic Mouse per-frame coalescing to avoid losing rapid successive ticks
  Offset _mmCoalescedDelta = Offset.zero;
  // Track last pointer device kind to disambiguate trackpad vs Magic Mouse during gesture updates
  PointerDeviceKind? _lastPointerKind;
  // Residual accumulator for gesture-based pans (trackpad/MM-fallback)
  Offset _gestureResidual = Offset.zero;
  // Legacy coalescing fields (not used in immediate apply path)
  // Track if this gesture session had any pan updates (used to trigger inertia on end)
  bool _gesturePanSessionActive = false;
  // Cooldown not used in immediate path
  // Last applied gesture delta (for seeding inertia when needed)
  Offset _lastGestureFlushDelta = Offset.zero;
  // Post-gesture bounce verification timer
  Timer? _postGestureBounceTimer;

  // Removed coalesced gesture flush: switched to immediate apply path

  // Selection rectangle overlay state
  bool _selectionOverlayVisible = false;
  Offset _selectionStartPosition = Offset.zero;
  Offset _selectionCurrentPosition = Offset.zero;
  Rect _selectionRect = Rect.zero;

  // Track autoscroll state
  bool _autoscrollEnabled = false;

  void _flushMmCoalescedPanNow({required BuildContext context}) {
    if (!mounted) return;
    final transformBlocNow = context.read<TransformBloc>();
    final Transform2D tNow = transformBlocNow.state.transform;
    // Combine coalesced deltas with residual not yet applied
    final Offset candidate = _mmCoalescedDelta + _mmResidual;
    _mmCoalescedDelta = Offset.zero;
    if (candidate == Offset.zero) return;
    // Predict effective delta after dynamic capping to avoid sending no-op pans
    final proposed = tNow.applyPan(candidate);
    final dynamicCapped = Transform2DUtils.capTransformWithZoomLimits(
      transform: proposed,
      diagramRect: transformBlocNow.state.diagramRect,
      size: transformBlocNow.state.viewportSize,
      dynamic: true,
      minZoom: widget.configuration.minZoom,
      maxZoom: widget.configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );
    final Offset effective = dynamicCapped.translation - tNow.translation;
    if (effective == Offset.zero) {
      // Nothing would move: keep accumulating until we can pass bounds window
      _mmResidual = candidate;
      if (widget.debug) {
        debugPrint(
            '[MM] no-op pan after capping; accumulate residual=$_mmResidual');
      }
      return;
    }
    // Send only the effective movement and keep leftover as residual
    _safePanDirect(transformBlocNow, effective, tNow,
        contextName: 'magic-mouse');
    _mmResidual = candidate - effective;
    if (widget.debug && _mmResidual != Offset.zero) {
      debugPrint('[MM] applied=$effective residual=$_mmResidual');
    }
  }

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

  // Helper method to check if pan is allowed
  bool _isPanAllowed() {
    return !_selectionOverlayVisible;
  }

  // Safe pan wrapper that respects selection state
  void _safePan(
      BuildContext context, Offset delta, Transform2D currentTransform,
      {String? contextName}) {
    if (!_isPanAllowed()) {
      if (widget.debug) {
        debugPrint(
            '[Viewer] Pan blocked during selection (context: $contextName)');
      }
      return;
    }

    final transformBloc = context.read<TransformBloc>();
    _safePanDirect(transformBloc, delta, currentTransform,
        contextName: 'auto-scroll');
  }

  // Safe pan wrapper for cases without BuildContext (Magic Mouse, auto-scroll)
  void _safePanDirect(
      TransformBloc transformBloc, Offset delta, Transform2D currentTransform,
      {String? contextName}) {
    if (!_isPanAllowed()) {
      if (widget.debug) {
        debugPrint(
            '[Viewer] Pan blocked during selection (context: $contextName)');
      }
      return;
    }

    // CRITICAL: During autoscroll-enabled drag, don't apply bounds limits
    // This prevents the object from "jumping" away from the cursor
    if (_autoscrollEnabled) {
      // Apply pan without bounds checking during autoscroll
      final newTransform = Transform2D(
        scale: currentTransform.scale,
        translation: currentTransform.translation + delta,
        rotation: currentTransform.rotation,
      );
      transformBloc
          .add(TransformEvent.updateTransform(transform: newTransform));
      return;
    }

    // Normal behavior: apply pan with bounds checking
    transformBloc.add(TransformEvent.pan(
      delta: delta,
      currentTransform: currentTransform,
    ));
  }

  // Safe inertia wrapper that respects selection state
  void _safeStartInertia(BuildContext context, Offset initialVelocity,
      {String? contextName}) {
    if (!_isPanAllowed()) {
      if (widget.debug) {
        debugPrint(
            '[Viewer] Inertia blocked during selection (context: $contextName)');
      }
      return;
    }

    _inertia.start(
      initialVelocity: initialVelocity,
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
        _safePan(context, delta, context.read<TransformBloc>().state.transform,
            contextName: 'inertia-tick');
      },
      onStop: () {
        if (!mounted) return;
        if (_isBouncingBack) return;
        final transformBloc = context.read<TransformBloc>();
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
              // Remove internal selection logic - let controller handle it
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
              // Remove internal selection logic - let controller handle it
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
            dragBegin: (dragBeginEvent) {
              // Remove internal selection logic - let controller handle it
              // The controller will send appropriate commands for selection overlay
              return DiagramEventUnion.dragBegin(dragBeginEvent);
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

            // CRITICAL: During autoscroll-enabled drag, don't apply bounds correction
            // This prevents the object from "jumping" away from the cursor
            if (_autoscrollEnabled) {
              print(
                  '[DiagramViewerContent] redraw: autoscroll enabled, skipping bounds correction');
              // Only update bounds, don't correct transform
              if (currentViewportSize != Size.zero) {
                transformBloc.add(TransformEvent.updateDiagramBounds(
                  diagramRect: logicalExtent,
                  viewportSize: currentViewportSize,
                ));
              }
              return;
            }

            // Normal behavior when not in autoscroll-enabled drag
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
                _safePanDirect(transformBloc, delta, currentTransform,
                    contextName: 'auto-scroll-step');

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
                    final enriched = DiagramEventUnion.dragContinue(
                      DiagramDragContinue(
                        eventId: state.eventId,
                        logicalPosition: logicalPosition,
                        screenPosition: local,
                        transformSnapshot: tNow,
                        hitList: hitResults.map((r) => r.object).toList(),
                        timestamp: Duration.zero,
                        metadata: {'pressedButtons': buttonsMask},
                        delta: delta,
                        totalDelta: delta,
                        duration: Duration.zero,
                        velocity: delta,
                      ),
                    );
                    widget.controller.eventsSink.add(enriched);
                  });
                }
              },
            );
          },
          stopAutoScroll: () {
            _autoScroll.stop();
          },
          enableAutoscroll: () {
            print(
                '[DiagramViewerContent] enableAutoscroll called, setting flag');
            // Enable autoscroll functionality
            // This allows the diagram to scroll automatically during drag operations
            _autoscrollEnabled = true;
            // Set flag to skip transform correction during autoscroll
            final transformBloc = context.read<TransformBloc>();
            transformBloc.setSkipTransformCorrection(true);
          },
          disableAutoscroll: () {
            // Disable autoscroll functionality
            // This prevents unwanted scrolling when not actively dragging
            _autoscrollEnabled = false;
            // Reset flag to allow transform correction after autoscroll
            final transformBloc = context.read<TransformBloc>();
            transformBloc.setSkipTransformCorrection(false);
          },
          returnToBounds: () {
            // Return the diagram to valid bounds
            // This is typically called after drag operations to ensure
            // the diagram is properly positioned within its constraints.
            final transformBloc = context.read<TransformBloc>();
            final currentTransform = transformBloc.state.transform;
            final capped = Transform2DUtils.capTransformWithZoomLimits(
              transform: currentTransform,
              diagramRect: transformBloc.state.diagramRect,
              size: transformBloc.state.viewportSize,
              dynamic: false,
              minZoom: widget.configuration.minZoom,
              maxZoom: widget.configuration.maxZoom,
              preserveCentering: true,
              recenterSmallContent: false,
            );
            transformBloc
                .add(TransformEvent.updateTransform(transform: capped));
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
          // Selection overlay commands
          showSelectionOverlay: (startPosition) {
            setState(() {
              _selectionOverlayVisible = true;
              _selectionStartPosition = startPosition;
              _selectionCurrentPosition = startPosition;
              _selectionRect = Rect.fromPoints(startPosition, startPosition);
            });
          },
          updateSelectionRect: (currentPosition) {
            if (_selectionOverlayVisible) {
              setState(() {
                _selectionCurrentPosition = currentPosition;
                _selectionRect = Rect.fromPoints(
                  _selectionStartPosition,
                  currentPosition,
                );
              });
            }
          },
          hideSelectionOverlay: () {
            setState(() {
              _selectionOverlayVisible = false; // Hide overlay
              _selectionStartPosition = Offset.zero; // Reset start position
              _selectionCurrentPosition = Offset.zero; // Reset current position
              _selectionRect = Rect.zero; // Reset rectangle
            });
          },
          handleAsUsual: (originalEvent) {
            // Process the event using the viewer's default pan/zoom/inertia logic
            _handleEventAsUsual(originalEvent);
          },
          setCursor: (effect) {
            // Desktop/web: update MouseRegion cursor; mobile platforms ignore
            setState(() {
              _cursorEffect = effect;
            });
          },
        );
        // Guarantee bounce even if inertia stops without correcting overscroll
        _postGestureBounceTimer?.cancel();
        _postGestureBounceTimer = Timer(const Duration(milliseconds: 220), () {
          if (!mounted) return;
          final tfbNow = context.read<TransformBloc>();
          final stateNow = tfbNow.state;
          final strictNow = Transform2DUtils.capTransformWithZoomLimits(
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
              (strictNow.translation - stateNow.transform.translation)
                          .distance >
                      0.5 ||
                  (strictNow.scale - stateNow.transform.scale).abs() > 0.001;
          if (needsBounce && !_isBouncingBack) {
            _inertia.stop();
            tfbNow.setFrozenDuringDrag(false);
            tfbNow.clearBounceBackFlag();
            _isBouncingBack = true;
            _bounceFlagTimer?.cancel();
            _bounceFlagTimer = Timer(widget.configuration.bounceDuration, () {
              if (mounted) _isBouncingBack = false;
              _bounceFlagTimer = null;
            });
            tfbNow.bounceBack(widget.configuration.bounceDuration);
          }
        });
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
                      if (widget.debug)
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Builder(builder: (context) {
                            final tf =
                                context.read<TransformBloc>().state.transform;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'scale: ${tf.scale.toStringAsFixed(3)}  tx: ${tf.translation.dx.toStringAsFixed(1)}  ty: ${tf.translation.dy.toStringAsFixed(1)}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            );
                          }),
                        ),
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
                      // Selection rectangle overlay
                      if (_selectionOverlayVisible)
                        Positioned.fill(
                          child: IgnorePointer(
                            child: CustomPaint(
                              painter: _SelectionOverlayPainter(
                                selectionRect: _selectionRect,
                                transform: transformState.transform,
                                configuration: widget.configuration,
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
    _lastPointerKind = event.kind;

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
    _lastPointerKind = event.kind;

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

    // Apply pan only when dragging empty area, we did not start on an object, and selection is not active
    // If a drag on object is active or selection is active, do not pan the canvas.
    if (!_draggingOnObject &&
        hitResults.isEmpty &&
        event.buttons != 0 &&
        !_selectionOverlayVisible) {
      // Abort any ongoing inertia on new explicit user pan
      _inertia.stop();
      // Predict effective applied delta after dynamic capping
      final proposed = currentTransform.applyPan(event.delta);
      final dynamicCapped = Transform2DUtils.capTransformWithZoomLimits(
        transform: proposed,
        diagramRect: context.read<TransformBloc>().state.diagramRect,
        size: context.read<TransformBloc>().state.viewportSize,
        dynamic: true,
        minZoom: widget.configuration.minZoom,
        maxZoom: widget.configuration.maxZoom,
        preserveCentering: true,
        recenterSmallContent: false,
      );
      final Offset effective =
          dynamicCapped.translation - currentTransform.translation;
      if (widget.debug) {
        debugPrint(
            '[Viewer] Pointer->PAN (drag) applied=$effective from input=${event.delta}');
      }
      _safePan(context, effective, currentTransform,
          contextName: 'pointer-drag');
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

    // End the pointer event
    eventBloc.add(EventManagementEvent.endPointerEvent(
      rawEvent: const PointerUpEvent(
        pointer: 0,
        position: Offset.zero,
        kind: PointerDeviceKind.touch,
      ),
      pressedKeys: {},
    ));
  }

  /// Handle pointer signal events (mouse wheel)
  void _handlePointerSignal(
      BuildContext context, PointerSignalEvent event, double topPadding) {
    // During an object drag session, ignore wheel/scroll/zoom signals entirely.
    // Drag must remain exclusive (auto-scroll aside, which is driven separately).
    if (_draggingOnObject) {
      return;
    }
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
      final Set<LogicalKeyboardKey> rawKeys =
          HardwareKeyboard.instance.logicalKeysPressed;
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
              '[Viewer] Anchor set logical=$_wheelZoomAnchorFocalLogical');
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
      // Movement 1:1 (no amplification); keep a tiny min step only to avoid sub-pixel starvation
      Offset adjusted = event.scrollDelta;
      const double minStep = 0.6;
      const double mouseMultiplier = 1.0; // 1:1 mapping
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
      final bool isSmooth = event.scrollDelta.dx.abs() <= 28.0 &&
          event.scrollDelta.dy.abs() <= 28.0;

      // Treat events as smooth if a Magic Mouse scroll session is active, even if a single delta is > 4 px.
      // This prevents misclassification of MM bursts and allows inertia to follow the latest command.
      final Duration dtSinceLast = _lastWheelEventMonotonic == null
          ? const Duration(days: 365)
          : (event.timeStamp - _lastWheelEventMonotonic!);
      final bool treatAsClassic = isMouse &&
          !isSmooth &&
          !_wheelScrollSessionActive &&
          dtSinceLast.inMilliseconds > 250;
      if (!treatAsClassic) {
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
        // Always apply at least a minimal step to ensure visible motion for micro-bursts
        const double mmMinStep = 2.0; // px
        final Offset applied = Offset(
          adjusted.dx == 0
              ? 0
              : adjusted.dx.abs() < mmMinStep
                  ? adjusted.dx.sign * mmMinStep
                  : adjusted.dx,
          adjusted.dy == 0
              ? 0
              : adjusted.dy.abs() < mmMinStep
                  ? adjusted.dy.sign * mmMinStep
                  : adjusted.dy,
        );
        // Accumulate and FLUSH IMMEDIATELY to avoid losing commands in rapid bursts.
        // This also guarantees an immediate reversal step if inertia was active.
        _mmCoalescedDelta += applied;
        _flushMmCoalescedPanNow(context: context);

        // Reset or steer inertia sampling toward the latest command direction.
        // If the new delta opposes the recent dominant direction, clear buffers first.
        if (_recentWheelDeltas.isNotEmpty) {
          Offset sum = Offset.zero;
          for (final d in _recentWheelDeltas) {
            sum += d;
          }
          final bool xDominant = sum.dx.abs() >= sum.dy.abs();
          final double prev = xDominant ? sum.dx : sum.dy;
          final double nowComp = xDominant ? adjusted.dx : adjusted.dy;
          if (prev != 0 && nowComp != 0 && (prev.sign != nowComp.sign)) {
            _recentWheelDeltas.clear();
            _recentWheelDeltaMs.clear();
            _lastWheelEventMonotonic = null;
          }
        }
        // Seed buffer with current adjusted sample; inertia will be evaluated on idle (no immediate start)
        _recentWheelDeltas.add(adjusted);
        _recentWheelDeltaMs.add(16); // approx one frame
        _lastWheelEventMonotonic = event.timeStamp;
        // (MM) Immediate inertia start is disabled; idle debounce below will decide if inertia starts
        if (widget.configuration.enableInertialScrolling) {
          // Estimate instantaneous velocity
          final Offset v = adjusted * (1000.0 / 16.0); // px/s
          final double startThreshold =
              (widget.configuration.inertialMinStartVelocity * 0.15)
                  .clamp(5.0, widget.configuration.inertialMinStartVelocity);
          // Allow immediate inertia only if recent direction is consistent (avoid alternation cancellation)
          bool consistentDirection = false;
          if (_recentWheelDeltas.length >= 2) {
            Offset recent = Offset.zero;
            final int n = _recentWheelDeltas.length;
            for (int i = (n - 1); i >= 0 && i >= n - 4; i--) {
              recent += _recentWheelDeltas[i];
            }
            final bool xDom = recent.dx.abs() >= recent.dy.abs();
            final double prevComp = xDom ? recent.dx : recent.dy;
            final double nowComp = xDom ? adjusted.dx : adjusted.dy;
            if (prevComp == 0 || nowComp == 0) {
              consistentDirection = true;
            } else {
              consistentDirection = prevComp.sign == nowComp.sign;
            }
          }
          if (v.distance > startThreshold && consistentDirection) {
            _wheelInertiaTimer?.cancel();
            _inertia.stop();
            final transformBlocNow = context.read<TransformBloc>();
            // _wheelInertiaImmediate = true; // removed
            _inertia.start(
              initialVelocity: v,
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
                _safePanDirect(transformBlocNow, delta, stateBefore.transform,
                    contextName: 'wheel-inertia-1');
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
          }
        }
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
          !treatAsClassic; // allow MM/trackpad, skip coarse wheel
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
          for (final d in deltas) {
            rawSum += d;
          }
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
                _safePanDirect(transformBlocNow, delta, stateBefore.transform,
                    contextName: 'wheel-inertia-2');
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
    // Reset gesture residual at the start of any gesture session
    _gestureResidual = Offset.zero;
    _gesturePanSessionActive = false;
    _lastGestureFlushDelta = Offset.zero;
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
    // During an object drag session, viewer transforms (pan/zoom) are disabled.
    // Drag must remain exclusive until pointer up (auto-scroll aside).
    if (_draggingOnObject) {
      return;
    }
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
            globalKeys.contains(LogicalKeyboardKey.meta);

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
      // 1:1 feeling with finger movement (no multiplier, no min-step)
      Offset panDelta = details.focalPointDelta;
      // Abort inertia only for gesture pans (not for mouse drag); immediate apply
      _inertia.stop();
      // Immediate apply with dynamic capping and residual accumulation
      final Transform2D tNow = context.read<TransformBloc>().state.transform;
      final Offset candidate = _gestureResidual + panDelta;
      final proposed = tNow.applyPan(candidate);
      final dynamicCapped = Transform2DUtils.capTransformWithZoomLimits(
        transform: proposed,
        diagramRect: context.read<TransformBloc>().state.diagramRect,
        size: context.read<TransformBloc>().state.viewportSize,
        dynamic: true,
        minZoom: widget.configuration.minZoom,
        maxZoom: widget.configuration.maxZoom,
        preserveCentering: true,
        recenterSmallContent: false,
      );
      final Offset effective = dynamicCapped.translation - tNow.translation;
      if (effective == Offset.zero) {
        _gestureResidual = candidate;
        if (widget.debug) {
          debugPrint(
              '[Viewer] Gesture->PAN (trackpad) no-op; residual=$_gestureResidual');
        }
      } else {
        if (widget.debug) {
          final Offset residualBefore = candidate - panDelta;
          debugPrint(
              '[Viewer] Gesture->PAN (trackpad) applied=$effective from input=$panDelta residual_before=$residualBefore');
        }
        _safePanDirect(transformBloc, effective, tNow,
            contextName: 'gesture-trackpad');
        _gestureResidual = candidate - effective;
      }
      _wasTwoFingerPan = true;
      _gesturePanSessionActive = true;
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
    } else if (details.pointerCount == 1 && details.scale == 1.0) {
      // Fallback for Magic Mouse finger scrolls delivered as single-pointer gesture updates (no pinch)
      // Guard: only if last pointer kind looked like mouse (Magic Mouse), not trackpad
      if (_lastPointerKind != PointerDeviceKind.mouse) {
        // Not a mouse-originated single-pointer update; ignore here
        return;
      }
      // 1:1 feeling with finger movement on Magic Mouse (no multiplier, no min-step)
      Offset panDelta = details.focalPointDelta;
      // Abort inertia on new explicit gesture pan
      _inertia.stop();
      // Immediate apply for MM fallback as well
      final Transform2D tNow2 = context.read<TransformBloc>().state.transform;
      final Offset candidate2 = _gestureResidual + panDelta;
      final proposed2 = tNow2.applyPan(candidate2);
      final dynamicCapped2 = Transform2DUtils.capTransformWithZoomLimits(
        transform: proposed2,
        diagramRect: context.read<TransformBloc>().state.diagramRect,
        size: context.read<TransformBloc>().state.viewportSize,
        dynamic: true,
        minZoom: widget.configuration.minZoom,
        maxZoom: widget.configuration.maxZoom,
        preserveCentering: true,
        recenterSmallContent: false,
      );
      final Offset effective2 = dynamicCapped2.translation - tNow2.translation;
      if (effective2 == Offset.zero) {
        _gestureResidual = candidate2;
        if (widget.debug) {
          debugPrint(
              '[Viewer] Gesture->PAN (MM fallback) no-op; residual=$_gestureResidual');
        }
      } else {
        if (widget.debug) {
          final Offset residualBefore2 = candidate2 - panDelta;
          debugPrint(
              '[Viewer] Gesture->PAN (MM fallback) applied=$effective2 from input=$panDelta residual_before=$residualBefore2');
        }
        _safePanDirect(transformBloc, effective2, tNow2,
            contextName: 'gesture-mm-fallback');
        _gestureResidual = candidate2 - effective2;
      }
      _gesturePanSessionActive = true;
      // Sample for inertia as well (same buffers)
      final now2 = DateTime.timestamp();
      if (_lastPointerMoveTime != null) {
        final dtMs2 = now2.difference(_lastPointerMoveTime!).inMilliseconds;
        _recentPointerDeltaMs.add(dtMs2);
        _recentPointerDeltas.add(panDelta);
        while (_recentPointerDeltas.length > 8) {
          _recentPointerDeltas.removeAt(0);
          _recentPointerDeltaMs.removeAt(0);
        }
      }
      _lastPointerMoveTime = now2;
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
    // Reset residual at gesture end so next session starts clean
    _gestureResidual = Offset.zero;
    // Seed inertia samples if flush-based sampling produced no dt entries
    if (_gesturePanSessionActive && _recentPointerDeltaMs.isEmpty) {
      if (_lastGestureFlushDelta != Offset.zero) {
        _recentPointerDeltas.add(_lastGestureFlushDelta);
        _recentPointerDeltaMs.add(16);
      }
    }

    // Ensure bounce-back only after real multi-touch gesture ends
    final transformBloc = context.read<TransformBloc>();
    transformBloc.setFrozenDuringDrag(false);
    if ((_wasTwoFingerPan || _gesturePanSessionActive) &&
        widget.configuration.enableInertialScrolling) {
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
              .clamp(5.0, widget.configuration.inertialMinStartVelocity);
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
            _safePanDirect(transformBloc, delta, stateBefore.transform,
                contextName: 'trackpad-inertia');
            // Trackpad inertia: allow a bit more elastic room before bouncing
            final deviates =
                (proposed.translation - dynamicCapped.translation).distance >
                    1.0;
            bool pinnedOutward = false;
            const double eps = 1.5;
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
        // Apply an immediate initial step in the inertia direction for responsiveness
        final double seconds =
            widget.configuration.autoScrollInterval.inMilliseconds / 1000.0;
        final Offset kick =
            Offset(initialV.dx * seconds, initialV.dy * seconds);
        final stateKick = transformBloc.state;
        _safePanDirect(transformBloc, kick, stateKick.transform,
            contextName: 'trackpad-kick');
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
    _postGestureBounceTimer?.cancel();
    _wheelZoomBounceTimer?.cancel();
    _wheelZoomAnchorTimer?.cancel();
    _wheelInertiaTimer?.cancel();
    _wheelScrollSessionTimer?.cancel();
    _physicalEventSubscription?.cancel();
    _commandSubscription?.cancel();
    _keyboardFocusNode.dispose();
    super.dispose();
  }

  /// Handle DiagramEventUnion using the viewer's default pan/zoom/inertia logic
  void _handleEventAsUsual(DiagramEventUnion event) {
    // For now, we'll implement a simplified version that handles the most common cases
    // TODO: Implement full event handling for all event types

    event.when(
      tap: (tapEvent) {
        // Handle tap with default logic (if any)
        _handleTapAsUsual(tapEvent);
      },
      doubleTap: (doubleTapEvent) {
        // Handle double tap with default logic
        _handleDoubleTapAsUsual(doubleTapEvent);
      },
      longPress: (longPressEvent) {
        // Handle long press with default logic
        _handleLongPressAsUsual(longPressEvent);
      },
      scroll: (scrollEvent) {
        // Handle scroll with default logic
        _handleScrollAsUsual(scrollEvent);
      },
      dragBegin: (dragEvent) {
        // Handle drag begin with default pan/zoom logic
        _handleDragBeginAsUsual(dragEvent);
      },
      dragContinue: (dragEvent) {
        // Handle drag continue with default pan/zoom logic
        _handleDragContinueAsUsual(dragEvent);
      },
      dragEnd: (dragEvent) {
        // Handle drag end with default pan/zoom logic
        _handleDragEndAsUsual(dragEvent);
      },
      pinchBegin: (pinchEvent) {
        // Handle pinch begin with default logic
        _handlePinchBeginAsUsual(pinchEvent);
      },
      pinchContinue: (pinchEvent) {
        // Handle pinch continue with default logic
        _handlePinchContinueAsUsual(pinchEvent);
      },
      pinchEnd: (pinchEvent) {
        // Handle pinch end with default logic
        _handlePinchEndAsUsual(pinchEvent);
      },
      selectionAreaStart: (eventId, logicalRect, transformSnapshot, timestamp,
          coveredObjectIds) {
        // Handle selection area start with default logic
        _handleSelectionAreaStartAsUsual(eventId, logicalRect,
            transformSnapshot, timestamp, coveredObjectIds);
      },
      selectionAreaUpdate: (eventId, logicalRect, transformSnapshot, timestamp,
          coveredObjectIds) {
        // Handle selection area update with default logic
        _handleSelectionAreaUpdateAsUsual(eventId, logicalRect,
            transformSnapshot, timestamp, coveredObjectIds);
      },
      selectionAreaEnd: (eventId, logicalRect, transformSnapshot, timestamp,
          coveredObjectIds) {
        // Handle selection area end with default logic
        _handleSelectionAreaEndAsUsual(eventId, logicalRect, transformSnapshot,
            timestamp, coveredObjectIds);
      },
      dragTargetEnter: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        // Handle drag target enter with default logic
        _handleDragTargetEnterAsUsual(eventId, dataPreview, screenPosition,
            logicalPosition, transformSnapshot, timestamp);
      },
      dragTargetOver: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp, snappedLogicalPosition) {
        // Handle drag target over with default logic
        _handleDragTargetOverAsUsual(
            eventId,
            dataPreview,
            screenPosition,
            logicalPosition,
            transformSnapshot,
            timestamp,
            snappedLogicalPosition);
      },
      dragTargetLeave: (eventId, transformSnapshot, timestamp) {
        // Handle drag target leave with default logic
        _handleDragTargetLeaveAsUsual(eventId, transformSnapshot, timestamp);
      },
      dragTargetDrop: (eventId, data, screenPosition, logicalPosition,
          transformSnapshot, timestamp, snappedLogicalPosition) {
        // Handle drag target drop with default logic
        _handleDragTargetDropAsUsual(
            eventId,
            data,
            screenPosition,
            logicalPosition,
            transformSnapshot,
            timestamp,
            snappedLogicalPosition);
      },
    );
  }

  /// Handle drag begin events using default pan/zoom logic
  void _handleDragBeginAsUsual(DiagramDragBegin dragEvent) {
    // Use existing pan/zoom logic from the viewer
    // This replicates the behavior that was previously handled by setTransform

    final transformBloc = context.read<TransformBloc>();
    final eventBloc = context.read<EventManagementBloc>();

    // Check if we're already in an active pointer state
    if (eventBloc.state is PointerActiveState) {
      return; // Already handling a drag
    }

    // Start pointer event for default pan/zoom behavior
    eventBloc.add(EventManagementEvent.startPointerEvent(
      rawEvent: const PointerDownEvent(
        pointer: 0,
        position: Offset.zero,
        kind: PointerDeviceKind.touch,
      ), // Create a dummy event since we don't have the original
      logicalPosition: dragEvent.logicalPosition,
      hitResults: dragEvent.hitList
          .map((obj) => HitTestResult(
                object: obj,
                distanceFromCenter: 0.0,
                hitPoint: dragEvent.logicalPosition,
              ))
          .toList(),
      pressedKeys:
          dragEvent.metadata['pressedKeys'] as Set<LogicalKeyboardKey>? ?? {},
    ));

    // Store the start position for pan calculations
    _lastPointerLocalPosition = dragEvent.screenPosition;
    _lastPointerMoveTime = DateTime.now();
  }

  /// Handle drag continue events using default pan/zoom logic
  void _handleDragContinueAsUsual(DiagramDragContinue dragEvent) {
    // Use existing pan logic from the viewer
    // This replicates the behavior that was previously handled by setTransform

    final transformBloc = context.read<TransformBloc>();
    final eventBloc = context.read<EventManagementBloc>();

    // Check if we're in an active pointer state
    if (eventBloc.state is! PointerActiveState) {
      return; // Not in a drag session
    }

    // Calculate delta for pan
    if (_lastPointerLocalPosition != null) {
      final delta = dragEvent.screenPosition - _lastPointerLocalPosition!;

      // Apply pan using the existing logic
      final currentTransform = transformBloc.state.transform;

      // Create a new transform with the delta applied
      final newTransform = Transform2D(
        scale: currentTransform.scale,
        translation: currentTransform.translation + delta,
        rotation: currentTransform.rotation,
      );

      // Cap the transform to valid bounds
      final cappedTransform = Transform2DUtils.capTransform(
        transform: newTransform,
        diagramRect: transformBloc.state.diagramRect,
        size: transformBloc.state.viewportSize,
        dynamic: false, // No overscroll for programmatic pan
      );

      // Apply the pan
      transformBloc
          .add(TransformEvent.updateTransform(transform: cappedTransform));

      // Update stored position
      _lastPointerLocalPosition = dragEvent.screenPosition;

      // Update velocity sampling for inertia
      if (_lastPointerMoveTime != null) {
        final now = DateTime.now();
        final duration = now.difference(_lastPointerMoveTime!);
        if (duration.inMilliseconds > 0) {
          _recentPointerDeltas
              .add(cappedTransform.translation - currentTransform.translation);
          _recentPointerDeltaMs.add(duration.inMilliseconds);

          // Keep only recent samples
          if (_recentPointerDeltas.length > 10) {
            _recentPointerDeltas.removeAt(0);
            _recentPointerDeltaMs.removeAt(0);
          }
        }
        _lastPointerMoveTime = now;
      }
    }
  }

  /// Handle drag end events using default pan/zoom logic
  void _handleDragEndAsUsual(DiagramDragEnd dragEvent) {
    // Use existing inertia logic from the viewer
    // This replicates the behavior that was previously handled by setTransform

    final transformBloc = context.read<TransformBloc>();
    final eventBloc = context.read<EventManagementBloc>();

    // Check if we're in an active pointer state
    if (eventBloc.state is! PointerActiveState) {
      return; // Not in a drag session
    }

    // End the pointer event
    eventBloc.add(EventManagementEvent.endPointerEvent(
      rawEvent: const PointerUpEvent(
        pointer: 0,
        position: Offset.zero,
        kind: PointerDeviceKind.touch,
      ),
      pressedKeys: {},
    ));

    // Calculate final velocity for inertia
    if (_recentPointerDeltas.isNotEmpty && _recentPointerDeltaMs.isNotEmpty) {
      final totalDelta = _recentPointerDeltas.reduce((a, b) => a + b);
      final totalTime = _recentPointerDeltaMs.reduce((a, b) => a + b);

      if (totalTime > 0) {
        final velocity = Offset(
          totalDelta.dx / (totalTime / 1000.0),
          totalDelta.dy / (totalTime / 1000.0),
        );

        // Start inertia if velocity is significant
        if (velocity.distance > 50.0) {
          // 50 px/s threshold
          _inertia.start(
            initialVelocity: velocity,
            interval: const Duration(milliseconds: 16),
            frictionFactor: 0.95,
            minStopVelocity: 10.0,
            maxDuration: const Duration(seconds: 2),
            onTick: (delta) {
              if (!mounted) return;

              final currentTransform = transformBloc.state.transform;
              final newTransform = Transform2D(
                scale: currentTransform.scale,
                translation: currentTransform.translation + delta,
                rotation: currentTransform.rotation,
              );

              final cappedTransform = Transform2DUtils.capTransform(
                transform: newTransform,
                diagramRect: transformBloc.state.diagramRect,
                size: transformBloc.state.viewportSize,
                dynamic: false,
              );

              transformBloc.add(
                  TransformEvent.updateTransform(transform: cappedTransform));
            },
            onStop: () {
              // Inertia stopped
            },
          );
        }
      }
    }

    // Clear stored data
    _lastPointerLocalPosition = null;
    _lastPointerMoveTime = null;
    _recentPointerDeltas.clear();
    _recentPointerDeltaMs.clear();
  }

  /// Handle tap events using default logic
  void _handleTapAsUsual(DiagramTap tapEvent) {
    // Implement basic tap handling logic
    // This method now provides default behavior for tap events

    // Basic tap handling: focus management and default selection
    if (mounted) {
      // Ensure the widget has focus for keyboard events
      if (!_keyboardFocusNode.hasFocus) {
        _keyboardFocusNode.requestFocus();
      }

      // Default tap behavior: could trigger selection or focus changes
      // For now, we'll just log that tap was handled (in debug mode)
      if (widget.debug) {
        debugPrint(
            '[Viewer] Tap handled via handleAsUsual: ${tapEvent.eventId}');
      }
    }
  }

  /// Handle double tap events using default logic
  void _handleDoubleTapAsUsual(DiagramDoubleTap doubleTapEvent) {
    // Implement basic double tap handling logic
    // This method now provides default behavior for double tap events

    // Basic double tap handling: zoom to fit or reset transform
    if (mounted) {
      // Default double tap behavior: zoom to fit
      // This is a common expectation for double tap
      if (widget.debug) {
        debugPrint(
            '[Viewer] Double tap handled via handleAsUsual: ${doubleTapEvent.eventId}');
      }

      // Could implement zoom to fit logic here
      // For now, we just acknowledge the event was handled
    }
  }

  /// Handle long press events using default logic
  void _handleLongPressAsUsual(DiagramLongPress longPressEvent) {
    // Implement basic long press handling logic
    // This method now provides default behavior for long press events

    // Basic long press handling: context menu or selection mode
    if (mounted) {
      // Default long press behavior: could trigger context menu
      if (widget.debug) {
        debugPrint(
            '[Viewer] Long press handled via handleAsUsual: ${longPressEvent.eventId}');
      }

      // Could implement context menu or selection mode activation here
      // For now, we just acknowledge the event was handled
    }
  }

  /// Handle scroll events using default logic
  void _handleScrollAsUsual(DiagramScroll scrollEvent) {
    // Implement basic scroll handling logic
    // This method now provides default behavior for scroll events

    // Basic scroll handling: pan based on scroll delta
    if (mounted) {
      // Default scroll behavior: pan based on scroll delta
      if (widget.debug) {
        debugPrint(
            '[Viewer] Scroll handled via handleAsUsual: ${scrollEvent.eventId}');
      }

      // Could implement pan logic based on scroll delta here
      // For now, we just acknowledge the event was handled
    }
  }

  /// Handle pinch begin events using default logic
  void _handlePinchBeginAsUsual(DiagramPinchBegin pinchEvent) {
    // Implement basic pinch begin handling logic
    // This method now provides default behavior for pinch begin events

    // Basic pinch handling: prepare for zoom/rotation
    if (mounted) {
      // Default pinch behavior: prepare for multi-touch gesture
      if (widget.debug) {
        debugPrint(
            '[Viewer] Pinch begin handled via handleAsUsual: ${pinchEvent.eventId}');
      }

      // Could implement pinch preparation logic here
      // For now, we just acknowledge the event was handled
    }
  }

  /// Handle pinch continue events using default logic
  void _handlePinchContinueAsUsual(DiagramPinchContinue pinchEvent) {
    // Implement basic pinch continue handling logic
    // This method now provides default behavior for pinch continue events

    // Basic pinch handling: real-time zoom/rotation updates
    if (mounted) {
      // Default pinch continue behavior: real-time updates
      if (widget.debug) {
        debugPrint(
            '[Viewer] Pinch continue handled via handleAsUsual: ${pinchEvent.eventId}');
      }

      // Could implement real-time zoom/rotation logic here
      // For now, we just acknowledge the event was handled
    }
  }

  /// Handle pinch end events using default logic
  void _handlePinchEndAsUsual(DiagramPinchEnd pinchEvent) {
    // Implement basic pinch end handling logic
    // This method now provides default behavior for pinch end events

    // Basic pinch handling: final zoom/rotation application
    if (mounted) {
      // Default pinch end behavior: final application
      if (widget.debug) {
        debugPrint(
            '[Viewer] Pinch end handled via handleAsUsual: ${pinchEvent.eventId}');
      }

      // Could implement final zoom/rotation logic here
      // For now, we just acknowledge the event was handled
    }
  }

  /// Handle selection area start events using default logic
  void _handleSelectionAreaStartAsUsual(
      String eventId,
      Rect logicalRect,
      Transform2D transformSnapshot,
      Duration timestamp,
      List<String> coveredObjectIds) {
    // TODO: Implement default selection area start handling logic
  }

  /// Handle selection area update events using default logic
  void _handleSelectionAreaUpdateAsUsual(
      String eventId,
      Rect logicalRect,
      Transform2D transformSnapshot,
      Duration timestamp,
      List<String> coveredObjectIds) {
    // TODO: Implement default selection area update handling logic
  }

  /// Handle selection area end events using default logic
  void _handleSelectionAreaEndAsUsual(
      String eventId,
      Rect logicalRect,
      Transform2D transformSnapshot,
      Duration timestamp,
      List<String> coveredObjectIds) {
    // TODO: Implement default selection area end handling logic
  }

  /// Handle drag target drop events using default logic
  void _handleDragTargetDropAsUsual(
      String eventId,
      Object data,
      Offset screenPosition,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      Duration timestamp,
      Offset? snappedLogicalPosition) {
    // TODO: Implement default drag target drop handling logic
  }

  /// Handle drag target enter events using default logic
  void _handleDragTargetEnterAsUsual(
      String eventId,
      Object dataPreview,
      Offset screenPosition,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      Duration timestamp) {
    // TODO: Implement default drag target enter handling logic
  }

  /// Handle drag target over events using default logic
  void _handleDragTargetOverAsUsual(
      String eventId,
      Object dataPreview,
      Offset screenPosition,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      Duration timestamp,
      Offset? snappedLogicalPosition) {
    // TODO: Implement default drag target over handling logic
  }

  /// Handle drag target leave events using default logic
  void _handleDragTargetLeaveAsUsual(
      String eventId, Transform2D transformSnapshot, Duration timestamp) {
    // TODO: Implement default drag target leave handling logic
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

class _SelectionOverlayPainter extends CustomPainter {
  final Rect selectionRect;
  final Transform2D transform;
  final DiagramConfiguration configuration;

  const _SelectionOverlayPainter({
    required this.selectionRect,
    required this.transform,
    required this.configuration,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Convert logical rectangle to physical coordinates
    final topLeft = transform.logicalToPhysical(selectionRect.topLeft);
    final bottomRight = transform.logicalToPhysical(selectionRect.bottomRight);
    final physicalRect = Rect.fromPoints(topLeft, bottomRight);

    // Draw selection rectangle with semi-transparent fill and border
    final fillPaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw fill
    canvas.drawRect(physicalRect, fillPaint);

    // Draw border
    canvas.drawRect(physicalRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _SelectionOverlayPainter oldDelegate) {
    return oldDelegate.selectionRect != selectionRect ||
        oldDelegate.transform != transform ||
        oldDelegate.configuration != configuration;
  }
}
