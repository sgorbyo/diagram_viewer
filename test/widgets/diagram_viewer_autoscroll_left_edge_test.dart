import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';

class _Ctrl implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  _Ctrl() {
    _evt.stream.listen((e) {
      e.maybeWhen(
        dragContinue: (event) {
          final bp = event.metadata['borderProximity'] as Map<String, dynamic>?;
          if (bp == null) return;
          final bool isNearAny = (bp['isNearLeft'] == true) ||
              (bp['isNearRight'] == true) ||
              (bp['isNearTop'] == true) ||
              (bp['isNearBottom'] == true);
          if (!isNearAny) {
            _cmd.add(const DiagramCommand.stopAutoScroll());
            return;
          }
          final double normalized =
              (bp['normalizedDistance'] as double?) ?? 0.0; // 0..1
          final double intensity = (1.0 - normalized).clamp(0.0, 1.0);
          const double baseSpeed = 600.0; // px/s
          double vx = 0, vy = 0;
          if (bp['isNearLeft'] == true) vx += baseSpeed * intensity;
          if (bp['isNearRight'] == true) vx -= baseSpeed * intensity;
          if (bp['isNearTop'] == true) vy += baseSpeed * intensity;
          if (bp['isNearBottom'] == true) vy -= baseSpeed * intensity;
          _cmd.add(DiagramCommand.autoScrollStep(velocity: Offset(vx, vy)));
        },
        dragEnd: (event) {
          _cmd.add(const DiagramCommand.stopAutoScroll());
        },
        orElse: () {},
      );
    });
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
  testWidgets('Autoscroll triggers near left edge even with palette at left',
      (tester) async {
    final ctrl = _Ctrl();
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
        body: Row(children: [
          const SizedBox(width: 220),
          Expanded(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<EventManagementBloc>.value(value: eventBloc),
                BlocProvider<TransformBloc>.value(value: transformBloc),
                BlocProvider<ZoomBloc>.value(value: zoomBloc),
                BlocProvider<PanBloc>.value(value: panBloc),
              ],
              child: DiagramViewerContent(
                controller: ctrl,
                configuration: const DiagramConfiguration(),
                debug: false,
              ),
            ),
          )
        ]),
      ),
    ));

    await tester.pump();
    final viewer = find.byType(DiagramViewerContent);
    final topLeft = tester.getTopLeft(viewer);
    // Start drag near the left edge of the viewer (inside the viewer, not on the palette)
    final start = topLeft + const Offset(5, 50);
    final gesture = await tester.startGesture(start);
    // Move slightly inside while still near edge to trigger proximity
    await gesture.moveBy(const Offset(6, 0));
    await tester.pump(const Duration(milliseconds: 16));
    // If autoscroll correctly recognizes left edge, TransformBloc translation.x should increase over time
    final before = transformBloc.state.transform.translation.dx;
    await tester.pump(const Duration(milliseconds: 200));
    final after = transformBloc.state.transform.translation.dx;
    expect(after, greaterThan(before));

    await gesture.up();
    eventBloc.close();
    transformBloc.close();
    zoomBloc.close();
    panBloc.close();
    ctrl.dispose();
  });
}
