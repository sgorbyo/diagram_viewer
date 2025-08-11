import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_bloc.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';

void main() {
  group('BorderProximity calculation', () {
    late EventManagementBloc bloc;

    setUp(() {
      bloc = EventManagementBloc();
      bloc.configureDependencies(
        transformBloc: null,
        configuration: const DiagramConfiguration(edgeThreshold: 50.0),
        viewportSize: const Size(800, 600),
      );
    });

    tearDown(() async {
      await bloc.close();
    });

    Future<PhysicalEvent> nextPhysicalEvent() async {
      return await bloc.physicalEvents.first;
    }

    test('near left edge', () async {
      const event = PointerDownEvent(position: Offset(10, 300));
      bloc.add(const EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: Offset.zero,
        hitResults: [],
        pressedKeys: {},
      ));

      final physical = await nextPhysicalEvent();
      final p = physical.borderProximity;
      expect(p.isNearLeft, isTrue);
      expect(p.isNearAnyEdge, isTrue);
      expect(p.isNearRight, isFalse);
      expect(p.isNearTop, isFalse);
      expect(p.isNearBottom, isFalse);
      expect(p.distanceFromEdge, closeTo(10, 0.001));
      expect(p.threshold, 50);
    });

    test('near right edge', () async {
      const event = PointerDownEvent(position: Offset(790, 300));
      bloc.add(const EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: Offset.zero,
        hitResults: [],
        pressedKeys: {},
      ));

      final physical = await nextPhysicalEvent();
      final p = physical.borderProximity;
      expect(p.isNearRight, isTrue);
      expect(p.distanceFromEdge, closeTo(10, 0.001));
      expect(p.threshold, 50);
    });

    test('near top edge', () async {
      const event = PointerDownEvent(position: Offset(400, 5));
      bloc.add(const EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: Offset.zero,
        hitResults: [],
        pressedKeys: {},
      ));

      final physical = await nextPhysicalEvent();
      final p = physical.borderProximity;
      expect(p.isNearTop, isTrue);
      expect(p.distanceFromEdge, closeTo(5, 0.001));
    });

    test('near bottom edge', () async {
      const event = PointerDownEvent(position: Offset(400, 595));
      bloc.add(const EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: Offset.zero,
        hitResults: [],
        pressedKeys: {},
      ));

      final physical = await nextPhysicalEvent();
      final p = physical.borderProximity;
      expect(p.isNearBottom, isTrue);
      expect(p.distanceFromEdge, closeTo(5, 0.001));
    });

    test('not near any edge beyond threshold', () async {
      const event = PointerDownEvent(position: Offset(400, 300));
      bloc.add(const EventManagementEvent.startPointerEvent(
        rawEvent: event,
        logicalPosition: Offset.zero,
        hitResults: [],
        pressedKeys: {},
      ));

      final physical = await nextPhysicalEvent();
      final p = physical.borderProximity;
      expect(p.isNearAnyEdge, isFalse);
      expect(p.distanceFromEdge, double.infinity);
    });
  });
}
