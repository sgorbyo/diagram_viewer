import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_viewer.dart'
    show TestableDiagramViewer;
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:example/controllers/example_diagram_controller.dart';

void main() {
  testWidgets('Example DnD ghost aligns to snap grid while dragging',
      (tester) async {
    final controller = ExampleDiagramController();

    const cfg = DiagramConfiguration(
      snapGridEnabled: true,
      snapGridSpacing: 16,
      snapGridOrigin: Offset(4, 4),
      showSnapGrid: false,
      minZoom: 0.01,
      maxZoom: 4.0,
    );

    TransformBloc? capturedBloc;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(children: [
            TestableDiagramViewer(
              controller: controller,
              configuration: cfg,
              onBlocsCreated: (TransformBloc tBloc, _, __) {
                capturedBloc = tBloc;
              },
            ),
            const Positioned(
              left: 20,
              top: 20,
              child: Draggable<Map<String, dynamic>>(
                data: {'type': 'circle', 'radius': 40.0},
                feedback: SizedBox(
                    width: 12,
                    height: 12,
                    child: ColoredBox(color: Colors.blue)),
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: ColoredBox(color: Colors.red)),
              ),
            ),
          ]),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final drag = find.byType(Draggable<Map<String, dynamic>>);
    final viewer = find.byType(TestableDiagramViewer);

    final start = tester.getCenter(drag);
    final target = tester.getCenter(viewer) + const Offset(53, 27);

    final gesture = await tester.startGesture(start);
    await gesture.moveTo(target);
    await tester.pump();
    await tester.pump();

    final overlayFinder = find.byKey(const ValueKey('drag_ghost_overlay'));
    expect(overlayFinder, findsOneWidget);

    // Measure overlay center and assert it snaps to grid in viewer-local logical space
    final viewerBox = tester.renderObject(viewer) as RenderBox;
    final rb = tester.renderObject(overlayFinder) as RenderBox;
    final ghostSize = rb.size;
    final ghostTopLeftGlobal = rb.localToGlobal(Offset.zero);
    final ghostCenterGlobal =
        ghostTopLeftGlobal + Offset(ghostSize.width / 2, ghostSize.height / 2);

    final t = capturedBloc?.state.transform ?? const Transform2D();
    final centerLocal = viewerBox.globalToLocal(ghostCenterGlobal);
    final centerLogical = t.physicalToLogical(centerLocal);

    final snappedCenterLogical = Transform2DUtils.snapPointToGrid(
      point: centerLogical,
      spacing: cfg.snapGridSpacing,
      origin: cfg.snapGridOrigin,
    );

    expect((snappedCenterLogical - centerLogical).distance, lessThan(1.0));

    await gesture.up();
  });
}
