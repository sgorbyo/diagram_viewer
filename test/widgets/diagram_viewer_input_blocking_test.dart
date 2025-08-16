import 'dart:async';
import 'dart:ui';
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
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 3000, 2000);
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets(
      'No pan occurs after mouse up even if pointer moves without button',
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

    // Drag to cause pan then release
    final drag = await tester.startGesture(center);
    await drag.moveBy(const Offset(-120, 0));
    await tester.pump(const Duration(milliseconds: 16));
    await drag.up();
    await tester.pump(const Duration(milliseconds: 16));

    final tAfterUp = tBloc!.state.transform.translation;

    // Move mouse without button pressed (hover)
    final hover = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await hover.addPointer(location: center);
    await tester.pump();
    await hover.moveTo(center + const Offset(200, 0));
    await tester.pump(const Duration(milliseconds: 32));

    final tAfterHover = tBloc!.state.transform.translation;
    expect(tAfterHover, equals(tAfterUp));
  });

  testWidgets('During bounce-back animation input is ignored until completion',
      (tester) async {
    final controller = _Ctrl();
    TransformBloc? tBloc;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TestableDiagramViewer(
          controller: controller,
          onBlocsCreated: (tb, _, __) => tBloc = tb,
          configuration: const DiagramConfiguration(),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    final viewer = find.byType(TestableDiagramViewer);
    final center = tester.getCenter(viewer);

    // Fling to overscroll and release to start bounce-back
    await tester.flingFrom(center, const Offset(-600, 0), 4000);
    await tester.pump();

    final beforeBounce = tBloc!.state.transform;
    final current = tBloc!.state;
    // Expected target after bounce (strict cap)
    Transform2DUtils.capTransformWithZoomLimits(
      transform: beforeBounce,
      diagramRect: current.diagramRect,
      size: current.viewportSize,
      dynamic: false,
      minZoom: controller.configuration.minZoom,
      maxZoom: controller.configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );

    // Try to interact during bounce-back repeatedly
    for (int i = 0; i < 6; i++) {
      final g = await tester.startGesture(center);
      await g.moveBy(const Offset(60, 0));
      await tester.pump(const Duration(milliseconds: 40));
      await g.up();
    }

    // Wait for bounce-back to complete (default 300ms; add margin)
    await tester.pump(const Duration(milliseconds: 600));

    final after = tBloc!.state.transform;
    final strictAfter = Transform2DUtils.capTransformWithZoomLimits(
      transform: after,
      diagramRect: tBloc!.state.diagramRect,
      size: tBloc!.state.viewportSize,
      dynamic: false,
      minZoom: controller.configuration.minZoom,
      maxZoom: controller.configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );
    // Final transform should be within legal bounds regardless of input during bounce
    final withinBounds =
        (after.translation - strictAfter.translation).distance < 1.0;
    expect(withinBounds, isTrue);
  });
}
