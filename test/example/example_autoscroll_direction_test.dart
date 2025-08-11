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
  group('ExampleDiagramController autoscroll direction', () {
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

    DiagramDragBegin dragBeginOnObject() {
      return DiagramDragBegin(
        eventId: 'e1-begin',
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
    }

    DiagramDragContinue dragWithBorder(Map<String, dynamic> bp) {
      return DiagramDragContinue(
        eventId: 'e1',
        logicalPosition: Offset.zero,
        screenPosition: const Offset(0, 0),
        transformSnapshot: const Transform2D(),
        hitList: const [],
        timestamp: Duration.zero,
        metadata: {
          'borderProximity': bp,
        },
        delta: const Offset(1, 1),
        totalDelta: const Offset(1, 1),
        duration: const Duration(milliseconds: 16),
        velocity: const Offset(0.1, 0.1),
      );
    }

    test('near bottom should produce negative vy (content up)', () async {
      final bp = {
        'isNearLeft': false,
        'isNearRight': false,
        'isNearTop': false,
        'isNearBottom': true,
        'distanceFromEdge': 5.0,
        'threshold': 50.0,
        'normalizedDistance': 0.1,
      };
      controller.eventsSink
          .add(DiagramEventUnion.dragBegin(dragBeginOnObject()));
      await Future.delayed(const Duration(milliseconds: 1));
      controller.eventsSink
          .add(DiagramEventUnion.dragContinue(dragWithBorder(bp)));
      await Future.delayed(const Duration(milliseconds: 10));

      final auto = commands.lastWhere((c) => c.isAutoScrollStep)
          as AutoScrollStepCommand;
      expect(auto.velocity.dy < 0, isTrue,
          reason: 'Expected vy negative when near bottom');
    });

    test('near top should produce positive vy (content down)', () async {
      final bp = {
        'isNearLeft': false,
        'isNearRight': false,
        'isNearTop': true,
        'isNearBottom': false,
        'distanceFromEdge': 5.0,
        'threshold': 50.0,
        'normalizedDistance': 0.1,
      };
      controller.eventsSink
          .add(DiagramEventUnion.dragBegin(dragBeginOnObject()));
      await Future.delayed(const Duration(milliseconds: 1));
      controller.eventsSink
          .add(DiagramEventUnion.dragContinue(dragWithBorder(bp)));
      await Future.delayed(const Duration(milliseconds: 10));

      final auto = commands.lastWhere((c) => c.isAutoScrollStep)
          as AutoScrollStepCommand;
      expect(auto.velocity.dy > 0, isTrue,
          reason: 'Expected vy positive when near top');
    });

    test('near left should produce positive vx (content right)', () async {
      final bp = {
        'isNearLeft': true,
        'isNearRight': false,
        'isNearTop': false,
        'isNearBottom': false,
        'distanceFromEdge': 5.0,
        'threshold': 50.0,
        'normalizedDistance': 0.1,
      };
      controller.eventsSink
          .add(DiagramEventUnion.dragBegin(dragBeginOnObject()));
      await Future.delayed(const Duration(milliseconds: 1));
      controller.eventsSink
          .add(DiagramEventUnion.dragContinue(dragWithBorder(bp)));
      await Future.delayed(const Duration(milliseconds: 10));

      final auto = commands.lastWhere((c) => c.isAutoScrollStep)
          as AutoScrollStepCommand;
      expect(auto.velocity.dx > 0, isTrue,
          reason: 'Expected vx positive when near left');
    });

    test('near right should produce negative vx (content left)', () async {
      final bp = {
        'isNearLeft': false,
        'isNearRight': true,
        'isNearTop': false,
        'isNearBottom': false,
        'distanceFromEdge': 5.0,
        'threshold': 50.0,
        'normalizedDistance': 0.1,
      };
      controller.eventsSink
          .add(DiagramEventUnion.dragBegin(dragBeginOnObject()));
      await Future.delayed(const Duration(milliseconds: 1));
      controller.eventsSink
          .add(DiagramEventUnion.dragContinue(dragWithBorder(bp)));
      await Future.delayed(const Duration(milliseconds: 10));

      final auto = commands.lastWhere((c) => c.isAutoScrollStep)
          as AutoScrollStepCommand;
      expect(auto.velocity.dx < 0, isTrue,
          reason: 'Expected vx negative when near right');
    });
  });
}
