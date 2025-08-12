import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_viewer.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
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
  testWidgets(
      'Autoscroll should persist while near edge and resume if re-entering edge after brief exit',
      (tester) async {
    final controller = ExampleDiagramController();

    // Capture blocs (kept for future assertions)
    // ignore: unused_local_variable
    TransformBloc? transformBlocCaptured;
    // ignore: unused_local_variable
    PanBloc? panBlocCaptured;
    // ignore: unused_local_variable
    ZoomBloc? zoomBlocCaptured;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 600,
          height: 400,
          child: TestableDiagramViewer(
            controller: controller,
            onBlocsCreated: (tBloc, pBloc, zBloc) {
              transformBlocCaptured = tBloc;
              panBlocCaptured = pBloc;
              zoomBlocCaptured = zBloc;
            },
          ),
        ),
      ),
    ));
    await tester.pump();

    // Snapshot initial translation from TransformBloc
    expect(transformBlocCaptured, isNotNull,
        reason: 'TransformBloc should be captured by TestableDiagramViewer');
    final double initialTx =
        transformBlocCaptured!.state.transform.translation.dx;

    // Simula drag su oggetto: inviamo prima un dragBegin con hitList non vuoto

    controller.eventsSink.add(DiagramEventUnion.dragBegin(DiagramDragBegin(
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
    )));
    await tester.pump(const Duration(milliseconds: 1));

    final commands = <String>[];
    final sub =
        controller.commandStream.listen((cmd) => commands.add(cmd.description));

    // Invia una sequenza sintetica di eventi di dragContinue con proximity destra
    Map<String, dynamic> bpRight(double normalized) => {
          'isNearLeft': false,
          'isNearRight': true,
          'isNearTop': false,
          'isNearBottom': false,
          'distanceFromEdge': 5.0,
          'threshold': 50.0,
          'normalizedDistance': normalized,
        };

    DiagramEventUnion dragWith(Map<String, dynamic> bp) =>
        DiagramEventUnion.dragContinue(
          DiagramDragContinue(
            eventId: 'e',
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
          ),
        );

    // Edge presente per alcuni tick
    for (int i = 0; i < 5; i++) {
      controller.eventsSink.add(dragWith(bpRight(0.1)));
      await tester.pump(const Duration(milliseconds: 16));
    }

    // Attendi un micro-frame per processare eventuali eventi BLoC
    await tester.pump();

    // Verifica che l'autoscroll a destra (vicino al bordo destro) muova il contenuto verso sinistra (tx diminuisce)
    final double afterRightEdgeTx =
        transformBlocCaptured!.state.transform.translation.dx;
    expect(afterRightEdgeTx, lessThan(initialTx),
        reason:
            'Near right edge → velocity.x negativa → translation.x deve diminuire');

    // Allontanati (no edge) per 2 tick: deve arrivare StopAutoScroll
    for (int i = 0; i < 2; i++) {
      controller.eventsSink.add(dragWith({
        'isNearLeft': false,
        'isNearRight': false,
        'isNearTop': false,
        'isNearBottom': false,
        'distanceFromEdge': 100.0,
        'threshold': 50.0,
        'normalizedDistance': 1.0,
      }));
      await tester.pump(const Duration(milliseconds: 16));
    }

    // Valore di riferimento dopo lo stop
    final double afterStopTx =
        transformBlocCaptured!.state.transform.translation.dx;

    // Rientra nel bordo: deve ri-partire AutoScrollStep
    for (int i = 0; i < 3; i++) {
      controller.eventsSink.add(dragWith(bpRight(0.2)));
      await tester.pump(const Duration(milliseconds: 16));
    }

    // Attendi un frame extra per far scorrere eventuali tick del timer
    await tester.pump(const Duration(milliseconds: 100));

    // Dopo il periodo di stop, l'autoscroll deve essere ripreso e continuare a diminuire tx
    final double afterResumeTx =
        transformBlocCaptured!.state.transform.translation.dx;
    expect(afterResumeTx, lessThan(afterStopTx),
        reason:
            'Dopo il resume vicino al bordo destro, tx deve continuare a diminuire');

    // Termina il drag per fermare l'autoscroll residuo ed evitare timer vivi
    controller.eventsSink.add(const DiagramEventUnion.dragEnd(DiagramDragEnd(
      eventId: 'e-end',
      logicalPosition: Offset.zero,
      screenPosition: Offset(0, 0),
      transformSnapshot: Transform2D(),
      hitList: [],
      timestamp: Duration.zero,
      metadata: {},
      totalDelta: Offset(0, 0),
      totalDuration: Duration(milliseconds: 100),
      finalVelocity: Offset(0, 0),
      wasCancelled: false,
    )));
    await tester.pump(const Duration(milliseconds: 16));

    // Cancel subscription without awaiting to avoid potential hangs in broadcast streams
    // (no further events are needed beyond this point)
    // ignore: discarded_futures
    sub.cancel();

    // Verifiche qualitative sui comandi emessi
    final hadAutoScrollFirst =
        commands.any((d) => d.startsWith('AutoScrollStep'));
    final hadStop = commands.any((d) => d == 'StopAutoScroll');
    final hadAutoScrollAgain =
        commands.where((d) => d.startsWith('AutoScrollStep')).length > 1;

    expect(hadAutoScrollFirst, isTrue,
        reason: 'Autoscroll should start when near edge');
    expect(hadStop, isTrue, reason: 'Autoscroll should stop when leaving edge');
    expect(hadAutoScrollAgain, isTrue,
        reason: 'Autoscroll should resume when re-entering edge');

    // Cleanup to avoid timeouts due to lingering timers/streams
    // Dispose controller and unmount the viewer to ensure all timers and streams close
    controller.dispose();
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 200));
  }, timeout: const Timeout(Duration(seconds: 20)));
}
