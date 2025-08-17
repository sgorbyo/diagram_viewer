import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';

class _RecordingController implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  final List<DiagramEventUnion> recorded = [];

  _RecordingController() {
    _evt.stream.listen(recorded.add);
  }

  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _evt.sink;
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 4000, 3000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }

  void send(DiagramCommand cmd) => _cmd.add(cmd);
}

void main() {
  group('Autoscroll drag sync (TDD)', () {
    testWidgets(
        'emits dragContinue repeatedly during autoScroll without extra pointer moves',
        (tester) async {
      final ctrl = _RecordingController();
      final eventBloc = EventManagementBloc();
      final transformBloc =
          TransformBloc(configuration: const DiagramConfiguration());
      final zoomBloc = ZoomBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );
      final panBloc = PanBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>.value(value: eventBloc),
              BlocProvider<TransformBloc>.value(value: transformBloc),
              BlocProvider<ZoomBloc>.value(value: zoomBloc),
              BlocProvider<PanBloc>.value(value: panBloc),
            ],
            child: DiagramViewerContent(
              controller: ctrl,
              configuration: const DiagramConfiguration(
                autoScrollInterval: Duration(milliseconds: 16),
              ),
              debug: false,
            ),
          ),
        ),
      ));
      await tester.pump();

      // Start drag near left edge to simulate entry in edge zone
      final viewer = find.byType(DiagramViewerContent);
      final topLeft = tester.getTopLeft(viewer);
      final start = topLeft + const Offset(6, 60);
      final g = await tester.startGesture(start);
      await tester.pump(const Duration(milliseconds: 16));

      // Trigger autoScroll ticks (no further pointer moves)
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-600, 0)));
      await tester.pump(const Duration(milliseconds: 250));
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-600, 0)));
      await tester.pump(const Duration(milliseconds: 300));

      // Count dragContinue events received by controller
      final dragContinues = ctrl.recorded
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .length;
      expect(dragContinues, greaterThanOrEqualTo(1),
          reason: 'controller should receive drag updates during autoscroll');

      // Transform should advance while pointer is stationary (direction-agnostic)
      final tx1 = transformBloc.state.transform.translation.dx;
      await tester.pump(const Duration(milliseconds: 100));
      final tx2 = transformBloc.state.transform.translation.dx;
      expect((tx2 - tx1).abs(), greaterThan(0));

      await g.up();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
      ctrl.dispose();
    });

    testWidgets(
        'logical position under fixed cursor updates as content scrolls (keeps object under cursor)',
        (tester) async {
      final ctrl = _RecordingController();
      final eventBloc = EventManagementBloc();
      final transformBloc =
          TransformBloc(configuration: const DiagramConfiguration());
      final zoomBloc = ZoomBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );
      final panBloc = PanBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>.value(value: eventBloc),
              BlocProvider<TransformBloc>.value(value: transformBloc),
              BlocProvider<ZoomBloc>.value(value: zoomBloc),
              BlocProvider<PanBloc>.value(value: panBloc),
            ],
            child: DiagramViewerContent(
              controller: ctrl,
              configuration: const DiagramConfiguration(
                autoScrollInterval: Duration(milliseconds: 16),
              ),
              debug: false,
            ),
          ),
        ),
      ));
      await tester.pump();

      // Fixed cursor position inside the viewer
      final viewer = find.byType(DiagramViewerContent);
      final tl = tester.getTopLeft(viewer);
      final cursor = tl + const Offset(20, 40);
      final g = await tester.startGesture(cursor);
      await tester.pump(const Duration(milliseconds: 16));

      // Snapshot logical position under cursor before autoscroll
      final tBefore = transformBloc.state.transform;
      final logicalBefore = tBefore.physicalToLogical(cursor - tl);

      // Trigger autoscroll without moving cursor
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-800, 0)));
      await tester.pump(const Duration(milliseconds: 400));

      final tAfter = transformBloc.state.transform;
      final logicalAfter = tAfter.physicalToLogical(cursor - tl);

      // Logical coordinate under the fixed cursor should change as content scrolls
      expect((logicalAfter - logicalBefore).dx.abs(), greaterThan(0));

      await g.up();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
      ctrl.dispose();
    });
  });
}
