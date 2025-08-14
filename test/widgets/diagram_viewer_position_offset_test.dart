import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';

class _ProbeController implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  final received = <DiagramEventUnion>[];
  _ProbeController() {
    _evt.stream.listen(received.add);
  }
  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _evt.sink;
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 2000, 1500);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets('Pointer mapping honors viewer local offset inside Row',
      (tester) async {
    final controller = _ProbeController();
    final eventBloc = EventManagementBloc();
    final transformBloc =
        TransformBloc(configuration: const DiagramConfiguration());
    final zoomBloc = ZoomBloc(
      configuration: const DiagramConfiguration(),
      diagramRect: controller.logicalExtent,
      viewportSize: const Size(800, 600),
    );
    final panBloc = PanBloc(
      configuration: const DiagramConfiguration(),
      diagramRect: controller.logicalExtent,
      viewportSize: const Size(800, 600),
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Test')),
        body: Row(
          children: [
            const SizedBox(width: 200),
            const VerticalDivider(width: 1),
            Expanded(
              child: MultiBlocProvider(
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
            ),
          ],
        ),
      ),
    ));

    await tester.pumpAndSettle();
    final viewerFinder = find.byType(DiagramViewerContent);
    expect(viewerFinder, findsOneWidget);

    // Tap at the visual center of the viewer
    await tester.tap(viewerFinder);
    await tester.pump();

    // Expect a tap event with logicalPosition equal to snapshot.physicalToLogical(local center)
    expect(controller.received, isNotEmpty);
    final last = controller.received.last;
    late Offset logicalFromEvent;
    late Transform2D snapshot;
    last.when(
      tap: (e) {
        logicalFromEvent = e.logicalPosition;
        snapshot = e.transformSnapshot;
      },
      // others unused
      doubleTap: (_) {},
      longPress: (_) {},
      scroll: (_) {},
      dragBegin: (_) {},
      dragContinue: (_) {},
      dragEnd: (_) {},
      pinchBegin: (_) {},
      pinchContinue: (_) {},
      pinchEnd: (_) {},
      dragTargetEnter: (_, __, ___, ____, _____, ______) {},
      dragTargetOver: (_, __, ___, ____, _____, ______, _______) {},
      dragTargetLeave: (_, __, ___) {},
      dragTargetDrop: (_, __, ___, ____, _____, ______, _______) {},
    );

    final renderBox = tester.renderObject(viewerFinder) as RenderBox;
    final localCenter = renderBox.size.center(Offset.zero);
    final expectedLogical = snapshot.physicalToLogical(localCenter);
    expect((logicalFromEvent - expectedLogical).distance, lessThan(0.01));

    // Cleanup
    eventBloc.close();
    transformBloc.close();
    zoomBloc.close();
    panBloc.close();
    controller.dispose();
  });
}
