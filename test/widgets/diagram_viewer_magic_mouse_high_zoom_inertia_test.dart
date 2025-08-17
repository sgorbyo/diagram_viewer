import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
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
  testWidgets('MM small scroll at high zoom pans and starts inertia',
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

    // Zoom in with Ctrl+wheel to achieve high zoom
    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    for (int i = 0; i < 40; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -120),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 16 * (i + 1)),
      ));
      await tester.pump(const Duration(milliseconds: 1));
    }
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);

    // Capture translation before MM burst
    final t0 = tBloc!.state.transform.translation;

    // Simulate a smooth MM burst (small deltas) without modifiers
    for (int i = 0; i < 14; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -3),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 16 * (i + 1)),
      ));
      await tester.pump(const Duration(milliseconds: 16));
    }

    // Expect immediate pan effect
    final t1 = tBloc!.state.transform.translation;
    expect(t1.dy, lessThan(t0.dy));

    // After pause, inertia should continue
    await tester.pump(const Duration(milliseconds: 160));
    final t2 = tBloc!.state.transform.translation;
    expect(t2.dy, lessThan(t1.dy));

    controller.dispose();
  });

  testWidgets('MM back-to-back bursts at high zoom both pan and start inertia',
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

    // Zoom in to high zoom
    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    for (int i = 0; i < 40; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -120),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 16 * (i + 1)),
      ));
      await tester.pump(const Duration(milliseconds: 1));
    }
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);

    // First burst
    final pre1 = tBloc!.state.transform.translation;
    for (int i = 0; i < 10; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -3),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 16 * (i + 1)),
      ));
      await tester.pump(const Duration(milliseconds: 16));
    }
    final post1 = tBloc!.state.transform.translation;
    expect(post1.dy, lessThan(pre1.dy));
    await tester.pump(const Duration(milliseconds: 180));
    final inertia1 = tBloc!.state.transform.translation;
    expect(inertia1.dy, lessThan(post1.dy));

    // Short idle then second burst
    await tester.pump(const Duration(milliseconds: 60));
    final pre2 = tBloc!.state.transform.translation;
    for (int i = 0; i < 10; i++) {
      tester.binding.handlePointerEvent(PointerScrollEvent(
        position: center,
        scrollDelta: const Offset(0, -3),
        kind: PointerDeviceKind.mouse,
        timeStamp: Duration(milliseconds: 16 * (i + 1)),
      ));
      await tester.pump(const Duration(milliseconds: 16));
    }
    final post2 = tBloc!.state.transform.translation;
    expect(post2.dy, lessThan(pre2.dy));
    await tester.pump(const Duration(milliseconds: 180));
    final inertia2 = tBloc!.state.transform.translation;
    expect(inertia2.dy, lessThan(post2.dy));

    controller.dispose();
  });
}
