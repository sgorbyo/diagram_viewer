import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import 'package:diagram_viewer/events/events.dart';

class _Ctrl implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  final List<DiagramEventUnion> received = [];
  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _evt.sink;
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 1000, 1000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }

  _Ctrl() {
    _evt.stream.listen(received.add);
  }
}

void main() {
  testWidgets('DnD ghost overlay is faithful in size and centered at drop',
      (tester) async {
    final controller = _Ctrl();
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
            left: 20,
            top: 20,
            child: Draggable<Map<String, dynamic>>(
              data: {'type': 'circle', 'radius': 40.0, 'color': 0xFF2196F3},
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

    // Imposta una trasformazione con scala 1.5
    transformBloc.add(const TransformEvent.updateTransform(
      transform: Transform2D(scale: 1.5, translation: Offset.zero),
    ));
    await tester.pump();

    final drag = find.byType(Draggable<Map<String, dynamic>>);
    final viewer = find.byType(DiagramViewerContent);
    final start = tester.getCenter(drag);
    final target = tester.getCenter(viewer);
    final gesture = await tester.startGesture(start);
    await gesture.moveTo(target);
    await tester.pump();
    // concedi un frame extra per la costruzione dell'overlay
    await tester.pump();

    // Ghost overlay presente
    final overlayFinder = find.byKey(const ValueKey('drag_ghost_overlay'));
    expect(overlayFinder, findsOneWidget);

    // Misura direttamente il RenderBox del ghost e calcola centro e size in global
    final rb = tester.renderObject(overlayFinder) as RenderBox;
    final ghostSize = rb.size;
    final ghostTopLeft = rb.localToGlobal(Offset.zero);
    final ghostCenter =
        ghostTopLeft + Offset(ghostSize.width / 2, ghostSize.height / 2);
    // Recupera l'ultimo Over per ottenere la screenPosition reale
    final overs = controller.received.where((e) => e.maybeWhen(
          dragTargetOver: (a, b, c, d, e, f, g) => true,
          orElse: () => false,
        ));
    expect(overs, isNotEmpty);
    late Offset expectedCenter;
    overs.last.when(
      dragTargetOver:
          (id, dataPreview, screenPos, logicalPos, snapshot, ts, snapped) {
        expectedCenter = screenPos;
      },
      tap: (_) => null,
      doubleTap: (_) => null,
      longPress: (_) => null,
      scroll: (_) => null,
      dragBegin: (_) => null,
      dragContinue: (_) => null,
      dragEnd: (_) => null,
      pinchBegin: (_) => null,
      pinchContinue: (_) => null,
      pinchEnd: (_) => null,
      dragTargetEnter: (a, b, c, d, e, f) => null,
      dragTargetLeave: (a, b, c) => null,
      dragTargetDrop: (a, b, c, d, e, f, g) => null,
    );
    // Debug info
    // ignore: avoid_print
    print(
        'DBG box.size=$ghostSize topLeft=$ghostTopLeft center=$ghostCenter expected=$expectedCenter');
    expect((ghostCenter - expectedCenter).distance, lessThan(1.5));

    // Dimensione attesa = 2 * radius * scale = 2 * 40 * 1.5 = 120 px (tolleranza 2px)
    expect((ghostSize.width - 120).abs(), lessThan(2.0));
    expect((ghostSize.height - 120).abs(), lessThan(2.0));

    await gesture.up();

    eventBloc.close();
    transformBloc.close();
    zoomBloc.close();
    panBloc.close();
    controller.dispose();
  });
}
