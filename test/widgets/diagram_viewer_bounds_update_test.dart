import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

class TestBoundsController implements IDiagramController {
  final StreamController<DiagramCommand> _cmd = StreamController.broadcast();
  final StreamController<DiagramEventUnion> _evt = StreamController.broadcast();

  Rect _logicalExtent;
  TestBoundsController({required Rect initialExtent})
      : _logicalExtent = initialExtent;

  void updateExtentAndRedraw(Rect newExtent) {
    _logicalExtent = newExtent;
    _cmd.add(
        DiagramCommand.redraw(renderables: objects, logicalExtent: newExtent));
  }

  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;

  @override
  StreamSink<DiagramEventUnion> get eventsSink => _evt.sink;

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();

  @override
  Rect get logicalExtent => _logicalExtent;

  @override
  List<DiagramObjectEntity> get objects => const [];

  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets('updates diagram bounds and re-centers on redraw with new extent',
      (tester) async {
    final controller = TestBoundsController(
      initialExtent: const Rect.fromLTWH(0, 0, 100, 100),
    );

    TransformBloc? transformBloc;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            height: 300,
            child: TestableDiagramViewer(
              controller: controller,
              onBlocsCreated: (tBloc, pBloc, zBloc) {
                transformBloc = tBloc;
              },
            ),
          ),
        ),
      ),
    );

    // Wait for blocs creation callback and first frame
    await tester.pump();
    await tester.pumpAndSettle(const Duration(milliseconds: 10));

    expect(transformBloc, isNotNull);

    // Send redraw with larger (but still smaller than viewport) extent 200x200
    const newExtent = Rect.fromLTWH(0, 0, 200, 200);
    controller.updateExtentAndRedraw(newExtent);

    await tester.pumpAndSettle(const Duration(milliseconds: 10));

    // Bounds updated in bloc state
    expect(transformBloc!.state.diagramRect, equals(newExtent));

    // Re-centered for 200x200 in 400x300 → (100, 50)
    final after = transformBloc!.state.transform.translation;
    expect(after.dx, closeTo(100.0, 0.5));
    expect(after.dy, closeTo(50.0, 0.5));
  });
}
