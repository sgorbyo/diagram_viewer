import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'dart:async';

class _FixedController implements IDiagramController {
  final Rect _extent;
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  _FixedController(this._extent);

  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;

  @override
  StreamSink<DiagramEventUnion> get eventsSink => _evt.sink;

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();

  @override
  Rect get logicalExtent => _extent;

  @override
  List<DiagramObjectEntity> get objects => const [];

  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }
}

void main() {
  testWidgets('updates limits and centering when viewport size changes',
      (tester) async {
    final controller = _FixedController(const Rect.fromLTWH(0, 0, 100, 100));
    addTearDown(() => controller.dispose());
    TransformBloc? transformBloc;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            height: 300,
            child: TestableDiagramViewer(
              controller: controller,
              onBlocsCreated: (t, p, z) => transformBloc = t,
            ),
          ),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 50));
    expect(transformBloc, isNotNull);
    // Initially centered at (150, 100)
    expect(transformBloc!.state.transform.translation.dx, closeTo(150.0, 1.0));
    expect(transformBloc!.state.transform.translation.dy, closeTo(100.0, 1.0));

    // Resize viewport to 600x300 -> expect X center to move to (600-100)/2 = 250
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 600,
            height: 300,
            child: TestableDiagramViewer(
              controller: controller,
              onBlocsCreated: (t, p, z) => transformBloc = t,
            ),
          ),
        ),
      ),
    );
    // Allow a short time for update
    await tester.pump(const Duration(milliseconds: 100));

    final t = transformBloc!.state.transform.translation;
    expect(t.dx, closeTo(250.0, 2.0));
    expect(t.dy, closeTo(100.0, 2.0));
  });
}
