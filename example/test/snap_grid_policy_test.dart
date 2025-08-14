import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:example/controllers/example_diagram_controller.dart';

Future<DiagramCommand> _awaitRedraw(Stream<DiagramCommand> stream) async {
  return stream.firstWhere((c) => c.isRedraw);
}

void main() {
  group('Example Snap Grid Policy', () {
    test('drag existing object snaps when enabled', () async {
      final controller = ExampleDiagramController();
      const cfg = DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: 10,
        snapGridOrigin: Offset(5, 5),
      );
      controller.updateConfiguration(cfg);

      final sub = controller.commandStream.listen((_) {});

      final obj = controller.objects.first;
      final begin = DiagramDragBegin(
        eventId: 'e-begin',
        logicalPosition: obj.center,
        screenPosition: obj.center,
        transformSnapshot: const Transform2D(),
        hitList: [obj],
        timestamp: Duration.zero,
        metadata: const {},
        fingerCount: 1,
        mouseButton: MouseButton.left,
        isOnObject: true,
      );
      controller.eventsSink.add(DiagramEventUnion.dragBegin(begin));

      final moveLogical = obj.center + const Offset(11, -7);
      final hinted = Transform2DUtils.snapPointToGrid(
        point: moveLogical,
        spacing: cfg.snapGridSpacing,
        origin: cfg.snapGridOrigin,
      );
      final cont = DiagramDragContinue(
        eventId: 'e-cont',
        logicalPosition: moveLogical,
        screenPosition: moveLogical,
        transformSnapshot: const Transform2D(),
        hitList: [obj],
        timestamp: const Duration(milliseconds: 16),
        metadata: const {},
        delta: const Offset(11, -7),
        totalDelta: const Offset(11, -7),
        duration: const Duration(milliseconds: 16),
        velocity: const Offset(0.5, -0.3),
        snappedLogicalPosition: hinted,
      );
      controller.eventsSink.add(DiagramEventUnion.dragContinue(cont));
      controller.eventsSink.add(DiagramEventUnion.dragEnd(
        DiagramDragEnd(
          eventId: 'e-end',
          logicalPosition: moveLogical,
          screenPosition: moveLogical,
          transformSnapshot: const Transform2D(),
          hitList: [obj],
          timestamp: const Duration(milliseconds: 20),
          metadata: const {},
          totalDelta: const Offset(11, -7),
          totalDuration: const Duration(milliseconds: 20),
          finalVelocity: const Offset(0.5, -0.3),
          wasCancelled: false,
          snappedLogicalPosition: hinted,
        ),
      ));

      await _awaitRedraw(controller.commandStream);

      // Expect object center snapped to hinted (offset preserved because begin at center)
      final moved = controller.objects.firstWhere((o) => o.id == obj.id);
      expect(moved.center, equals(hinted));

      await sub.cancel();
      controller.dispose();
    });

    test('DnD drop snaps when enabled and stays free when disabled', () async {
      final controller = ExampleDiagramController();
      const cfgOn = DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: 12,
        snapGridOrigin: Offset(3, 7),
      );
      controller.updateConfiguration(cfgOn);

      final before = controller.objects.length;
      final dropLogical = const Offset(37, 25);
      final hinted = Transform2DUtils.snapPointToGrid(
        point: dropLogical,
        spacing: cfgOn.snapGridSpacing,
        origin: cfgOn.snapGridOrigin,
      );

      controller.eventsSink.add(DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-1',
        data: const {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: dropLogical,
        logicalPosition: dropLogical,
        transformSnapshot: const Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: hinted,
      ));

      await _awaitRedraw(controller.commandStream);
      final after = controller.objects.length;
      expect(after, equals(before + 1));
      final newObj = controller.objects.last;
      expect(newObj.center, equals(hinted));

      // Now disable and drop again: should place at raw logicalPosition (controller still applies snap
      // if enabled, so disable first)
      controller.updateConfiguration(const DiagramConfiguration(
        snapGridEnabled: false,
      ));

      controller.eventsSink.add(DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-2',
        data: const {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: dropLogical,
        logicalPosition: dropLogical,
        transformSnapshot: const Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));

      await _awaitRedraw(controller.commandStream);
      final lastObj = controller.objects.last;
      expect(lastObj.center, equals(dropLogical));

      controller.dispose();
    });
  });
}
