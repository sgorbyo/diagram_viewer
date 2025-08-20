import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/diagram_event_translator.dart';
import 'package:diagram_viewer/events/physical_event.dart';
import 'package:diagram_viewer/events/transform_2d.dart';

void main() {
  group('DiagramEventTranslator DnD mapping', () {
    late DiagramEventTranslator translator;
    const snapshot = Transform2D(
      scale: 1.5,
      translation: Offset(10, 20),
      rotation: 0.0,
    );

    setUp(() {
      translator = DiagramEventTranslator();
    });

    test('dndTargetEnter → dragTargetEnter', () {
      const physical = PhysicalEvent.dndTargetEnter(
        eventId: 'e1',
        dataPreview: {'t': 'x'},
        screenPosition: Offset(100, 80),
        logicalPosition: Offset(50, 40),
        transformSnapshot: snapshot,
        timestamp: Duration(milliseconds: 1),
      );

      final result = translator.translate(physical);
      expect(result, isNotNull);
      result!.when(
        dragTargetEnter: (eventId, dataPreview, screen, logical, ts, time) {
          expect(eventId, 'e1');
          expect(dataPreview, const {'t': 'x'});
          expect(screen, const Offset(100, 80));
          expect(logical, const Offset(50, 40));
          expect(ts, snapshot);
          expect(time, const Duration(milliseconds: 1));
        },
        // Unused branches
        tap: (_) => fail('unexpected'),
        doubleTap: (_) => fail('unexpected'),
        longPress: (_) => fail('unexpected'),
        scroll: (_) => fail('unexpected'),
        dragBegin: (_) => fail('unexpected'),
        dragContinue: (_) => fail('unexpected'),
        dragEnd: (_) => fail('unexpected'),
        pinchBegin: (_) => fail('unexpected'),
        pinchContinue: (_) => fail('unexpected'),
        pinchEnd: (_) => fail('unexpected'),
        dragTargetOver: (_, __, ___, ____, _____, ______, _______) =>
            fail('unexpected'),
        dragTargetLeave: (_, __, ___) => fail('unexpected'),
        dragTargetDrop: (_, __, ___, ____, _____, ______, _______) =>
            fail('unexpected'),
        selectionAreaStart: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaUpdate: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaEnd: (_, __, ___, ____, _____) => fail('unexpected'),
      );
    });

    test('dndTargetOver → dragTargetOver', () {
      const physical = PhysicalEvent.dndTargetOver(
        eventId: 'e2',
        dataPreview: {'a': 1},
        screenPosition: Offset(10, 20),
        logicalPosition: Offset(5, 8),
        transformSnapshot: snapshot,
        timestamp: Duration(milliseconds: 2),
      );
      final result = translator.translate(physical);
      expect(result, isNotNull);
      result!.when(
        dragTargetOver:
            (eventId, dataPreview, screen, logical, ts, time, snapped) {
          expect(eventId, 'e2');
          expect(dataPreview, const {'a': 1});
          expect(screen, const Offset(10, 20));
          expect(logical, const Offset(5, 8));
          expect(ts, snapshot);
          expect(time, const Duration(milliseconds: 2));
        },
        // Unused branches
        tap: (_) => fail('unexpected'),
        doubleTap: (_) => fail('unexpected'),
        longPress: (_) => fail('unexpected'),
        scroll: (_) => fail('unexpected'),
        dragBegin: (_) => fail('unexpected'),
        dragContinue: (_) => fail('unexpected'),
        dragEnd: (_) => fail('unexpected'),
        pinchBegin: (_) => fail('unexpected'),
        pinchContinue: (_) => fail('unexpected'),
        pinchEnd: (_) => fail('unexpected'),
        dragTargetEnter: (_, __, ___, ____, _____, ______) =>
            fail('unexpected'),
        dragTargetLeave: (_, __, ___) => fail('unexpected'),
        dragTargetDrop: (_, __, ___, ____, _____, ______, _______) =>
            fail('unexpected'),
        selectionAreaStart: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaUpdate: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaEnd: (_, __, ___, ____, _____) => fail('unexpected'),
      );
    });

    test('dndTargetLeave → dragTargetLeave', () {
      const physical = PhysicalEvent.dndTargetLeave(
        eventId: 'e3',
        transformSnapshot: snapshot,
        timestamp: Duration(milliseconds: 3),
      );
      final result = translator.translate(physical);
      expect(result, isNotNull);
      result!.when(
        dragTargetLeave: (eventId, ts, time) {
          expect(eventId, 'e3');
          expect(ts, snapshot);
          expect(time, const Duration(milliseconds: 3));
        },
        // Unused
        tap: (_) => fail('unexpected'),
        doubleTap: (_) => fail('unexpected'),
        longPress: (_) => fail('unexpected'),
        scroll: (_) => fail('unexpected'),
        dragBegin: (_) => fail('unexpected'),
        dragContinue: (_) => fail('unexpected'),
        dragEnd: (_) => fail('unexpected'),
        pinchBegin: (_) => fail('unexpected'),
        pinchContinue: (_) => fail('unexpected'),
        pinchEnd: (_) => fail('unexpected'),
        dragTargetEnter: (_, __, ___, ____, _____, ______) =>
            fail('unexpected'),
        dragTargetOver: (_, __, ___, ____, _____, ______, _______) =>
            fail('unexpected'),
        dragTargetDrop: (_, __, ___, ____, _____, ______, _______) =>
            fail('unexpected'),
        selectionAreaStart: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaUpdate: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaEnd: (_, __, ___, ____, _____) => fail('unexpected'),
      );
    });

    test('dndTargetDrop → dragTargetDrop', () {
      const physical = PhysicalEvent.dndTargetDrop(
        eventId: 'e4',
        data: {'ok': true},
        screenPosition: Offset(7, 9),
        logicalPosition: Offset(3, 4),
        transformSnapshot: snapshot,
        timestamp: Duration(milliseconds: 4),
      );
      final result = translator.translate(physical);
      expect(result, isNotNull);
      result!.when(
        dragTargetDrop: (eventId, data, screen, logical, ts, time, snapped) {
          expect(eventId, 'e4');
          expect(data, const {'ok': true});
          expect(screen, const Offset(7, 9));
          expect(logical, const Offset(3, 4));
          expect(ts, snapshot);
          expect(time, const Duration(milliseconds: 4));
        },
        // Unused
        tap: (_) => fail('unexpected'),
        doubleTap: (_) => fail('unexpected'),
        longPress: (_) => fail('unexpected'),
        scroll: (_) => fail('unexpected'),
        dragBegin: (_) => fail('unexpected'),
        dragContinue: (_) => fail('unexpected'),
        dragEnd: (_) => fail('unexpected'),
        pinchBegin: (_) => fail('unexpected'),
        pinchContinue: (_) => fail('unexpected'),
        pinchEnd: (_) => fail('unexpected'),
        dragTargetEnter: (_, __, ___, ____, _____, ______) =>
            fail('unexpected'),
        dragTargetOver: (_, __, ___, ____, _____, ______, _______) =>
            fail('unexpected'),
        dragTargetLeave: (_, __, ___) => fail('unexpected'),
        selectionAreaStart: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaUpdate: (_, __, ___, ____, _____) => fail('unexpected'),
        selectionAreaEnd: (_, __, ___, ____, _____) => fail('unexpected'),
      );
    });
  });
}
