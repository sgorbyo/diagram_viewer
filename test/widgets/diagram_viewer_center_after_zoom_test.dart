import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import 'test_diagram_controller.dart';

void main() {
  testWidgets('should auto-center after zoom-out when content < viewport',
      (tester) async {
    TransformBloc? transformBloc;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            height: 300,
            child: TestableDiagramViewer(
              controller: TestDiagramController(),
              configuration: const DiagramConfiguration(
                bounceDuration: Duration(milliseconds: 0),
              ),
              onBlocsCreated: (t, p, z) => transformBloc = t,
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    expect(transformBloc, isNotNull);

    final initial = transformBloc!.state.transform.translation;
    expect(initial.dx, closeTo(150.0, 1.0));
    expect(initial.dy, closeTo(100.0, 1.0));

    // Zoom-out to make content much smaller than viewport
    final current = transformBloc!.state.transform;
    transformBloc!.add(TransformEvent.zoom(
      scale: 0.5, // zoom-out
      focalPoint: Offset.zero,
      currentTransform: current,
    ));

    await tester.pump(const Duration(milliseconds: 16));

    // Trigger bounce-back recentering immediately
    transformBloc!.bounceBack(Duration.zero);
    await tester.pump();

    final after = transformBloc!.state.transform.translation;
    // For 100x100 content at 0.5 scale in 400x300 viewport, expect center
    expect(after.dx, closeTo((400 - 100 * 0.5) / 2, 1.0)); // 175
    expect(after.dy, closeTo((300 - 100 * 0.5) / 2, 1.0)); // 125
  });
}
