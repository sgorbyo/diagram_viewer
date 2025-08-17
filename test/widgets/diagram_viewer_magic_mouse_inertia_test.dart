import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_viewer.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';

class _Ctrl implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _evt.sink;
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration(
        enableInertialScrolling: true,
        inertialFriction: 0.92,
        inertialMaxDuration: Duration(milliseconds: 900),
        inertialMinStopVelocity: 30.0,
      );
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 4000, 3000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets('Magic Mouse-like smooth burst starts inertia', (tester) async {
    final controller = _Ctrl();
    TransformBloc? tBloc;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(
          controller: controller,
          configuration: controller.configuration,
          onBlocsCreated: (tb, _, __) => tBloc = tb,
        ),
      ),
    ));
    await tester.pumpAndSettle();
    final viewer = find.byType(TestableDiagramViewer);
    final center = tester.getCenter(viewer);

    // Simulate a smooth MM burst: many small deltas at ~60fps
    for (int i = 0; i < 14; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -3),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 16 * (i + 1)),
      ));
    }
    await tester.pump();
    final t0 = tBloc!.state.transform.translation;
    await tester.pump(const Duration(milliseconds: 180));
    final t1 = tBloc!.state.transform.translation;
    expect(t1.dy, lessThan(t0.dy));

    controller.dispose();
  });

  testWidgets('Classic wheel-like coarse burst does not start inertia',
      (tester) async {
    final controller = _Ctrl();
    TransformBloc? tBloc;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(
          controller: controller,
          configuration: controller.configuration,
          onBlocsCreated: (tb, _, __) => tBloc = tb,
        ),
      ),
    ));
    await tester.pumpAndSettle();
    final viewer = find.byType(TestableDiagramViewer);
    final center = tester.getCenter(viewer);

    // Simulate a coarse wheel: few large steps
    for (int i = 0; i < 3; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -40),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 50 * (i + 1)),
      ));
    }
    await tester.pump();
    final t0 = tBloc!.state.transform.translation;
    await tester.pump(const Duration(milliseconds: 200));
    final t1 = tBloc!.state.transform.translation;
    // Expect negligible continuation after burst
    expect((t1.dy - t0.dy).abs(), lessThan(1.0));

    controller.dispose();
  });
}
