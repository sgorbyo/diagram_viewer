import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

class DragBoundsController implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();

  Rect _extent;
  DragBoundsController(this._extent);

  void redrawWithExtent(Rect extent) {
    _extent = extent;
    _cmd.add(
        DiagramCommand.redraw(renderables: objects, logicalExtent: extent));
  }

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
  testWidgets(
      'does not snap transform when bounds change during active drag, and animates back on end',
      (tester) async {
    final controller =
        DragBoundsController(const Rect.fromLTWH(0, 0, 300, 300));
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

    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    expect(transformBloc, isNotNull);

    // Start a drag gesture on empty area (background pan/drag path)
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.down(const Offset(200, 150));
    await tester.pump();
    await gesture.moveBy(const Offset(10, 0)); // classify as drag
    await tester.pump();

    final before = transformBloc!.state.transform.translation;

    // While dragging, logical extent shrinks (forcing tighter limits)
    controller.redrawWithExtent(const Rect.fromLTWH(0, 0, 100, 100));
    await tester.pumpAndSettle(const Duration(milliseconds: 10));

    final during = transformBloc!.state.transform.translation;

    // RED expectation: no snap during drag (translation unchanged)
    expect(during, equals(before),
        reason: 'Transform should not snap while dragging');

    // End drag
    await gesture.up();

    // After end, expect bounce-back (animation) to a legal, centered transform
    // For 100x100 in 400x300 → (150, 100)
    await tester.pump(const Duration(milliseconds: 350));
    final after = transformBloc!.state.transform.translation;
    expect(after.dx, closeTo(150.0, 2.0));
    expect(after.dy, closeTo(100.0, 1.0));
  });
}
