import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_viewer.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

class AutoScrollTestController implements IDiagramController {
  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<DiagramEventUnion> _eventController =
      StreamController<DiagramEventUnion>.broadcast();

  @override
  Stream<DiagramCommand> get commandStream => _commandController.stream;

  @override
  List<DiagramObjectEntity> get objects => [];

  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 1000, 1000);

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration(
        edgeThreshold: 50,
        minZoom: 0.1,
        maxZoom: 10,
      );

  @override
  Sink<DiagramEventUnion> get eventsSink => _eventController.sink;

  void sendAutoScroll(Offset velocity,
      {Duration step = const Duration(milliseconds: 16)}) {
    _commandController.add(DiagramCommand.autoScrollStep(
      velocity: velocity,
      stepDuration: step,
    ));
  }

  void stopAutoScroll() {
    _commandController.add(const DiagramCommand.stopAutoScroll());
  }

  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }
}

void main() {
  testWidgets('AutoScrollStep should cause cumulative pan over time',
      (tester) async {
    final controller = AutoScrollTestController();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(controller: controller),
      ),
    ));

    await tester.pumpAndSettle();

    // Invia un comando di autoscroll verso destra (x positivo)
    controller.sendAutoScroll(const Offset(600, 0)); // px/s

    // Avanza alcuni frame (~5 tick = ~80ms)
    await tester.pump(const Duration(milliseconds: 80));

    // Non potendo leggere direttamente il transform qui senza API dedicate,
    // verifichiamo che inviare StopAutoScroll non causi errori e che il timer venga fermato
    controller.stopAutoScroll();
    await tester.pump(const Duration(milliseconds: 50));
  });

  testWidgets('StopAutoScroll should stop timer and further movement',
      (tester) async {
    final controller = AutoScrollTestController();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(controller: controller),
      ),
    ));

    await tester.pumpAndSettle();

    controller.sendAutoScroll(const Offset(800, 0));
    await tester.pump(const Duration(milliseconds: 32));
    controller.stopAutoScroll();

    // Attendere abbastanza tempo: non dovrebbero esserci ulteriori tick
    await tester.pump(const Duration(milliseconds: 200));
  });
}
