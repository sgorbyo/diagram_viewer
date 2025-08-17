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
  group('Autoscroll diagonal (TDD)', () {
    testWidgets(
        'dragContinue repeats and logical delta on both axes during diagonal autoscroll',
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

      final viewer = find.byType(DiagramViewerContent);
      final cursor = tester.getCenter(viewer);
      final g = await tester.startGesture(cursor);
      await tester.pump(const Duration(milliseconds: 16));

      // Diagonal autoscroll (down-left)
      ctrl.send(
          const DiagramCommand.autoScrollStep(velocity: Offset(-700, 600)));
      await tester.pump(const Duration(milliseconds: 700));

      final continues = ctrl.recorded
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .toList();
      expect(continues.length, greaterThanOrEqualTo(1));

      // Check stable eventId
      final ids = continues
          .map((e) =>
              e.maybeWhen(dragContinue: (c) => c.eventId, orElse: () => ''))
          .toSet();
      expect(ids.length, equals(1));

      // Assert that transform translation moved on both axes
      final t = transformBloc.state.transform.translation;
      // Take another tick to ensure measurable delta
      ctrl.send(
          const DiagramCommand.autoScrollStep(velocity: Offset(-700, 600)));
      await tester.pump(const Duration(milliseconds: 200));
      final t2 = transformBloc.state.transform.translation;
      final ddx = (t2.dx - t.dx).abs();
      final ddy = (t2.dy - t.dy).abs();
      expect(ddx + ddy, greaterThan(0));

      await g.up();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
      ctrl.dispose();
    });
  });
}
