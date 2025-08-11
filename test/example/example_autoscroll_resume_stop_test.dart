import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
// ignore: avoid_relative_lib_imports
import '../../example/lib/controllers/example_diagram_controller.dart';

class _FakeEntity extends DiagramObjectEntity {
  @override
  Rect get logicalBounds => const Rect.fromLTWH(0, 0, 10, 10);
  @override
  Offset get center => logicalBounds.center;
  @override
  int get zOrder => 0;
  @override
  String get id => 'fake';
  @override
  bool get isVisible => true;
  @override
  bool get isInteractive => true;
  @override
  void paint(Canvas canvas) {}
  @override
  bool contains(Offset logicalPoint) => true;
  @override
  List<Object?> get props => [id, logicalBounds, zOrder];
}

void main() {
  group('ExampleDiagramController autoscroll resume/stop (unit)', () {
    late ExampleDiagramController controller;
    late StreamSubscription<DiagramCommand> sub;
    final commands = <DiagramCommand>[];

    setUp(() {
      controller = ExampleDiagramController();
      commands.clear();
      sub = controller.commandStream.listen(commands.add);
    });

    tearDown(() async {
      await sub.cancel();
      controller.dispose();
    });

    DiagramDragBegin dragBeginOnObject() => DiagramDragBegin(
          eventId: 'e-begin',
          logicalPosition: Offset.zero,
          screenPosition: const Offset(0, 0),
          transformSnapshot: const Transform2D(),
          hitList: [_FakeEntity()],
          timestamp: Duration.zero,
          metadata: const {},
          fingerCount: 1,
          mouseButton: null,
          isOnObject: true,
        );

    DiagramDragContinue dragWith(Map<String, dynamic> bp) =>
        DiagramDragContinue(
          eventId: 'e-continue',
          logicalPosition: Offset.zero,
          screenPosition: const Offset(0, 0),
          transformSnapshot: const Transform2D(),
          hitList: const [],
          timestamp: Duration.zero,
          metadata: {'borderProximity': bp},
          delta: const Offset(0, 0),
          totalDelta: const Offset(0, 0),
          duration: const Duration(milliseconds: 16),
          velocity: const Offset(0, 0),
        );

    Map<String, dynamic> bpRight(double normalized) => {
          'isNearLeft': false,
          'isNearRight': true,
          'isNearTop': false,
          'isNearBottom': false,
          'distanceFromEdge': 5.0,
          'threshold': 50.0,
          'normalizedDistance': normalized,
        };

    test('autoScroll resumes after stop when re-entering edge', () async {
      controller.eventsSink
          .add(DiagramEventUnion.dragBegin(dragBeginOnObject()));
      await Future.delayed(const Duration(milliseconds: 1));

      // Near edge → expect AutoScrollStep
      for (int i = 0; i < 3; i++) {
        controller.eventsSink.add(
          DiagramEventUnion.dragContinue(dragWith(bpRight(0.2))),
        );
        await Future.delayed(const Duration(milliseconds: 1));
      }

      final firstAutoIdx = commands.indexWhere((c) => c.isAutoScrollStep);
      expect(firstAutoIdx, isNonNegative,
          reason: 'Expected AutoScrollStep when near edge');

      // Away from edges → expect StopAutoScroll
      for (int i = 0; i < 2; i++) {
        controller.eventsSink.add(
          DiagramEventUnion.dragContinue(dragWith({
            'isNearLeft': false,
            'isNearRight': false,
            'isNearTop': false,
            'isNearBottom': false,
            'distanceFromEdge': 100.0,
            'threshold': 50.0,
            'normalizedDistance': 1.0,
          })),
        );
        await Future.delayed(const Duration(milliseconds: 1));
      }

      final stopIdx = commands.lastIndexWhere((c) => c.isStopAutoScroll);
      expect(stopIdx, isNonNegative,
          reason: 'Expected StopAutoScroll when leaving edge');

      // Re-enter edge → expect a new AutoScrollStep after Stop
      for (int i = 0; i < 3; i++) {
        controller.eventsSink.add(
          DiagramEventUnion.dragContinue(dragWith(bpRight(0.3))),
        );
        await Future.delayed(const Duration(milliseconds: 1));
      }

      final autoAfterStopIdx = commands.indexWhere(
        (c) => c.isAutoScrollStep,
        stopIdx + 1,
      );
      expect(autoAfterStopIdx, isNonNegative,
          reason: 'Expected AutoScrollStep after re-entering edge');

      // End drag → controller should also stop autoscroll
      controller.eventsSink.add(const DiagramEventUnion.dragEnd(DiagramDragEnd(
        eventId: 'e-end',
        logicalPosition: Offset.zero,
        screenPosition: Offset(0, 0),
        transformSnapshot: Transform2D(),
        hitList: [],
        timestamp: Duration.zero,
        metadata: {},
        totalDelta: Offset(0, 0),
        totalDuration: Duration(milliseconds: 80),
        finalVelocity: Offset(0, 0),
        wasCancelled: false,
      )));
      await Future.delayed(const Duration(milliseconds: 1));
      expect(commands.last.isStopAutoScroll, isTrue,
          reason: 'Expected StopAutoScroll on dragEnd');
    }, timeout: const Timeout(Duration(seconds: 5)));
  });
}
