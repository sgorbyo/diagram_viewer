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
  testWidgets('centers only on axes where extent is smaller than viewport',
      (tester) async {
    final controller = TestBoundsController(
      initialExtent:
          const Rect.fromLTWH(0, 0, 300, 300), // initial not relevant
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

    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    expect(transformBloc, isNotNull);

    // Extent smaller only horizontally (100x400): center X, clamp Y
    controller.updateExtentAndRedraw(const Rect.fromLTWH(0, 0, 100, 400));
    await tester.pumpAndSettle(const Duration(milliseconds: 10));

    final t1 = transformBloc!.state.transform.translation;
    expect(t1.dx, closeTo(150.0, 0.5)); // (400-100)/2
    expect(t1.dy,
        closeTo(0.0, 0.5)); // not centered vertically (content > viewport)
  });

  testWidgets('does not recenter when extent >= viewport on both axes',
      (tester) async {
    final controller = TestBoundsController(
      initialExtent: const Rect.fromLTWH(0, 0, 800, 600),
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
              onBlocsCreated: (tBloc, pBloc, zBloc) => transformBloc = tBloc,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(milliseconds: 10));

    // Should remain at origin (no centering when content >= viewport)
    final t = transformBloc!.state.transform.translation;
    expect(t.dx, closeTo(0.0, 0.5));
    expect(t.dy, closeTo(0.0, 0.5));
  });

  testWidgets(
      'handles multiple redraws and final centering matches last extent',
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
              onBlocsCreated: (tBloc, pBloc, zBloc) => transformBloc = tBloc,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(milliseconds: 10));

    // 1) 100x100 → (150, 100)
    controller.updateExtentAndRedraw(const Rect.fromLTWH(0, 0, 100, 100));
    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    var tr = transformBloc!.state.transform.translation;
    expect(tr.dx, closeTo(150.0, 0.5));
    expect(tr.dy, closeTo(100.0, 0.5));

    // 2) 200x200 → (100, 50)
    controller.updateExtentAndRedraw(const Rect.fromLTWH(0, 0, 200, 200));
    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    tr = transformBloc!.state.transform.translation;
    expect(tr.dx, closeTo(100.0, 0.5));
    expect(tr.dy, closeTo(50.0, 0.5));

    // 3) 600x600 (>= viewport both axes) → keep previous translation (no centering)
    final prev = tr;
    controller.updateExtentAndRedraw(const Rect.fromLTWH(0, 0, 600, 600));
    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    tr = transformBloc!.state.transform.translation;
    expect(tr.dx, closeTo(prev.dx, 0.5));
    expect(tr.dy, closeTo(prev.dy, 0.5));

    // 4) 50x50 → (175, 125)
    controller.updateExtentAndRedraw(const Rect.fromLTWH(0, 0, 50, 50));
    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    tr = transformBloc!.state.transform.translation;
    expect(tr.dx, closeTo(175.0, 0.5));
    expect(tr.dy, closeTo(125.0, 0.5));
  });
}
