import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_bloc.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  group('EventManagementBloc gesture throttling (~60 FPS)', () {
    late EventManagementBloc bloc;

    setUp(() {
      bloc =
          EventManagementBloc(debounceTime: const Duration(milliseconds: 16));
      bloc.configureDependencies(viewportSize: const Size(800, 600));
    });

    tearDown(() async {
      await bloc.close();
    });

    test('coalesces gesture updates and does not lose end', () async {
      final emitted = <PhysicalEvent>[];
      bloc.physicalEvents.listen(emitted.add);

      // Start gesture
      final start = ScaleStartDetails(
          focalPoint: const Offset(100, 100),
          localFocalPoint: const Offset(100, 100));
      bloc.add(EventManagementEvent.startGestureEvent(
        rawEvent: start,
        logicalPosition: const Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));
      await Future<void>.delayed(const Duration(milliseconds: 5));

      // Flood updates spaced by 5ms
      for (int i = 0; i < 20; i++) {
        final update = ScaleUpdateDetails(
          focalPoint: Offset(100 + i.toDouble(), 100),
          localFocalPoint: Offset(100 + i.toDouble(), 100),
          scale: 1.0 + i * 0.01,
          rotation: 0.0,
        );
        bloc.add(EventManagementEvent.updateGestureEvent(
          rawEvent: update,
          logicalPosition: Offset(50 + i.toDouble(), 50),
          hitResults: [],
          pressedKeys: {},
        ));
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }

      // Allow ~30ms for a couple more frames
      await Future<void>.delayed(const Duration(milliseconds: 30));

      // End gesture
      final end = ScaleEndDetails(
          velocity: const Velocity(pixelsPerSecond: Offset.zero));
      bloc.add(
          EventManagementEvent.endGestureEvent(rawEvent: end, pressedKeys: {}));
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final startCount = emitted
          .whereType<GesturePhysicalEvent>()
          .where((e) => e.phase == InteractionPhase.start)
          .length;
      final updateCount = emitted
          .whereType<GesturePhysicalEvent>()
          .where((e) => e.phase == InteractionPhase.update)
          .length;
      final endCount = emitted
          .whereType<GesturePhysicalEvent>()
          .where((e) => e.phase == InteractionPhase.end)
          .length;

      expect(startCount, 1);
      expect(updateCount, inInclusiveRange(4, 6));
      expect(endCount, 1);
    });
  });
}
