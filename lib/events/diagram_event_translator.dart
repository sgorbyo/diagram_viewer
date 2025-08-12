import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:diagram_viewer/events/physical_event.dart';
import 'package:diagram_viewer/events/diagram_event.dart';
import 'package:diagram_viewer/events/mouse_button.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/border_proximity.dart';

/// Translates PhysicalEvents to DiagramEvents
class DiagramEventTranslator {
  final Map<String, _EventState> _activeEvents = {};
  final List<_ScrollEvent> _recentScrollEvents = [];
  final Duration _scrollVelocityWindow = const Duration(milliseconds: 100);
  // Unused: retained for potential future use
  // final Duration _scrollVelocityThreshold = const Duration(milliseconds: 50);

  /// Translate a PhysicalEvent to DiagramEventUnion
  DiagramEventUnion? translate(PhysicalEvent physicalEvent) {
    final result = physicalEvent.when(
      pointer: _handlePointerEvent,
      gesture: _handleGestureEvent,
      keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys,
          currentViewport, activeInteraction) {
        return _handleKeyboardEvent(
          eventId,
          transformSnapshot,
          rawEvent,
          pressedKeys,
          currentViewport,
          activeInteraction,
        );
      },
      dndTargetEnter: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        return DiagramEventUnion.dragTargetEnter(
          eventId: eventId,
          dataPreview: dataPreview,
          screenPosition: screenPosition,
          logicalPosition: logicalPosition,
          transformSnapshot: transformSnapshot,
          timestamp: timestamp,
        );
      },
      dndTargetOver: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        return DiagramEventUnion.dragTargetOver(
          eventId: eventId,
          dataPreview: dataPreview,
          screenPosition: screenPosition,
          logicalPosition: logicalPosition,
          transformSnapshot: transformSnapshot,
          timestamp: timestamp,
        );
      },
      dndTargetLeave: (eventId, transformSnapshot, timestamp) {
        return DiagramEventUnion.dragTargetLeave(
          eventId: eventId,
          transformSnapshot: transformSnapshot,
          timestamp: timestamp,
        );
      },
      dndTargetDrop: (eventId, data, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        return DiagramEventUnion.dragTargetDrop(
          eventId: eventId,
          data: data,
          screenPosition: screenPosition,
          logicalPosition: logicalPosition,
          transformSnapshot: transformSnapshot,
          timestamp: timestamp,
        );
      },
    );
    return result;
  }

  /// Handle pointer events (mouse, touch)
  DiagramEventUnion? _handlePointerEvent(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    BorderProximity borderProximity,
    InteractionPhase phase,
    PointerEvent rawEvent,
    Offset? delta,
    Rect currentViewport,
    Set<MouseButton> pressedMouseButtons,
    Set<LogicalKeyboardKey> pressedKeys,
    InteractionType? activeInteraction,
  ) {
    // Check if this is a keyboard event disguised as a pointer event
    if (activeInteraction == InteractionType.keyboard) {
      // Handle as keyboard event
      return _handleKeyboardEvent(
        eventId,
        transformSnapshot,
        rawEvent,
        pressedKeys,
        currentViewport,
        activeInteraction,
      );
    }

    final eventKey = _generateEventKey(rawEvent);
    final isOnObject = hitList.isNotEmpty;
    final mouseButton =
        pressedMouseButtons.isNotEmpty ? pressedMouseButtons.first : null;

    switch (phase) {
      case InteractionPhase.start:
        return _handlePointerStart(
          eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          rawEvent,
          isOnObject,
          mouseButton,
          eventKey,
          activeInteraction,
        );

      case InteractionPhase.update:
        return _handlePointerUpdate(
          eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          rawEvent,
          delta,
          eventKey,
          borderProximity,
        );

      case InteractionPhase.end:
        return _handlePointerEnd(
          eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          rawEvent,
          isOnObject,
          mouseButton,
          eventKey,
        );
    }
  }

  /// Handle gesture events (pinch, pan)
  DiagramEventUnion? _handleGestureEvent(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    BorderProximity borderProximity,
    InteractionPhase phase,
    Object rawEvent,
    double? scale,
    double? rotation,
    Rect currentViewport,
    Set<LogicalKeyboardKey> pressedKeys,
    InteractionType? activeInteraction,
  ) {
    final eventKey = _generateEventKey(rawEvent);

    switch (phase) {
      case InteractionPhase.start:
        return _handleGestureStart(
          eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          rawEvent,
          eventKey,
        );

      case InteractionPhase.update:
        return _handleGestureUpdate(
          eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          rawEvent,
          scale,
          rotation,
          eventKey,
        );

      case InteractionPhase.end:
        return _handleGestureEnd(
          eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          rawEvent,
          eventKey,
        );
    }
  }

  /// Handle keyboard events
  DiagramEventUnion? _handleKeyboardEvent(
    String eventId,
    Transform2D transformSnapshot,
    Object rawEvent,
    Set<LogicalKeyboardKey> pressedKeys,
    Rect currentViewport,
    InteractionType? activeInteraction,
  ) {
    // Let all keyboard events reach the controller
    // The controller will decide how to handle them
    return DiagramEventUnion.scroll(
      DiagramScroll(
        eventId: eventId,
        logicalPosition: Offset.zero, // Keyboard events don't have position
        screenPosition: Offset.zero,
        transformSnapshot: transformSnapshot,
        hitList: [], // Keyboard events don't have hit list
        timestamp: Duration.zero,
        metadata: {
          'source': 'keyboard',
          'pressedKeys': pressedKeys.map((k) => k.keyLabel).toList(),
        },
        scrollDelta: 0.0, // Controller will calculate based on pressed keys
        scrollVelocity: 0.0,
        scrollDuration: Duration.zero,
        scrollDirection: Offset.zero, // Controller will determine direction
        isInertial: false,
        scrollCount: 1,
      ),
    );
  }

  /// Handle pointer start events
  DiagramEventUnion? _handlePointerStart(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    PointerEvent rawEvent,
    bool isOnObject,
    MouseButton? mouseButton,
    String eventKey,
    InteractionType? activeInteraction,
  ) {
    // Store event state
    _activeEvents[eventKey] = _EventState(
      startTime: DateTime.now(),
      startPosition: logicalPosition,
      hitList: hitList,
      mouseButton: mouseButton,
      isOnObject: isOnObject,
    );

    // Determine if this is a potential drag
    if (isOnObject) {
      // Object interaction - could become drag
      return DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: eventId,
          logicalPosition: logicalPosition,
          screenPosition: screenPosition,
          transformSnapshot: transformSnapshot,
          hitList: hitList,
          timestamp: Duration.zero,
          metadata: {},
          fingerCount: 1,
          mouseButton: mouseButton,
          isOnObject: isOnObject,
        ),
      );
    } else {
      // Empty space - could become pan
      return DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: eventId,
          logicalPosition: logicalPosition,
          screenPosition: screenPosition,
          transformSnapshot: transformSnapshot,
          hitList: hitList,
          timestamp: Duration.zero,
          metadata: {},
          fingerCount: 1,
          mouseButton: mouseButton,
          isOnObject: isOnObject,
        ),
      );
    }
  }

  /// Handle pointer update events
  DiagramEventUnion? _handlePointerUpdate(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    PointerEvent rawEvent,
    Offset? delta,
    String eventKey,
    BorderProximity borderProximity,
  ) {
    final state = _activeEvents[eventKey];
    if (state == null) {
      return null;
    }

    final duration = DateTime.now().difference(state.startTime);
    final totalDelta = logicalPosition - state.startPosition;

    // Check if this has become a drag using multiple criteria
    if (delta != null && _isDrag(totalDelta, duration)) {
      return DiagramEventUnion.dragContinue(
        DiagramDragContinue(
          eventId: eventId,
          logicalPosition: logicalPosition,
          screenPosition: screenPosition,
          transformSnapshot: transformSnapshot,
          hitList: hitList,
          timestamp: duration,
          metadata: {
            'borderProximity': {
              'isNearLeft': borderProximity.isNearLeft,
              'isNearRight': borderProximity.isNearRight,
              'isNearTop': borderProximity.isNearTop,
              'isNearBottom': borderProximity.isNearBottom,
              'distanceFromEdge': borderProximity.distanceFromEdge,
              'threshold': borderProximity.threshold,
              'normalizedDistance': borderProximity.normalizedDistance,
            },
          },
          delta: delta,
          totalDelta: totalDelta,
          duration: duration,
          velocity: _calculateVelocity(delta, duration),
        ),
      );
    }

    return null;
  }

  /// Handle pointer end events
  DiagramEventUnion? _handlePointerEnd(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    PointerEvent rawEvent,
    bool isOnObject,
    MouseButton? mouseButton,
    String eventKey,
  ) {
    final state = _activeEvents[eventKey];
    if (state == null) {
      return null;
    }

    final duration = DateTime.now().difference(state.startTime);
    final totalDelta = logicalPosition - state.startPosition;

    // Remove from active events
    _activeEvents.remove(eventKey);

    // Determine final event type using multiple criteria
    if (_isDrag(totalDelta, duration)) {
      // This was a drag
      return DiagramEventUnion.dragEnd(
        DiagramDragEnd(
          eventId: eventId,
          logicalPosition: logicalPosition,
          screenPosition: screenPosition,
          transformSnapshot: transformSnapshot,
          hitList: hitList,
          timestamp: duration,
          metadata: {},
          totalDelta: totalDelta,
          totalDuration: duration,
          finalVelocity: _calculateVelocity(totalDelta, duration),
          wasCancelled: false,
        ),
      );
    } else {
      // This was a tap
      return DiagramEventUnion.tap(
        DiagramTap(
          eventId: eventId,
          logicalPosition: logicalPosition,
          screenPosition: screenPosition,
          transformSnapshot: transformSnapshot,
          hitList: hitList,
          timestamp: duration,
          metadata: {},
          fingerCount: 1,
          mouseButton: mouseButton,
          isOnObject: isOnObject,
          pressDuration: duration,
          velocity: _calculateVelocity(totalDelta, duration),
        ),
      );
    }
  }

  /// Handle gesture start events
  DiagramEventUnion? _handleGestureStart(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    Object rawEvent,
    String eventKey,
  ) {
    // Store gesture state
    _activeEvents[eventKey] = _EventState(
      startTime: DateTime.now(),
      startPosition: logicalPosition,
      hitList: hitList,
      mouseButton: null,
      isOnObject: hitList.isNotEmpty,
    );

    // Determine finger count from raw event
    final fingerCount = _extractFingerCount(rawEvent);

    return DiagramEventUnion.pinchBegin(
      DiagramPinchBegin(
        eventId: eventId,
        logicalPosition: logicalPosition,
        screenPosition: screenPosition,
        transformSnapshot: transformSnapshot,
        hitList: hitList,
        timestamp: Duration.zero,
        metadata: {},
        fingerCount: fingerCount,
        focalPoint: logicalPosition,
      ),
    );
  }

  /// Handle gesture update events
  DiagramEventUnion? _handleGestureUpdate(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    Object rawEvent,
    double? scale,
    double? rotation,
    String eventKey,
  ) {
    final state = _activeEvents[eventKey];
    if (state == null) return null;

    final duration = DateTime.now().difference(state.startTime);

    return DiagramEventUnion.pinchContinue(
      DiagramPinchContinue(
        eventId: eventId,
        logicalPosition: logicalPosition,
        screenPosition: screenPosition,
        transformSnapshot: transformSnapshot,
        hitList: hitList,
        timestamp: duration,
        metadata: {},
        scale: scale ?? 1.0,
        rotation: rotation ?? 0.0,
        focalPoint: logicalPosition,
        duration: duration,
      ),
    );
  }

  /// Handle gesture end events
  DiagramEventUnion? _handleGestureEnd(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    Object rawEvent,
    String eventKey,
  ) {
    final state = _activeEvents[eventKey];
    if (state == null) return null;

    final duration = DateTime.now().difference(state.startTime);

    // Remove from active events
    _activeEvents.remove(eventKey);

    return DiagramEventUnion.pinchEnd(
      DiagramPinchEnd(
        eventId: eventId,
        logicalPosition: logicalPosition,
        screenPosition: screenPosition,
        transformSnapshot: transformSnapshot,
        hitList: hitList,
        timestamp: duration,
        metadata: {},
        finalScale: 1.0, // Would need to track from continue events
        finalRotation: 0.0, // Would need to track from continue events
        totalDuration: duration,
        wasCancelled: false,
      ),
    );
  }

  /// Handle scroll events (from pointer signal)
  DiagramEventUnion? handleScrollEvent(
    String eventId,
    Offset logicalPosition,
    Offset screenPosition,
    Transform2D transformSnapshot,
    List<DiagramObjectEntity> hitList,
    PointerScrollEvent rawEvent,
  ) {
    // Determine which direction has the larger delta
    final absX = rawEvent.scrollDelta.dx.abs();
    final absY = rawEvent.scrollDelta.dy.abs();

    double scrollDelta;
    Offset scrollDirection;

    if (absX > absY) {
      // Horizontal scroll
      scrollDelta = absX;
      scrollDirection = Offset(rawEvent.scrollDelta.dx > 0 ? 1 : -1, 0);
    } else {
      // Vertical scroll (default)
      scrollDelta = absY;
      scrollDirection = Offset(0, rawEvent.scrollDelta.dy > 0 ? 1 : -1);
    }

    final scrollEvent = _ScrollEvent(
      timestamp: DateTime.now(),
      delta: scrollDelta,
    );

    _recentScrollEvents.add(scrollEvent);

    // Remove old events
    final cutoff = DateTime.now().subtract(_scrollVelocityWindow);
    _recentScrollEvents.removeWhere((e) => e.timestamp.isBefore(cutoff));

    final velocity = _calculateScrollVelocity();
    final isInertial = velocity.abs() > 100.0; // Threshold for inertial scroll

    return DiagramEventUnion.scroll(
      DiagramScroll(
        eventId: eventId,
        logicalPosition: logicalPosition,
        screenPosition: screenPosition,
        transformSnapshot: transformSnapshot,
        hitList: hitList,
        timestamp: Duration.zero,
        metadata: {},
        scrollDelta: scrollDelta,
        scrollVelocity: velocity,
        scrollDuration: _getTimeSinceLastScroll(),
        scrollDirection: scrollDirection,
        isInertial: isInertial,
        scrollCount: _recentScrollEvents.length,
        suggestedInertiaDuration: isInertial ? 1000.0 : null,
        suggestedInertiaDecay: isInertial ? 0.95 : null,
      ),
    );
  }

  // Helper methods
  String _generateEventKey(Object rawEvent) {
    if (rawEvent is PointerEvent) {
      return 'pointer_${rawEvent.pointer}';
    }
    return rawEvent.hashCode.toString();
  }

  Offset _calculateVelocity(Offset delta, Duration duration) {
    if (duration.inMilliseconds == 0) return Offset.zero;
    return Offset(
      delta.dx / duration.inMilliseconds,
      delta.dy / duration.inMilliseconds,
    );
  }

  double _calculateScrollVelocity() {
    if (_recentScrollEvents.length < 2) return 0.0;

    final totalDelta =
        _recentScrollEvents.map((e) => e.delta).reduce((a, b) => a + b);

    final totalDuration = _recentScrollEvents.last.timestamp
        .difference(_recentScrollEvents.first.timestamp)
        .inMilliseconds;

    if (totalDuration == 0) return 0.0;
    return totalDelta / totalDuration;
  }

  Duration _getTimeSinceLastScroll() {
    if (_recentScrollEvents.isEmpty) return Duration.zero;
    return DateTime.now().difference(_recentScrollEvents.last.timestamp);
  }

  int _extractFingerCount(Object rawEvent) {
    // This would need to be implemented based on the actual gesture details
    // For now, assume 2 fingers for pinch gestures
    return 2;
  }

  /// Determine if an interaction should be considered a drag based on multiple criteria
  bool _isDrag(Offset totalDelta, Duration duration) {
    final distance = totalDelta.distance;
    final velocity = _calculateVelocity(totalDelta, duration);
    final velocityMagnitude = velocity.distance;

    // Multiple criteria for drag detection:
    // 1. Distance threshold (3 pixels)
    // 2. Velocity threshold (50 pixels/second)
    // 3. Time threshold (300ms for tap)

    const distanceThreshold = 3.0; // pixels
    const velocityThreshold = 50.0; // pixels/second
    const maxTapDuration = Duration(milliseconds: 300);

    // It's a drag if:
    // - Distance is significant OR
    // - Velocity is significant OR
    // - Duration is too long for a tap
    return distance > distanceThreshold ||
        velocityMagnitude > velocityThreshold ||
        duration > maxTapDuration;
  }
}

/// Internal state for tracking active events
class _EventState {
  final DateTime startTime;
  final Offset startPosition;
  final List<DiagramObjectEntity> hitList;
  final MouseButton? mouseButton;
  final bool isOnObject;

  _EventState({
    required this.startTime,
    required this.startPosition,
    required this.hitList,
    required this.mouseButton,
    required this.isOnObject,
  });
}

/// Internal state for scroll events
class _ScrollEvent {
  final DateTime timestamp;
  final double delta;

  _ScrollEvent({
    required this.timestamp,
    required this.delta,
  });
}
