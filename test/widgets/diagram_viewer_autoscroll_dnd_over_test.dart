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

Widget _buildDraggable() => const Positioned(
      left: 20,
      top: 20,
      child: Draggable<Map<String, dynamic>>(
        data: {'type': 'ghost'},
        feedback: SizedBox(
            width: 20, height: 20, child: ColoredBox(color: Colors.blue)),
        child: SizedBox(
            width: 20, height: 20, child: ColoredBox(color: Colors.red)),
      ),
    );

void main() {
  group('Autoscroll DnD overlay (TDD)', () {
    testWidgets(
        'overlay remains active and transform advances during autoscroll without extra pointer moves',
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
          body: Stack(children: [
            MultiBlocProvider(
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
                )),
            _buildDraggable(),
          ]),
        ),
      ));
      await tester.pump();

      final draggable = find.byType(Draggable<Map<String, dynamic>>);
      final viewer = find.byType(DiagramViewerContent);
      final start = tester.getCenter(draggable);
      final topLeft = tester.getTopLeft(viewer);
      final edgeInside = topLeft + const Offset(6, 80);

      final g = await tester.startGesture(start);
      await g.moveTo(edgeInside);
      await tester.pump(const Duration(milliseconds: 16));

      // Overlay should be active (enter happened)
      final hasEnter = ctrl.recorded.any((e) => e.maybeWhen(
            dragTargetEnter: (_, __, ___, ____, _____, ______) => true,
            orElse: () => false,
          ));
      expect(hasEnter, isTrue);

      final tx1 = transformBloc.state.transform.translation.dx;
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-800, 0)));
      await tester.pump(const Duration(milliseconds: 400));
      final tx2 = transformBloc.state.transform.translation.dx;
      expect((tx2 - tx1).abs(), greaterThan(0));

      await g.up();
      ctrl.dispose();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
    });
  });
}
