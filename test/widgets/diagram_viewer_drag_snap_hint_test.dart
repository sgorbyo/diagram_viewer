import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';

class _RecordingController implements IDiagramController {
  final StreamController<DiagramCommand> _cmd =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<DiagramEventUnion> _evt =
      StreamController<DiagramEventUnion>.broadcast();

  final DiagramConfiguration _cfg;
  final List<DiagramEventUnion> received = [];

  _RecordingController(this._cfg) {
    _evt.stream.listen(received.add);
  }

  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _evt.sink;
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 1000, 1000);
  @override
  DiagramConfiguration get configuration => _cfg;
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  group('DiagramViewer drag snapped hint', () {
    testWidgets('dragContinue includes snappedLogicalPosition when enabled',
        (tester) async {
      const cfg = DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: 10,
        snapGridOrigin: Offset(5, 5),
      );
      final controller = _RecordingController(cfg);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DiagramViewer(controller: controller)),
        ),
      );

      final viewer = find.byType(DiagramViewer);
      final center = tester.getCenter(viewer);

      final gesture = await tester.startGesture(center);
      // Move by a delta to trigger drag
      await gesture.moveBy(const Offset(13, 17));
      await tester.pump();
      await gesture.up();
      await tester.pump();

      // Find the last dragContinue event
      final cont = controller.received
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .toList();
      expect(cont, isNotEmpty);
      final ev = cont.last.maybeWhen(
        dragContinue: (e) => e,
        orElse: () => null,
      );
      expect(ev, isNotNull);
      expect(ev!.snappedLogicalPosition, isNotNull);
      final expected = Transform2DUtils.snapPointToGrid(
        point: ev.logicalPosition,
        spacing: 10,
        origin: const Offset(5, 5),
      );
      expect(ev.snappedLogicalPosition, expected);

      controller.dispose();
    });

    testWidgets('dragContinue has null snappedLogicalPosition when disabled',
        (tester) async {
      const cfg = DiagramConfiguration(
        snapGridEnabled: false,
        snapGridSpacing: 10,
        snapGridOrigin: Offset(5, 5),
      );
      final controller = _RecordingController(cfg);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DiagramViewer(controller: controller)),
        ),
      );

      final viewer = find.byType(DiagramViewer);
      final center = tester.getCenter(viewer);

      final gesture = await tester.startGesture(center);
      await gesture.moveBy(const Offset(13, 17));
      await tester.pump();
      await gesture.up();
      await tester.pump();

      final cont = controller.received
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .toList();
      expect(cont, isNotEmpty);
      final ev = cont.last.maybeWhen(
        dragContinue: (e) => e,
        orElse: () => null,
      );
      expect(ev, isNotNull);
      expect(ev!.snappedLogicalPosition, isNull);

      controller.dispose();
    });

    testWidgets('dragEnd includes snappedLogicalPosition when enabled',
        (tester) async {
      const cfg = DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: 12,
        snapGridOrigin: Offset(3, 7),
      );
      final controller = _RecordingController(cfg);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DiagramViewer(controller: controller)),
        ),
      );

      final viewer = find.byType(DiagramViewer);
      final center = tester.getCenter(viewer);

      final gesture = await tester.startGesture(center);
      await gesture.moveBy(const Offset(25, 19));
      await gesture.up();
      await tester.pump();

      final ends = controller.received
          .where((e) => e.maybeWhen(dragEnd: (_) => true, orElse: () => false))
          .toList();
      expect(ends, isNotEmpty);
      final ev = ends.last.maybeWhen(dragEnd: (e) => e, orElse: () => null);
      expect(ev, isNotNull);
      final expected = Transform2DUtils.snapPointToGrid(
        point: ev!.logicalPosition,
        spacing: 12,
        origin: const Offset(3, 7),
      );
      expect(ev.snappedLogicalPosition, expected);

      controller.dispose();
    });

    testWidgets('dragEnd has null snappedLogicalPosition when disabled',
        (tester) async {
      const cfg = DiagramConfiguration(
        snapGridEnabled: false,
        snapGridSpacing: 12,
        snapGridOrigin: Offset(3, 7),
      );
      final controller = _RecordingController(cfg);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DiagramViewer(controller: controller)),
        ),
      );

      final viewer = find.byType(DiagramViewer);
      final center = tester.getCenter(viewer);

      final gesture = await tester.startGesture(center);
      await gesture.moveBy(const Offset(25, 19));
      await gesture.up();
      await tester.pump();

      final ends = controller.received
          .where((e) => e.maybeWhen(dragEnd: (_) => true, orElse: () => false))
          .toList();
      expect(ends, isNotEmpty);
      final ev = ends.last.maybeWhen(dragEnd: (e) => e, orElse: () => null);
      expect(ev, isNotNull);
      expect(ev!.snappedLogicalPosition, isNull);

      controller.dispose();
    });

    testWidgets(
        'dragContinue and dragEnd with negative origin produce snapped hints',
        (tester) async {
      const spacing = 7.0;
      const origin = Offset(-13, -21);
      const cfg = DiagramConfiguration(
        snapGridEnabled: true,
        snapGridSpacing: spacing,
        snapGridOrigin: origin,
      );
      final controller = _RecordingController(cfg);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DiagramViewer(controller: controller)),
        ),
      );

      final viewer = find.byType(DiagramViewer);
      final center = tester.getCenter(viewer);

      final gesture = await tester.startGesture(center);
      await gesture.moveBy(const Offset(33, -19));
      await tester.pump();
      await gesture.up();
      await tester.pump();

      // dragContinue hint
      final cont = controller.received
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .toList();
      expect(cont, isNotEmpty);
      final contEv =
          cont.last.maybeWhen(dragContinue: (e) => e, orElse: () => null);
      expect(contEv, isNotNull);
      final expectedCont = Transform2DUtils.snapPointToGrid(
        point: contEv!.logicalPosition,
        spacing: spacing,
        origin: origin,
      );
      expect(contEv.snappedLogicalPosition, expectedCont);

      // dragEnd hint
      final ends = controller.received
          .where((e) => e.maybeWhen(dragEnd: (_) => true, orElse: () => false))
          .toList();
      expect(ends, isNotEmpty);
      final endEv = ends.last.maybeWhen(dragEnd: (e) => e, orElse: () => null);
      expect(endEv, isNotNull);
      final expectedEnd = Transform2DUtils.snapPointToGrid(
        point: endEv!.logicalPosition,
        spacing: spacing,
        origin: origin,
      );
      expect(endEv.snappedLogicalPosition, expectedEnd);

      controller.dispose();
    });
  });
}
