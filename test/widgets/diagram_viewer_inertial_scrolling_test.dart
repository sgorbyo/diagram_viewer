import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_viewer.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';

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
        inertialMaxDuration: Duration(milliseconds: 900),
        inertialMinStopVelocity: 30.0,
      );
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 3000, 2000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets('Inertial scrolling continues motion briefly after fast pan end',
      (tester) async {
    final controller = _Ctrl();

    TransformBloc? tBloc;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(
          controller: controller,
          onBlocsCreated: (tb, _, __) => tBloc = tb,
          configuration: controller.configuration,
        ),
      ),
    ));

    await tester.pumpAndSettle();
    final viewer = find.byType(TestableDiagramViewer);
    final center = tester.getCenter(viewer);

    // Fast pan to the left and release
    await tester.flingFrom(center, const Offset(-400, 0), 4000);
    await tester.pump();

    // Capture translation just after release
    final Offset t0 = tBloc!.state.transform.translation;

    // After some frames, expect additional left movement (more negative X)
    await tester.pump(const Duration(milliseconds: 150));
    final Offset t1 = tBloc!.state.transform.translation;
    expect(t1.dx, lessThan(t0.dx));

    // Let inertia and any bounce complete, then expect the view to stabilize
    await tester.pump(const Duration(milliseconds: 1200));
    final Offset t2 = tBloc!.state.transform.translation;
    await tester.pump(const Duration(milliseconds: 200));
    final Offset t3 = tBloc!.state.transform.translation;
    // Final drift after settling should be minimal
    expect((t3.dx - t2.dx).abs(), lessThan(5));

    controller.dispose();
  });

  testWidgets('No inertia after slow pan end', (tester) async {
    final controller = _Ctrl();

    TransformBloc? tBloc;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(
          controller: controller,
          onBlocsCreated: (tb, _, __) => tBloc = tb,
          configuration: controller.configuration,
        ),
      ),
    ));

    await tester.pumpAndSettle();
    final viewer = find.byType(TestableDiagramViewer);
    final center = tester.getCenter(viewer);

    // Slow pan (small distance / low velocity) and release
    final gesture = await tester.startGesture(center);
    await gesture.moveBy(const Offset(-50, 0));
    await tester.pump(const Duration(milliseconds: 300));
    await gesture.up();
    await tester.pump();

    final Offset t0 = tBloc!.state.transform.translation;
    await tester.pump(const Duration(milliseconds: 300));
    final Offset t1 = tBloc!.state.transform.translation;
    // Expect no further significant movement after release
    expect((t1.dx - t0.dx).abs(), lessThan(5));

    controller.dispose();
  });

  testWidgets('Inertia can overscroll then bounces back to limits',
      (tester) async {
    final controller = _Ctrl();

    TransformBloc? tBloc;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(
          controller: controller,
          onBlocsCreated: (tb, _, __) => tBloc = tb,
          configuration: controller.configuration,
        ),
      ),
    ));

    await tester.pumpAndSettle();
    final viewer = find.byType(TestableDiagramViewer);
    final center = tester.getCenter(viewer);

    // Fling strongly towards left to hit left boundary and beyond
    await tester.flingFrom(center, const Offset(-600, 0), 5000);
    await tester.pump();

    final Offset t0 = tBloc!.state.transform.translation;
    // Some motion due to inertia (towards left)
    await tester.pump(const Duration(milliseconds: 200));
    final Offset t1 = tBloc!.state.transform.translation;
    expect(t1.dx, lessThan(t0.dx));

    // Bounce-back should trigger promptly once the edge is reached (no long pause)
    bool bounced = false;
    var elapsed = 0;
    var previous = t1;
    while (!bounced && elapsed < 1200) {
      await tester.pump(const Duration(milliseconds: 50));
      elapsed += 50;
      final stNow = tBloc!.state;
      final strictNow = Transform2DUtils.capTransformWithZoomLimits(
        transform: stNow.transform,
        diagramRect: stNow.diagramRect,
        size: stNow.viewportSize,
        dynamic: false,
        minZoom: controller.configuration.minZoom,
        maxZoom: controller.configuration.maxZoom,
        preserveCentering: true,
        recenterSmallContent: false,
      );
      final tn = stNow.transform.translation;
      if (tn.dx > previous.dx || (tn - strictNow.translation).distance < 1.0) {
        bounced = true;
      }
      previous = tn;
    }
    expect(bounced, isTrue);

    controller.dispose();
  });
}
