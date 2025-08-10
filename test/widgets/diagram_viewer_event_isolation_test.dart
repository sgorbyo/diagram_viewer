import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'test_diagram_controller.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';

void main() {
  testWidgets(
      'pointer drag does not turn into pan and vice versa (event isolation)',
      (tester) async {
    final controller = TestDiagramController();
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
    final initial = transformBloc!.state.transform.translation;

    // Start a drag on an object area: simulate by sending dragBegin to controller
    controller.eventsSink.add(DiagramEventUnion.dragBegin(
      DiagramDragBegin(
        eventId: 'e1',
        logicalPosition: const Offset(10, 10),
        screenPosition: const Offset(10, 10),
        transformSnapshot: transformBloc!.state.transform,
        hitList: const [],
        timestamp: Duration.zero,
        metadata: const {},
        fingerCount: 1,
        mouseButton: null,
        isOnObject: true,
      ),
    ));

    // Send dragContinue to move object by 50 logical px to the right
    controller.eventsSink.add(DiagramEventUnion.dragContinue(
      DiagramDragContinue(
        eventId: 'e2',
        logicalPosition: const Offset(60, 10),
        screenPosition: const Offset(60, 10),
        transformSnapshot: transformBloc!.state.transform,
        hitList: const [],
        timestamp: Duration.zero,
        metadata: const {},
        delta: const Offset(50, 0),
        totalDelta: const Offset(50, 0),
        duration: Duration.zero,
        velocity: Offset.zero,
      ),
    ));

    // While dragging an object, viewer translation should remain unchanged (no pan)
    await tester.pump(const Duration(milliseconds: 16));
    final during = transformBloc!.state.transform.translation;
    expect(during, equals(initial));

    // End drag
    controller.eventsSink.add(DiagramEventUnion.dragEnd(
      DiagramDragEnd(
        eventId: 'e3',
        logicalPosition: const Offset(60, 10),
        screenPosition: const Offset(60, 10),
        transformSnapshot: transformBloc!.state.transform,
        hitList: const [],
        timestamp: Duration.zero,
        metadata: const {},
        totalDelta: const Offset(50, 0),
        totalDuration: Duration.zero,
        finalVelocity: Offset.zero,
        wasCancelled: false,
      ),
    ));

    await tester.pump(const Duration(milliseconds: 16));

    // Now perform a pure pan (empty area) and verify viewer translates
    final beforePan = transformBloc!.state.transform.translation;
    transformBloc!.add(TransformEvent.pan(
      delta: const Offset(30, 0),
      currentTransform: transformBloc!.state.transform,
    ));
    await tester.pump(const Duration(milliseconds: 16));
    final afterPan = transformBloc!.state.transform.translation;
    expect(afterPan.dx, greaterThan(beforePan.dx));
  });
}
