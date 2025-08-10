import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_bloc.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_state.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

class MockDiagramObject extends DiagramObjectEntity {
  final String _id;
  final Rect _bounds;
  final int _zOrder;

  MockDiagramObject({
    required String id,
    required Rect bounds,
    int zOrder = 100,
  })  : _id = id,
        _bounds = bounds,
        _zOrder = zOrder;

  @override
  Rect get logicalBounds => _bounds;

  @override
  String get id => _id;

  @override
  int get zOrder => _zOrder;

  @override
  void paint(Canvas canvas) {
    // Mock implementation
  }

  @override
  List<Object> get props => [_id, _bounds, _zOrder];
}

void main() {
  group('EventManagementBloc', () {
    late EventManagementBloc bloc;

    setUp(() {
      bloc = EventManagementBloc();
      // Configure dependencies
      bloc.configureDependencies(
        transformBloc: null,
        configuration: null,
        viewportSize: const Size(800, 600),
      );
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state should be idle', () {
      expect(bloc.state, const EventManagementState.idle());
    });

    test('should transition to pointer active on startPointerEvent', () async {
      final event = PointerDownEvent(
        position: const Offset(100, 100),
        pointer: 1,
      );

      bloc.add(EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      expect(bloc.state, isA<PointerActiveState>());
    });

    test('should emit PhysicalEvents when processing events', () async {
      final events = <PhysicalEvent>[];

      // Listen to physical events
      bloc.physicalEvents.listen(events.add);

      final event = PointerDownEvent(
        position: const Offset(100, 100),
        pointer: 1,
      );

      bloc.add(EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for events to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      expect(events, hasLength(1));
      expect(events.first, isA<PointerPhysicalEvent>());
    });

    test('should enforce event isolation', () async {
      // Start a pointer event
      final pointerEvent = PointerDownEvent(
        position: const Offset(100, 100),
        pointer: 1,
      );

      bloc.add(EventManagementEvent.startPointerEvent(
        rawEvent: pointerEvent,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));
      expect(bloc.state, isA<PointerActiveState>());

      // Try to start a gesture event immediately (should be blocked)
      final gestureEvent = ScaleStartDetails(
        focalPoint: const Offset(100, 100),
        localFocalPoint: const Offset(100, 100),
      );

      bloc.add(EventManagementEvent.startGestureEvent(
        rawEvent: gestureEvent,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      // State should still be pointer active
      expect(bloc.state, isA<PointerActiveState>());
    });

    test('should handle gesture events', () async {
      final events = <PhysicalEvent>[];

      // Listen to physical events
      bloc.physicalEvents.listen(events.add);

      final gestureEvent = ScaleStartDetails(
        focalPoint: const Offset(100, 100),
        localFocalPoint: const Offset(100, 100),
      );

      bloc.add(EventManagementEvent.startGestureEvent(
        rawEvent: gestureEvent,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for events to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      expect(events, hasLength(1));
      expect(events.first, isA<GesturePhysicalEvent>());
    });

    test('should reset state correctly', () async {
      // Start a pointer event
      final pointerEvent = PointerDownEvent(
        position: const Offset(100, 100),
        pointer: 1,
      );

      bloc.add(EventManagementEvent.startPointerEvent(
        rawEvent: pointerEvent,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));
      expect(bloc.state, isA<PointerActiveState>());

      // Reset state
      bloc.add(const EventManagementEvent.resetState());

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));
      expect(bloc.state, const EventManagementState.idle());
    });

    test('should handle multiple rapid events', () async {
      final events = <PhysicalEvent>[];

      // Listen to physical events
      bloc.physicalEvents.listen(events.add);

      // Send multiple rapid pointer events
      for (int i = 0; i < 3; i++) {
        final pointerEvent = PointerDownEvent(
          position: Offset(100.0 + i, 100.0 + i),
          pointer: i,
        );

        bloc.add(EventManagementEvent.startPointerEvent(
          rawEvent: pointerEvent,
          logicalPosition: Offset(50.0 + i, 50.0 + i),
          hitResults: [],
          pressedKeys: {},
        ));

        // Small delay between events to avoid stream issues
        await Future.delayed(const Duration(milliseconds: 5));
      }

      // Wait for all events to be processed
      await Future.delayed(const Duration(milliseconds: 20));

      // Should handle multiple events without crashing
      expect(events, isNotEmpty);
    });

    test('should handle pointer events with control keys', () async {
      final events = <PhysicalEvent>[];

      // Listen to physical events
      bloc.physicalEvents.listen(events.add);

      final event = PointerDownEvent(
        position: const Offset(100, 100),
        pointer: 1,
      );

      final pressedKeys = {
        LogicalKeyboardKey.shiftLeft,
        LogicalKeyboardKey.controlLeft
      };

      bloc.add(EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: pressedKeys,
      ));

      // Wait for events to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      expect(events, hasLength(1));
      expect(events.first, isA<PointerPhysicalEvent>());

      final pointerEvent = events.first as PointerPhysicalEvent;
      expect(pointerEvent.pressedKeys, equals(pressedKeys));
    });

    test('should handle gesture events with control keys', () async {
      final events = <PhysicalEvent>[];

      // Listen to physical events
      bloc.physicalEvents.listen(events.add);

      final gestureEvent = ScaleStartDetails(
        focalPoint: const Offset(100, 100),
        localFocalPoint: const Offset(100, 100),
      );

      final pressedKeys = {
        LogicalKeyboardKey.altLeft,
        LogicalKeyboardKey.metaLeft
      };

      bloc.add(EventManagementEvent.startGestureEvent(
        rawEvent: gestureEvent,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: pressedKeys,
      ));

      // Wait for events to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      expect(events, hasLength(1));
      expect(events.first, isA<GesturePhysicalEvent>());

      final gesturePhysicalEvent = events.first as GesturePhysicalEvent;
      expect(gesturePhysicalEvent.pressedKeys, equals(pressedKeys));
    });

    test('should handle update modifier keys', () async {
      // Start a pointer event
      final pointerEvent = PointerDownEvent(
        position: const Offset(100, 100),
        pointer: 1,
      );

      bloc.add(EventManagementEvent.startPointerEvent(
        rawEvent: pointerEvent,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));
      expect(bloc.state, isA<PointerActiveState>());

      // Update modifier keys
      final newKeys = {
        LogicalKeyboardKey.shiftLeft,
        LogicalKeyboardKey.controlLeft
      };
      bloc.add(EventManagementEvent.updateModifierKeys(keys: newKeys));

      // Wait for state to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      final currentState = bloc.state as PointerActiveState;
      expect(currentState.pressedKeys, equals(newKeys));
    });

    test('should handle keyboard events', () async {
      final events = <PhysicalEvent>[];

      // Listen to physical events
      bloc.physicalEvents.listen(events.add);

      final keyEvent = KeyDownEvent(
        logicalKey: LogicalKeyboardKey.arrowUp,
        physicalKey: PhysicalKeyboardKey.arrowUp,
        timeStamp:
            Duration(milliseconds: DateTime.now().millisecondsSinceEpoch),
      );

      bloc.add(EventManagementEvent.startKeyboardEvent(rawEvent: keyEvent));

      // Wait for events to be emitted
      await Future.delayed(const Duration(milliseconds: 10));

      expect(events, hasLength(1));
      // Due to our workaround, keyboard events are sent as pointer events with keyboard interaction
      expect(events.first, isA<PointerPhysicalEvent>());

      final pointerEvent = events.first as PointerPhysicalEvent;
      expect(pointerEvent.activeInteraction, equals(InteractionType.keyboard));
    });
  });
}
