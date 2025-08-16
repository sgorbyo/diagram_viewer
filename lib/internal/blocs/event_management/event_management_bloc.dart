import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'event_management_event.dart';
import 'event_management_state.dart';

/// Manages complex event states and isolation
class EventManagementBloc
    extends Bloc<EventManagementEvent, EventManagementState> {
  // Debounce window to avoid switching interaction types too quickly
  final Duration _debounceTime; // default ~60 FPS
  DateTime? _lastEventTime;
  final Set<LogicalKeyboardKey> _pressedKeys = {};

  // Stream controllers for PhysicalEvents
  final StreamController<PhysicalEvent> _physicalEventController =
      StreamController<PhysicalEvent>.broadcast();
  Stream<PhysicalEvent> get physicalEvents => _physicalEventController.stream;

  // Throttling state for pointer updates (~60 FPS)
  DateTime? _lastPointerUpdateEmit;
  PointerEvent? _pendingPointerMoveRaw;
  Offset? _pendingPointerMoveLogical;
  List<HitTestResult>? _pendingPointerMoveHits;
  Set<LogicalKeyboardKey>? _pendingPointerMoveKeys;
  // Tolerance to avoid over-emitting around frame boundaries
  final Duration _throttleTolerance = const Duration(milliseconds: 8);
  // Gesture throttling state
  DateTime? _lastGestureUpdateEmit;
  Object? _pendingGestureRaw;
  Offset? _pendingGestureLogical;
  List<HitTestResult>? _pendingGestureHits;
  Set<LogicalKeyboardKey>? _pendingGestureKeys;

  // Dependencies for getting current state
  TransformBloc? _transformBloc;
  DiagramConfiguration? _configuration;
  Size? _viewportSize;
  Offset? _viewportTopLeftGlobal;

  EventManagementBloc({Duration? debounceTime})
      : _debounceTime = debounceTime ?? const Duration(milliseconds: 16),
        super(const EventManagementState.idle()) {
    on<EventManagementEvent>((event, emit) {
      event.when(
        startPointerEvent:
            (rawEvent, logicalPosition, hitResults, pressedKeys) =>
                _handleStartPointer(
                    rawEvent, logicalPosition, hitResults, pressedKeys, emit),
        updatePointerEvent:
            (rawEvent, logicalPosition, hitResults, pressedKeys) =>
                _handleUpdatePointer(
                    rawEvent, logicalPosition, hitResults, pressedKeys, emit),
        endPointerEvent: (rawEvent, pressedKeys) =>
            _handleEndPointer(rawEvent, pressedKeys, emit),
        startGestureEvent:
            (rawEvent, logicalPosition, hitResults, pressedKeys) =>
                _handleStartGesture(
                    rawEvent, logicalPosition, hitResults, pressedKeys, emit),
        updateGestureEvent:
            (rawEvent, logicalPosition, hitResults, pressedKeys) =>
                _handleUpdateGesture(
                    rawEvent, logicalPosition, hitResults, pressedKeys, emit),
        endGestureEvent: (rawEvent, pressedKeys) =>
            _handleEndGesture(rawEvent, pressedKeys, emit),
        startKeyboardEvent: (rawEvent) => _handleStartKeyboard(rawEvent, emit),
        updateModifierKeys: (keys) => _handleUpdateModifierKeys(keys, emit),
        resetState: () => _handleReset(emit),
      );
    });
  }

  /// Check if new event can be processed
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

  /// Handle start of pointer event
  void _handleStartPointer(
    PointerEvent rawEvent,
    Offset logicalPosition,
    List<HitTestResult> hitResults,
    Set<LogicalKeyboardKey> pressedKeys,
    Emitter<EventManagementState> emit,
  ) {
    if (!canStartNewEvent(InteractionType.pointer)) {
      return; // Block different event type
    }

    final eventId = _generateEventId();
    final startTime = DateTime.now();

    emit(EventManagementState.pointerActive(
      eventId: eventId,
      pressedMouseButtons: _extractMouseButtons(rawEvent),
      pressedKeys: pressedKeys,
      startTime: startTime,
      startPosition: logicalPosition,
      lastPosition: logicalPosition,
      lastHitList: hitResults.map((r) => r.object).toList(),
    ));

    _emitPhysicalEvent(PhysicalEvent.pointer(
      eventId: eventId,
      logicalPosition: logicalPosition,
      screenPosition: rawEvent.position,
      transformSnapshot: _getCurrentTransform(),
      hitList: hitResults.map((r) => r.object).toList(),
      borderProximity: _getBorderProximity(rawEvent.position),
      phase: InteractionPhase.start,
      rawEvent: rawEvent,
      delta: null,
      currentViewport: _getCurrentViewport(),
      pressedMouseButtons: _extractMouseButtons(rawEvent),
      pressedKeys: pressedKeys,
      activeInteraction: InteractionType.pointer,
    ));

    _lastEventTime = startTime;
  }

  /// Handle update of pointer event
  void _handleUpdatePointer(
    PointerEvent rawEvent,
    Offset logicalPosition,
    List<HitTestResult> hitResults,
    Set<LogicalKeyboardKey> pressedKeys,
    Emitter<EventManagementState> emit,
  ) {
    final currentState = state;
    if (currentState is! PointerActiveState) {
      return;
    }

    emit(currentState.copyWith(
      pressedMouseButtons: _extractMouseButtons(rawEvent),
      pressedKeys: pressedKeys,
      lastPosition: logicalPosition,
      lastHitList: hitResults.map((r) => r.object).toList(),
    ));
    // Coalesce: store latest move to emit on next allowed tick
    _pendingPointerMoveRaw = rawEvent;
    _pendingPointerMoveLogical = logicalPosition;
    _pendingPointerMoveHits = hitResults;
    _pendingPointerMoveKeys = pressedKeys;

    final now = DateTime.now();
    final window = _debounceTime + _throttleTolerance;
    final canEmitNow = _lastPointerUpdateEmit == null ||
        now.difference(_lastPointerUpdateEmit!) >= window;
    if (canEmitNow) {
      _lastPointerUpdateEmit = now;
      _emitPhysicalEvent(PhysicalEvent.pointer(
        eventId: currentState.eventId,
        logicalPosition: logicalPosition,
        screenPosition: rawEvent.position,
        transformSnapshot: _getCurrentTransform(),
        hitList: hitResults.map((r) => r.object).toList(),
        borderProximity: _getBorderProximity(rawEvent.position),
        phase: InteractionPhase.update,
        rawEvent: rawEvent,
        delta: rawEvent is PointerMoveEvent ? rawEvent.delta : null,
        currentViewport: _getCurrentViewport(),
        pressedMouseButtons: _extractMouseButtons(rawEvent),
        pressedKeys: pressedKeys,
        activeInteraction: InteractionType.pointer,
      ));
      _pendingPointerMoveRaw = null;
      _pendingPointerMoveLogical = null;
      _pendingPointerMoveHits = null;
      _pendingPointerMoveKeys = null;
    }

    _lastEventTime = DateTime.now();
  }

  /// Handle end of pointer event
  void _handleEndPointer(
    PointerEvent rawEvent,
    Set<LogicalKeyboardKey> pressedKeys,
    Emitter<EventManagementState> emit,
  ) {
    final currentState = state;
    if (currentState is! PointerActiveState) return;

    // Flush any pending coalesced update before ending, to not lose the last position
    if (_pendingPointerMoveRaw != null && state is PointerActiveState) {
      final currentState = state as PointerActiveState;
      final last = _pendingPointerMoveRaw!;
      final lastLogical =
          _pendingPointerMoveLogical ?? currentState.lastPosition;
      final lastHits = _pendingPointerMoveHits ?? [];
      final lastKeys = _pendingPointerMoveKeys ?? {};
      _emitPhysicalEvent(PhysicalEvent.pointer(
        eventId: currentState.eventId,
        logicalPosition: lastLogical,
        screenPosition: last.position,
        transformSnapshot: _getCurrentTransform(),
        hitList: lastHits.map((r) => r.object).toList(),
        borderProximity: _getBorderProximity(last.position),
        phase: InteractionPhase.update,
        rawEvent: last,
        delta: last is PointerMoveEvent ? last.delta : null,
        currentViewport: _getCurrentViewport(),
        pressedMouseButtons: _extractMouseButtons(last),
        pressedKeys: lastKeys,
        activeInteraction: InteractionType.pointer,
      ));
      _pendingPointerMoveRaw = null;
      _pendingPointerMoveLogical = null;
      _pendingPointerMoveHits = null;
      _pendingPointerMoveKeys = null;
    }

    emit(const EventManagementState.idle());

    _emitPhysicalEvent(PhysicalEvent.pointer(
      eventId: currentState.eventId,
      logicalPosition: currentState.lastPosition,
      screenPosition: rawEvent.position,
      transformSnapshot: _getCurrentTransform(),
      hitList: currentState.lastHitList,
      borderProximity: _getBorderProximity(rawEvent.position),
      phase: InteractionPhase.end,
      rawEvent: rawEvent,
      delta: null,
      currentViewport: _getCurrentViewport(),
      pressedMouseButtons: _extractMouseButtons(rawEvent),
      pressedKeys: pressedKeys,
      activeInteraction: null,
    ));

    _lastEventTime = DateTime.now();
    _lastPointerUpdateEmit = null; // reset throttling window on end
  }

  /// Handle start of gesture event
  void _handleStartGesture(
    Object rawEvent,
    Offset logicalPosition,
    List<HitTestResult> hitResults,
    Set<LogicalKeyboardKey> pressedKeys,
    Emitter<EventManagementState> emit,
  ) {
    if (!canStartNewEvent(InteractionType.gesture)) {
      return; // Block different event type
    }

    final eventId = _generateEventId();
    final startTime = DateTime.now();

    emit(EventManagementState.gestureActive(
      eventId: eventId,
      pressedKeys: pressedKeys,
      startTime: startTime,
      startPosition: logicalPosition,
    ));

    _emitPhysicalEvent(PhysicalEvent.gesture(
      eventId: eventId,
      logicalPosition: logicalPosition,
      screenPosition: _getScreenPosition(rawEvent),
      transformSnapshot: _getCurrentTransform(),
      hitList: hitResults.map((r) => r.object).toList(),
      borderProximity: _getBorderProximity(_getScreenPosition(rawEvent)),
      phase: InteractionPhase.start,
      rawEvent: rawEvent,
      scale: null,
      rotation: null,
      currentViewport: _getCurrentViewport(),
      pressedKeys: pressedKeys,
      activeInteraction: InteractionType.gesture,
    ));

    _lastEventTime = startTime;
  }

  /// Handle update of gesture event
  void _handleUpdateGesture(
    Object rawEvent,
    Offset logicalPosition,
    List<HitTestResult> hitResults,
    Set<LogicalKeyboardKey> pressedKeys,
    Emitter<EventManagementState> emit,
  ) {
    final currentState = state;
    if (currentState is! GestureActiveState) return;

    emit(currentState.copyWith(
      pressedKeys: pressedKeys,
    ));

    // Coalescing for gesture updates (~60 FPS)
    _pendingGestureRaw = rawEvent;
    _pendingGestureLogical = logicalPosition;
    _pendingGestureHits = hitResults;
    _pendingGestureKeys = pressedKeys;

    final now = DateTime.now();
    final window = _debounceTime + _throttleTolerance;
    final canEmitNow = _lastGestureUpdateEmit == null ||
        now.difference(_lastGestureUpdateEmit!) >= window;
    if (canEmitNow) {
      _lastGestureUpdateEmit = now;
      _emitPhysicalEvent(PhysicalEvent.gesture(
        eventId: currentState.eventId,
        logicalPosition: logicalPosition,
        screenPosition: _getScreenPosition(rawEvent),
        transformSnapshot: _getCurrentTransform(),
        hitList: hitResults.map((r) => r.object).toList(),
        borderProximity: _getBorderProximity(_getScreenPosition(rawEvent)),
        phase: InteractionPhase.update,
        rawEvent: rawEvent,
        scale: _extractScale(rawEvent),
        rotation: _extractRotation(rawEvent),
        currentViewport: _getCurrentViewport(),
        pressedKeys: pressedKeys,
        activeInteraction: InteractionType.gesture,
      ));
      _pendingGestureRaw = null;
      _pendingGestureLogical = null;
      _pendingGestureHits = null;
      _pendingGestureKeys = null;
    }

    _lastEventTime = now;
  }

  /// Handle end of gesture event
  void _handleEndGesture(
    Object rawEvent,
    Set<LogicalKeyboardKey> pressedKeys,
    Emitter<EventManagementState> emit,
  ) {
    final currentState = state;
    if (currentState is! GestureActiveState) return;

    // Flush any pending gesture update before ending
    if (_pendingGestureRaw != null) {
      final pending = _pendingGestureRaw!;
      final lastLogical = _pendingGestureLogical ?? currentState.startPosition;
      final lastHits = _pendingGestureHits ?? [];
      final lastKeys = _pendingGestureKeys ?? {};
      _emitPhysicalEvent(PhysicalEvent.gesture(
        eventId: currentState.eventId,
        logicalPosition: lastLogical,
        screenPosition: _getScreenPosition(pending),
        transformSnapshot: _getCurrentTransform(),
        hitList: lastHits.map((r) => r.object).toList(),
        borderProximity: _getBorderProximity(_getScreenPosition(pending)),
        phase: InteractionPhase.update,
        rawEvent: pending,
        scale: _extractScale(pending),
        rotation: _extractRotation(pending),
        currentViewport: _getCurrentViewport(),
        pressedKeys: lastKeys,
        activeInteraction: InteractionType.gesture,
      ));
      _pendingGestureRaw = null;
      _pendingGestureLogical = null;
      _pendingGestureHits = null;
      _pendingGestureKeys = null;
    }

    emit(const EventManagementState.idle());

    _emitPhysicalEvent(PhysicalEvent.gesture(
      eventId: currentState.eventId,
      logicalPosition: currentState.startPosition,
      screenPosition: _getScreenPosition(rawEvent),
      transformSnapshot: _getCurrentTransform(),
      hitList: [],
      borderProximity: _getBorderProximity(_getScreenPosition(rawEvent)),
      phase: InteractionPhase.end,
      rawEvent: rawEvent,
      scale: null,
      rotation: null,
      currentViewport: _getCurrentViewport(),
      pressedKeys: pressedKeys,
      activeInteraction: null,
    ));

    _lastEventTime = DateTime.now();
  }

  /// Handle start of keyboard event
  void _handleStartKeyboard(
    KeyEvent rawEvent,
    Emitter<EventManagementState> emit,
  ) {
    if (!canStartNewEvent(InteractionType.keyboard)) {
      return; // Block different event type
    }

    final eventId = _generateEventId();
    final startTime = DateTime.now();

    emit(EventManagementState.keyboardActive(
      eventId: eventId,
      pressedKeys: _getCurrentPressedKeys(),
      startTime: startTime,
    ));

    _emitPhysicalEvent(PhysicalEvent.pointer(
      eventId: eventId,
      logicalPosition: Offset.zero, // Keyboard events don't have position
      screenPosition: Offset.zero,
      transformSnapshot: _getCurrentTransform(),
      hitList: [], // Keyboard events don't have hit list
      borderProximity: BorderProximity.none,
      phase: InteractionPhase.start,
      rawEvent: const PointerDownEvent(position: Offset.zero), // Placeholder
      delta: null,
      currentViewport: _getCurrentViewport(),
      pressedMouseButtons: {}, // No mouse buttons for keyboard
      pressedKeys: _getCurrentPressedKeys(),
      activeInteraction: InteractionType.keyboard,
    ));

    _lastEventTime = startTime;
  }

  /// Handle update of modifier keys
  void _handleUpdateModifierKeys(
      Set<LogicalKeyboardKey> keys, Emitter<EventManagementState> emit) {
    final currentState = state;

    // Check for navigation keys
    final navigationKeys = {
      LogicalKeyboardKey.arrowUp,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowLeft,
      LogicalKeyboardKey.arrowRight,
      LogicalKeyboardKey.pageUp,
      LogicalKeyboardKey.pageDown,
      LogicalKeyboardKey.home,
      LogicalKeyboardKey.end,
    };

    final hasNavigationKey = keys.any((key) => navigationKeys.contains(key));

    if (hasNavigationKey) {
      // Create a keyboard event for navigation
      final eventId = _generateEventId();
      final startTime = DateTime.now();

      emit(EventManagementState.keyboardActive(
        eventId: eventId,
        pressedKeys: keys,
        startTime: startTime,
      ));

      _emitPhysicalEvent(PhysicalEvent.pointer(
        eventId: eventId,
        logicalPosition: Offset.zero, // Keyboard events don't have position
        screenPosition: Offset.zero,
        transformSnapshot: _getCurrentTransform(),
        hitList: [], // Keyboard events don't have hit list
        borderProximity: BorderProximity.none,
        phase: InteractionPhase.start,
        rawEvent: const PointerDownEvent(position: Offset.zero), // Placeholder
        delta: null,
        currentViewport: _getCurrentViewport(),
        pressedMouseButtons: {}, // No mouse buttons for keyboard
        pressedKeys: keys,
        activeInteraction: InteractionType.keyboard,
      ));

      _lastEventTime = startTime;
    } else {
      // Update only the state for non-navigation keys
      if (currentState is PointerActiveState) {
        emit(currentState.copyWith(pressedKeys: keys));

        // Emit updated pointer event
        _emitPhysicalEvent(PhysicalEvent.pointer(
          eventId: currentState.eventId,
          logicalPosition: currentState
              .startPosition, // Or current logical position if tracked
          screenPosition:
              Offset.zero, // Placeholder, needs actual current screen position
          transformSnapshot: _getCurrentTransform(),
          hitList: [], // Placeholder, needs actual hit results
          borderProximity: BorderProximity.none, // Placeholder
          phase: InteractionPhase.update,
          rawEvent: const PointerDownEvent(
              position: Offset.zero), // Placeholder, needs actual raw event
          delta: null,
          currentViewport: _getCurrentViewport(),
          pressedMouseButtons: currentState.pressedMouseButtons,
          pressedKeys: keys,
          activeInteraction: InteractionType.pointer,
        ));
      } else if (currentState is GestureActiveState) {
        emit(currentState.copyWith(pressedKeys: keys));

        // Emit updated gesture event
        _emitPhysicalEvent(PhysicalEvent.gesture(
          eventId: currentState.eventId,
          logicalPosition: currentState
              .startPosition, // Or current logical position if tracked
          screenPosition: Offset.zero, // Placeholder
          transformSnapshot: _getCurrentTransform(),
          hitList: [], // Placeholder
          borderProximity: BorderProximity.none, // Placeholder
          phase: InteractionPhase.update,
          rawEvent: Object(), // Placeholder
          scale: null,
          rotation: null,
          currentViewport: _getCurrentViewport(),
          pressedKeys: keys,
          activeInteraction: InteractionType.gesture,
        ));
      }
    }
  }

  /// Handle reset state
  void _handleReset(Emitter<EventManagementState> emit) {
    emit(const EventManagementState.idle());
    _lastEventTime = null;
  }

  // Helper methods
  String _generateEventId() => DateTime.now().microsecondsSinceEpoch.toString();

  InteractionType? _getCurrentInteractionType() {
    final currentState = state;
    if (currentState is PointerActiveState) return InteractionType.pointer;
    if (currentState is GestureActiveState) return InteractionType.gesture;
    if (currentState is KeyboardActiveState) return InteractionType.keyboard;
    return null;
  }

  Set<MouseButton> _extractMouseButtons(PointerEvent event) {
    final Set<MouseButton> buttons = {};
    if (event.buttons & 1 != 0) buttons.add(MouseButton.left);
    if (event.buttons & 2 != 0) buttons.add(MouseButton.right);
    if (event.buttons & 4 != 0) buttons.add(MouseButton.middle);
    if (event.buttons & 8 != 0) buttons.add(MouseButton.back);
    if (event.buttons & 16 != 0) buttons.add(MouseButton.forward);
    return buttons;
  }

  Set<LogicalKeyboardKey> _getCurrentPressedKeys() => _pressedKeys;

  Transform2D _getCurrentTransform() {
    // Get from TransformBloc if available
    if (_transformBloc != null) {
      return _transformBloc!.state.transform;
    }
    return const Transform2D(); // Fallback
  }

  Rect _getCurrentViewport() {
    // Calculate viewport based on current known size
    if (_viewportSize != null) {
      return Rect.fromLTWH(0, 0, _viewportSize!.width, _viewportSize!.height);
    }
    return Rect.zero; // Fallback
  }

  // Removed unused helper _getLogicalPosition

  Offset _getScreenPosition(Object? rawEvent) {
    // Pointer events carry absolute screen coordinates
    if (rawEvent is PointerEvent) {
      return rawEvent.position;
    }
    // Scale (pinch/trackpad) gestures expose focalPoint in screen coordinates
    if (rawEvent is ScaleStartDetails) {
      return rawEvent.focalPoint;
    }
    if (rawEvent is ScaleUpdateDetails) {
      return rawEvent.focalPoint;
    }
    if (rawEvent is ScaleEndDetails) {
      // No focalPoint on end; cannot infer reliably without extra state
      return Offset.zero;
    }
    // Fallback for unknown types
    return Offset.zero;
  }

  BorderProximity _getBorderProximity(Offset screenPosition) {
    // Require viewport size and configuration
    if (_viewportSize == null || _configuration == null) {
      return BorderProximity.none;
    }

    final threshold = _configuration!.edgeThreshold;
    final width = _viewportSize!.width;
    final height = _viewportSize!.height;

    // If we know the viewport top-left in global coords, convert to local
    final localDx = _viewportTopLeftGlobal != null
        ? (screenPosition.dx - _viewportTopLeftGlobal!.dx)
        : screenPosition.dx;
    final localDy = _viewportTopLeftGlobal != null
        ? (screenPosition.dy - _viewportTopLeftGlobal!.dy)
        : screenPosition.dy;

    // Distances to edges
    final left = localDx;
    final right = (width - localDx).clamp(0.0, double.infinity);
    final top = localDy;
    final bottom = (height - localDy).clamp(0.0, double.infinity);

    final isNearLeft = left <= threshold;
    final isNearRight = right <= threshold;
    final isNearTop = top <= threshold;
    final isNearBottom = bottom <= threshold;

    // If not near any, return none with infinity distance
    if (!isNearLeft && !isNearRight && !isNearTop && !isNearBottom) {
      return BorderProximity.none.copyWith(threshold: threshold);
    }

    final distances = <double>[
      if (isNearLeft) left else double.infinity,
      if (isNearRight) right else double.infinity,
      if (isNearTop) top else double.infinity,
      if (isNearBottom) bottom else double.infinity,
    ];
    final minDistance = distances.reduce((a, b) => a < b ? a : b);

    return BorderProximity(
      isNearLeft: isNearLeft,
      isNearRight: isNearRight,
      isNearTop: isNearTop,
      isNearBottom: isNearBottom,
      distanceFromEdge: minDistance,
      threshold: threshold,
    );
  }

  double? _extractScale(Object rawEvent) {
    if (rawEvent is ScaleUpdateDetails) {
      return rawEvent.scale;
    }
    return null;
  }

  double? _extractRotation(Object rawEvent) {
    if (rawEvent is ScaleUpdateDetails) {
      return rawEvent.rotation;
    }
    return null;
  }

  void _emitPhysicalEvent(PhysicalEvent event) {
    _physicalEventController.add(event);
  }

  /// Configure dependencies for getting current state
  void configureDependencies({
    TransformBloc? transformBloc,
    DiagramConfiguration? configuration,
    Size? viewportSize,
    Offset? viewportTopLeft,
  }) {
    _transformBloc = transformBloc;
    _configuration = configuration;
    _viewportSize = viewportSize;
    _viewportTopLeftGlobal = viewportTopLeft;
  }

  @override
  Future<void> close() {
    _physicalEventController.close();
    return super.close();
  }
}
