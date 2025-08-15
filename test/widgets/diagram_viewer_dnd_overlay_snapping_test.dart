import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
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
        snapGridEnabled: true,
        snapGridSpacing: 16,
        snapGridOrigin: Offset(4, 4),
        showSnapGrid: false,
      );
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 2000, 2000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets('DnD ghost overlay aligns to snap grid when enabled',
      (tester) async {
    final controller = _Ctrl();
    final eventBloc = EventManagementBloc();
    final transformBloc = TransformBloc(
        configuration: controller.configuration,
        diagramRect: controller.logicalExtent,
        viewportSize: const Size(800, 600));
    final zoomBloc = ZoomBloc(
      configuration: controller.configuration,
      diagramRect: controller.logicalExtent,
      viewportSize: const Size(800, 600),
    );
    final panBloc = PanBloc(
      configuration: controller.configuration,
      diagramRect: controller.logicalExtent,
      viewportSize: const Size(800, 600),
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>.value(value: eventBloc),
              BlocProvider<TransformBloc>.value(value: transformBloc),
              BlocProvider<ZoomBloc>.value(value: zoomBloc),
              BlocProvider<PanBloc>.value(value: panBloc),
            ],
            child: DiagramViewerContent(
              controller: controller,
              configuration: controller.configuration,
              debug: false,
            ),
          ),
          const Positioned(
            left: 20,
            top: 20,
            child: Draggable<Map<String, dynamic>>(
              data: {'type': 'circle', 'radius': 40.0},
              feedback: SizedBox(
                  width: 12, height: 12, child: ColoredBox(color: Colors.blue)),
              child: SizedBox(
                  width: 20, height: 20, child: ColoredBox(color: Colors.red)),
            ),
          ),
        ]),
      ),
    ));

    await tester.pumpAndSettle();

    // Apply a non-trivial scale and pan to verify mapping does not break snapping
    transformBloc.add(const TransformEvent.updateTransform(
      transform: Transform2D(scale: 1.25, translation: Offset(37, -23)),
    ));
    await tester.pump();

    final drag = find.byType(Draggable<Map<String, dynamic>>);
    final viewer = find.byType(DiagramViewerContent);
    final start = tester.getCenter(drag);
    final target = tester.getCenter(viewer) + const Offset(53, 27);

    final gesture = await tester.startGesture(start);
    await gesture.moveTo(target);
    await tester.pump();
    await tester.pump();

    final overlayFinder = find.byKey(const ValueKey('drag_ghost_overlay'));
    expect(overlayFinder, findsOneWidget);

    // Compute expected snapped global center from pointer target using transform and config
    final viewerBox = tester.renderObject(viewer) as RenderBox;
    final localPointer = viewerBox.globalToLocal(target);
    final t = transformBloc.state.transform;
    final logicalPointer = t.physicalToLogical(localPointer);
    final cfg = controller.configuration;
    final snappedLogical = Transform2DUtils.snapPointToGrid(
      point: logicalPointer,
      spacing: cfg.snapGridSpacing,
      origin: cfg.snapGridOrigin,
    );
    final snappedLocal = t.logicalToPhysical(snappedLogical);
    final expectedCenterGlobal = viewerBox.localToGlobal(snappedLocal);

    final rb = tester.renderObject(overlayFinder) as RenderBox;
    final ghostSize = rb.size;
    final ghostTopLeftGlobal = rb.localToGlobal(Offset.zero);
    final ghostCenterGlobal =
        ghostTopLeftGlobal + Offset(ghostSize.width / 2, ghostSize.height / 2);

    expect(
      (ghostCenterGlobal - expectedCenterGlobal).distance,
      lessThan(1.5),
    );

    await gesture.up();

    eventBloc.close();
    transformBloc.close();
    zoomBloc.close();
    panBloc.close();
    controller.dispose();
  });
}
