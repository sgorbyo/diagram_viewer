import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import 'test_diagram_controller.dart';

void main() {
  testWidgets(
      'Example-like min zoom: viewer recenters small content after bounce',
      (tester) async {
    TransformBloc? transformBloc;

    const config = DiagramConfiguration(
      minZoom: 0.05,
      maxZoom: 4.0,
      bounceDuration: Duration(milliseconds: 0),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            height: 300,
            child: TestableDiagramViewer(
              controller: TestDiagramController(),
              configuration: config,
              blocFactory: const DefaultBlocFactory(),
              onBlocsCreated: (t, p, z) => transformBloc = t,
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    expect(transformBloc, isNotNull);

    // Initial centered at scale 1.0 for 100x100 in 400x300
    final initial = transformBloc!.state.transform.translation;
    expect(initial.dx, closeTo(150.0, 1.0));
    expect(initial.dy, closeTo(100.0, 1.0));

    // Zoom to min via TransformEvent to simulate gesture path
    final current = transformBloc!.state.transform;
    final toMinFactor = config.minZoom / current.scale;
    transformBloc!.add(TransformEvent.zoom(
      scale: toMinFactor,
      focalPoint: Offset.zero,
      currentTransform: current,
    ));

    await tester.pump(const Duration(milliseconds: 16));

    // Trigger bounce-back (scale-end in content would do this)
    transformBloc!.setFrozenDuringDrag(false);
    transformBloc!.bounceBack(config.bounceDuration);
    await tester.pump();

    final afterTransform = transformBloc!.state.transform;
    final scaledW = 100 * afterTransform.scale;
    final scaledH = 100 * afterTransform.scale;
    final expectedDx = (400 - scaledW) / 2;
    final expectedDy = (300 - scaledH) / 2;
    final after = afterTransform.translation;

    expect(after.dx, closeTo(expectedDx, 1.0));
    expect(after.dy, closeTo(expectedDy, 1.0));
  });
}
