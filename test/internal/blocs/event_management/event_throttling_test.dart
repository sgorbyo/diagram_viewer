import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_bloc.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  group('EventManagementBloc throttling (~60 FPS)', () {
    late EventManagementBloc bloc;

    setUp(() {
      bloc =
          EventManagementBloc(debounceTime: const Duration(milliseconds: 16));
      bloc.configureDependencies(viewportSize: const Size(800, 600));
    });

    tearDown(() async {
      await bloc.close();
    });

    test('coalesces drag updates to ~1 per 16ms and does not lose dragEnd',
        () async {
      final emitted = <PhysicalEvent>[];
      bloc.physicalEvents.listen(emitted.add);

      // Start drag
      const down = PointerDownEvent(position: Offset(100, 100), pointer: 1);
      bloc.add(const EventManagementEvent.startPointerEvent(
        rawEvent: down,
        logicalPosition: Offset(50, 50),
        hitResults: [],
        pressedKeys: {},
      ));
      await pump(5);

      // Flood with many move events within < 16ms windows
      for (int i = 0; i < 20; i++) {
        bloc.add(EventManagementEvent.updatePointerEvent(
          rawEvent: PointerMoveEvent(
              position: Offset(100 + i.toDouble(), 100),
              delta: const Offset(1, 0),
              pointer: 1),
          logicalPosition: Offset(50 + i.toDouble(), 50),
          hitResults: [],
          pressedKeys: {},
        ));
        // Spazia gli eventi su ~100ms per testare la coalescenza (~60 FPS)
        await pump(5);
      }

      // Attendi ~30ms dopo l'ultimo update per consentire altri 2 frame
      await pump(30);

      // End drag
      bloc.add(const EventManagementEvent.endPointerEvent(
        rawEvent: PointerUpEvent(position: Offset(120, 100), pointer: 1),
        pressedKeys: {},
      ));
      await pump(20);

      // Evaluate: first start + ~5 updates (one per ~16ms window) + one end
      final startCount = emitted
          .whereType<PointerPhysicalEvent>()
          .where((e) => e.phase == InteractionPhase.start)
          .length;
      final updateCount = emitted
          .whereType<PointerPhysicalEvent>()
          .where((e) => e.phase == InteractionPhase.update)
          .length;
      final endCount = emitted
          .whereType<PointerPhysicalEvent>()
          .where((e) => e.phase == InteractionPhase.end)
          .length;

      expect(startCount, 1);
      expect(updateCount, inInclusiveRange(4, 6));
      expect(endCount, 1);
    });
  });
}

Future<void> pump(int ms) async =>
    Future<void>.delayed(Duration(milliseconds: ms));
