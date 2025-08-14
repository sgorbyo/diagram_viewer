// ignore_for_file: avoid_relative_lib_imports

import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
// Import example controller relatively since it's part of the mono-repo
import '../../example/lib/controllers/example_diagram_controller.dart';

class _ExampleControllerWithConfig extends ExampleDiagramController {
  final DiagramConfiguration _config;
  _ExampleControllerWithConfig(this._config);

  @override
  DiagramConfiguration get configuration => _config;
}

void main() {
  group('ExampleDiagramController Snap Grid (TDD)', () {
    late StreamSubscription<DiagramCommand> sub;

    tearDown(() async {
      await sub.cancel();
    });

    DiagramDragBegin buildDragBegin({
      required Offset position,
      required List<DiagramObjectEntity> hitList,
    }) {
      return DiagramDragBegin(
        eventId: 'e-begin',
        logicalPosition: position,
        screenPosition: position,
        transformSnapshot: const Transform2D(),
        hitList: hitList,
        timestamp: Duration.zero,
        metadata: const {},
        fingerCount: 1,
        mouseButton: MouseButton.left,
        isOnObject: hitList.isNotEmpty,
      );
    }

    DiagramDragContinue buildDragContinue({
      required Offset position,
      required List<DiagramObjectEntity> hitList,
      Offset delta = Offset.zero,
    }) {
      return DiagramDragContinue(
        eventId: 'e-cont',
        logicalPosition: position,
        screenPosition: position,
        transformSnapshot: const Transform2D(),
        hitList: hitList,
        timestamp: Duration.zero,
        metadata: const {},
        delta: delta,
        totalDelta: delta,
        duration: Duration.zero,
        velocity: Offset.zero,
      );
    }

    DiagramDragEnd buildDragEnd({
      required List<DiagramObjectEntity> hitList,
    }) {
      return DiagramDragEnd(
        eventId: 'e-end',
        logicalPosition: Offset.zero,
        screenPosition: Offset.zero,
        transformSnapshot: const Transform2D(),
        hitList: hitList,
        timestamp: Duration.zero,
        metadata: const {},
        totalDelta: Offset.zero,
        totalDuration: Duration.zero,
        finalVelocity: Offset.zero,
        wasCancelled: false,
      );
    }

    Future<void> awaitRedraw(Stream<DiagramCommand> stream) async {
      await stream.firstWhere((c) => c.isRedraw);
    }

    test('drag existing object snaps to grid when enabled', () async {
      const spacing = 16.0;
      const origin = Offset.zero;
      final controller =
          _ExampleControllerWithConfig(const DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      ));

      // Drain commands to avoid stream leaks
      sub = controller.commandStream.listen((_) {});

      // Pick first object
      final obj = controller.objects.first;
      final startCenter = obj.center;

      // Target a non-grid logical position (offset by non-multiple)
      final target = startCenter + const Offset(13, 7);
      final expected = Transform2DUtils.snapPointToGrid(
        point: target,
        spacing: spacing,
        origin: origin,
      );

      // Simulate drag lifecycle on the object
      controller.eventsSink.add(DiagramEventUnion.dragBegin(
        buildDragBegin(position: startCenter, hitList: [obj]),
      ));
      controller.eventsSink.add(DiagramEventUnion.dragContinue(
        buildDragContinue(
          position: target,
          hitList: [obj],
          delta: const Offset(13, 7),
        ),
      ));
      controller.eventsSink.add(DiagramEventUnion.dragEnd(
        buildDragEnd(hitList: [obj]),
      ));

      await awaitRedraw(controller.commandStream);

      // Expect snapped center
      final updated = controller.objects.first;
      expect((updated.center - expected).distance, lessThan(0.001));
    });

    test('drag existing object stays free when snapping disabled', () async {
      const spacing = 16.0;
      const origin = Offset.zero;
      final controller =
          _ExampleControllerWithConfig(const DiagramConfiguration(
        snapGridEnabled: false,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      ));

      sub = controller.commandStream.listen((_) {});

      final obj = controller.objects.first;
      final startCenter = obj.center;
      final target = startCenter + const Offset(13, 7);

      controller.eventsSink.add(DiagramEventUnion.dragBegin(
        buildDragBegin(position: startCenter, hitList: [obj]),
      ));
      controller.eventsSink.add(DiagramEventUnion.dragContinue(
        buildDragContinue(
          position: target,
          hitList: [obj],
          delta: const Offset(13, 7),
        ),
      ));
      controller.eventsSink.add(DiagramEventUnion.dragEnd(
        buildDragEnd(hitList: [obj]),
      ));

      await awaitRedraw(controller.commandStream);

      // Expect free placement (no snapping)
      final updated = controller.objects.first;
      expect((updated.center - target).distance, lessThan(0.001));
    });

    test('DnD drop snaps new object center when enabled', () async {
      const spacing = 16.0;
      const origin = Offset.zero;
      final controller =
          _ExampleControllerWithConfig(const DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      ));

      sub = controller.commandStream.listen((_) {});

      const logicalDrop = Offset(113, 107);
      final expected = Transform2DUtils.snapPointToGrid(
        point: logicalDrop,
        spacing: spacing,
        origin: origin,
      );

      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'e-drop',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: logicalDrop, // here we pass same for simplicity
        logicalPosition: logicalDrop,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
      ));

      await awaitRedraw(controller.commandStream);

      // Expect a new object added at snapped position
      final hasNewAtExpected = controller.objects.any(
        (o) => (o.center - expected).distance < 0.001,
      );
      expect(hasNewAtExpected, isTrue);
    });

    test('DnD drop stays free when snapping disabled', () async {
      const spacing = 16.0;
      const origin = Offset.zero;
      final controller =
          _ExampleControllerWithConfig(const DiagramConfiguration(
        snapGridEnabled: false,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      ));

      sub = controller.commandStream.listen((_) {});

      const logicalDrop = Offset(113, 107);

      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'e-drop',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: logicalDrop,
        logicalPosition: logicalDrop,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
      ));

      await awaitRedraw(controller.commandStream);

      final hasNewAtExact = controller.objects.any(
        (o) => (o.center - logicalDrop).distance < 0.001,
      );
      expect(hasNewAtExact, isTrue);
    });

    test('drag snapping respects non-zero origin and custom spacing', () async {
      const spacing = 10.0;
      const origin = Offset(5, 5);
      final controller =
          _ExampleControllerWithConfig(const DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      ));

      sub = controller.commandStream.listen((_) {});

      final obj = controller.objects.first;
      final startCenter = obj.center;
      final target = startCenter + const Offset(11, -7);
      final expected = Transform2DUtils.snapPointToGrid(
        point: target,
        spacing: spacing,
        origin: origin,
      );

      controller.eventsSink.add(DiagramEventUnion.dragBegin(
        buildDragBegin(position: startCenter, hitList: [obj]),
      ));
      controller.eventsSink.add(DiagramEventUnion.dragContinue(
        buildDragContinue(
          position: target,
          hitList: [obj],
          delta: const Offset(11, -7),
        ),
      ));
      controller.eventsSink.add(DiagramEventUnion.dragEnd(
        buildDragEnd(hitList: [obj]),
      ));

      await awaitRedraw(controller.commandStream);

      final updated = controller.objects.first;
      expect((updated.center - expected).distance, lessThan(0.001));
    });

    test('DnD drop snapping respects non-zero origin and custom spacing',
        () async {
      const spacing = 20.0;
      const origin = Offset(3, 7);
      final controller =
          _ExampleControllerWithConfig(const DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      ));

      sub = controller.commandStream.listen((_) {});

      const logicalDrop = Offset(114, 93);
      final expected = Transform2DUtils.snapPointToGrid(
        point: logicalDrop,
        spacing: spacing,
        origin: origin,
      );

      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'e-drop-2',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: logicalDrop,
        logicalPosition: logicalDrop,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
      ));

      await awaitRedraw(controller.commandStream);

      final hasNewAtExpected = controller.objects.any(
        (o) => (o.center - expected).distance < 0.001,
      );
      expect(hasNewAtExpected, isTrue);
    });
  });
}
