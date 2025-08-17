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
        inertialFriction: 0.90,
        inertialMaxDuration: Duration(milliseconds: 1000),
        inertialMinStopVelocity: 20.0,
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
  testWidgets('Wheel/trackpad burst starts inertial scroll after last event',
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

    // Emit a burst of wheel scroll events (vertical)
    for (int i = 0; i < 10; i++) {
      tester.binding.handlePointerEvent(
        PointerScrollEvent(
          position: center,
          scrollDelta: const Offset(0, -40), // scroll up (content moves down)
          kind: PointerDeviceKind.mouse,
          timeStamp: Duration(milliseconds: 16 * (i + 1)),
        ),
      );
    }
    await tester.pump();

    final t0 = tBloc!.state.transform.translation;
    // After a short delay, expect additional movement in the same direction (inertia)
    await tester.pump(const Duration(milliseconds: 150));
    final t1 = tBloc!.state.transform.translation;
    expect(t1.dy,
        lessThan(t0.dy)); // continued upward content movement (view moves up)

    // Eventually should settle
    await tester.pump(const Duration(milliseconds: 1200));
    final t2 = tBloc!.state.transform.translation;
    await tester.pump(const Duration(milliseconds: 200));
    final t3 = tBloc!.state.transform.translation;
    expect((t3.dy - t2.dy).abs(), lessThan(3));

    controller.dispose();
  });
}
