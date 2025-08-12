import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';

class _NullController implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
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
}

void main() {
  testWidgets('DiagramViewerContent paints inside a ClipRect', (tester) async {
    final controller = _NullController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => EventManagementBloc()),
            BlocProvider(
                create: (_) =>
                    TransformBloc(configuration: const DiagramConfiguration())),
            BlocProvider(
                create: (_) => ZoomBloc(
                      configuration: const DiagramConfiguration(),
                      diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000),
                      viewportSize: const Size(800, 600),
                    )),
            BlocProvider(
                create: (_) => PanBloc(
                      configuration: const DiagramConfiguration(),
                      diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000),
                      viewportSize: const Size(800, 600),
                    )),
          ],
          child: DiagramViewerContent(
            controller: controller,
            configuration: const DiagramConfiguration(),
            debug: false,
          ),
        ),
      ),
    ));

    // Expect a ClipRect ancestor for the CustomPaint
    final paintFinder = find.descendant(
      of: find.byType(DiagramViewerContent),
      matching: find.byType(CustomPaint),
    );
    expect(paintFinder, findsOneWidget);
    expect(find.ancestor(of: paintFinder, matching: find.byType(ClipRect)),
        findsOneWidget);

    controller.dispose();
  });
}
