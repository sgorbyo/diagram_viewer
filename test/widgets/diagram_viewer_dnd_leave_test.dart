import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';

class _ProbeController implements IDiagramController {
  final _commands = StreamController<DiagramCommand>.broadcast();
  final _events = StreamController<DiagramEventUnion>.broadcast();
  final received = <DiagramEventUnion>[];
  _ProbeController() {
    _events.stream.listen(received.add);
  }
  @override
  Stream<DiagramCommand> get commandStream => _commands.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _events.sink;
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 1000, 1000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _commands.close();
    _events.close();
  }
}

void main() {
  testWidgets('Leave emits event and hides overlay within a frame',
      (tester) async {
    final controller = _ProbeController();
    final eventBloc = EventManagementBloc();
    final transformBloc =
        TransformBloc(configuration: const DiagramConfiguration());
    final zoomBloc = ZoomBloc(
      configuration: const DiagramConfiguration(),
      diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000),
      viewportSize: const Size(800, 600),
    );
    final panBloc = PanBloc(
      configuration: const DiagramConfiguration(),
      diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000),
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
              configuration: const DiagramConfiguration(),
              debug: false,
            ),
          ),
          const Positioned(
            left: 10,
            top: 10,
            child: Draggable<Map<String, dynamic>>(
              data: {'t': 'ghost'},
              feedback: SizedBox(
                  width: 20, height: 20, child: ColoredBox(color: Colors.blue)),
              child: SizedBox(
                  width: 20, height: 20, child: ColoredBox(color: Colors.red)),
            ),
          ),
        ]),
      ),
    ));

    await tester.pumpAndSettle();
    final drag = find.byType(Draggable<Map<String, dynamic>>);
    final viewer = find.byType(DiagramViewerContent);

    final start = tester.getCenter(drag);
    final center = tester.getCenter(viewer);
    final gesture = await tester.startGesture(start);
    await gesture.moveTo(center);
    await tester.pump();
    // Overlay ghost attivo entro 1 frame (può essere asincrono, concedi un frame)
    await tester.pump();
    expect(
        find.byKey(const ValueKey('drag_ghost_overlay_inner')), findsOneWidget);

    // Move far outside viewer to trigger leave
    await gesture.moveTo(const Offset(2000, 2000));
    await tester.pump();

    final hasLeave = controller.received.any((e) => e.maybeWhen(
          dragTargetLeave: (_, __, ___) => true,
          orElse: () => false,
        ));
    expect(hasLeave, isTrue);
    expect(
        find.byKey(const ValueKey('drag_ghost_overlay_inner')), findsNothing);

    await gesture.up();
    eventBloc.close();
    transformBloc.close();
    zoomBloc.close();
    panBloc.close();
    controller.dispose();
  });
}
