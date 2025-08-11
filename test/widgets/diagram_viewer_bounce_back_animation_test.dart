import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
// Removed unused import

void main() {
  group('Bounce-back Animation and Centering', () {
    testWidgets('horizontal overscroll bounces only X, preserves Y',
        (tester) async {
      const config = DiagramConfiguration();
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Freeze to allow setting a position at the dynamic boundary
      bloc.setFrozenDuringDrag(true);
      // For 100x100 in 400x300 at scale=1, center is (150,100); min center X with dynamic window is 70
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(70, 123),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      final before = bloc.state.transform.translation;
      expect(before.dx, closeTo(70.0, 0.1));
      expect(before.dy, equals(123));

      // Trigger bounce-back
      bloc.setFrozenDuringDrag(false);
      bloc.bounceBack(const Duration(milliseconds: 200));

      // During animation, X should move toward center limit, Y should remain ~constant
      await tester.pump(const Duration(milliseconds: 50));
      final during = bloc.state.transform.translation;
      expect(during.dx, greaterThan(before.dx));
      expect(during.dy, closeTo(123, 1.0));

      // After animation, X should be centered, Y unchanged
      await tester.pump(const Duration(milliseconds: 300));
      final after = bloc.state.transform.translation;
      expect(after.dx, closeTo(150.0, 1.0));
      expect(after.dy, closeTo(123, 1.0));
    });

    testWidgets('min-zoom: after zoom to min, small-content axes recenter',
        (tester) async {
      const config = DiagramConfiguration(minZoom: 0.05, maxZoom: 4.0);
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Simulate zoom interaction to min
      bloc.add(TransformEvent.zoom(
        scale: config.minZoom / bloc.state.transform.scale,
        focalPoint: const Offset(0, 0),
        currentTransform: bloc.state.transform,
      ));
      await tester.pump();

      // Ensure last interaction marked as zoom by dispatching zoom above
      bloc.bounceBack(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 250));

      final afterTransform = bloc.state.transform;
      final scaledW = 100 * afterTransform.scale;
      final scaledH = 100 * afterTransform.scale;
      final expectedDx = (400 - scaledW) / 2;
      final expectedDy = (300 - scaledH) / 2;
      final after = afterTransform.translation;
      // Expect perfect centering at current min zoom for small content
      expect(after.dx, closeTo(expectedDx, 1.0));
      expect(after.dy, closeTo(expectedDy, 1.0));
    });

    testWidgets('mixed: X overscroll + small Y centering are both corrected',
        (tester) async {
      const config = DiagramConfiguration();
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Freeze and set: X at dynamic min boundary (70), Y slightly off center (102)
      bloc.setFrozenDuringDrag(true);
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(70, 102),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      // Unfreeze and bounce back after a pan interaction: expect X to center and Y to center as well
      bloc.setFrozenDuringDrag(false);
      // Simulate pan as last interaction
      bloc.add(TransformEvent.pan(
          delta: const Offset(0, 0), currentTransform: bloc.state.transform));
      await tester.pump();
      bloc.bounceBack(const Duration(milliseconds: 200));

      await tester.pump(const Duration(milliseconds: 250));
      final after = bloc.state.transform.translation;
      expect(after.dx, closeTo(150.0, 1.0));
      expect(after.dy, closeTo(100.0, 1.0));
    });

    testWidgets('mixed: Y overscroll + small X centering are both corrected',
        (tester) async {
      const config = DiagramConfiguration();
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Freeze and set: Y at dynamic min boundary (20), X slightly off center (148)
      bloc.setFrozenDuringDrag(true);
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(148, 20),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      // Unfreeze and bounce back after a pan interaction: expect both axes corrected
      bloc.setFrozenDuringDrag(false);
      bloc.add(TransformEvent.pan(
          delta: const Offset(0, 0), currentTransform: bloc.state.transform));
      await tester.pump();
      bloc.bounceBack(const Duration(milliseconds: 200));

      await tester.pump(const Duration(milliseconds: 250));
      final after = bloc.state.transform.translation;
      expect(after.dy, closeTo(100.0, 1.0));
      expect(after.dx, closeTo(150.0, 1.0));
    });
    testWidgets('vertical overscroll bounces only Y, preserves X',
        (tester) async {
      const config = DiagramConfiguration();
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Freeze to allow setting a position at the dynamic boundary
      bloc.setFrozenDuringDrag(true);
      // For 100x100 in 400x300 at scale=1, center is (150,100); min center Y with dynamic window is 20
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(77, 20),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      final before = bloc.state.transform.translation;
      expect(before.dy, closeTo(20.0, 0.1));
      expect(before.dx, equals(77));

      // Trigger bounce-back
      bloc.setFrozenDuringDrag(false);
      bloc.bounceBack(const Duration(milliseconds: 200));

      // During animation, Y should move toward center limit, X should remain ~constant
      await tester.pump(const Duration(milliseconds: 50));
      final during = bloc.state.transform.translation;
      expect(during.dy, greaterThan(before.dy));
      expect(during.dx, closeTo(77, 1.0));

      // After animation, Y should be centered, X unchanged
      await tester.pump(const Duration(milliseconds: 300));
      final after = bloc.state.transform.translation;
      expect(after.dy, closeTo(100.0, 1.0));
      expect(after.dx, closeTo(77, 1.0));
    });
    testWidgets('bounceBack animates over time (not instant snap)',
        (tester) async {
      const config = DiagramConfiguration();
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Move away from center within elastic window (freeze to avoid snap)
      bloc.setFrozenDuringDrag(true);
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(230, 100),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      final before = bloc.state.transform.translation;
      expect(before.dx, greaterThan(160));

      // Trigger bounce-back with duration
      bloc.setFrozenDuringDrag(false);
      bloc.bounceBack(const Duration(milliseconds: 380));

      // After a short time, position should be between start and target (not instant)
      await tester.pump(const Duration(milliseconds: 80));
      final during = bloc.state.transform.translation;
      expect(during.dx, lessThan(before.dx));
      expect(during.dx, greaterThan(150));

      // After settling, it should reach the centered target
      // Advance time to finish animation
      await tester.pump(const Duration(milliseconds: 400));
      final after = bloc.state.transform.translation;
      expect(after.dx, closeTo(150.0, 1.0));
      expect(after.dy, closeTo(100.0, 1.0));

      // bloc closed by tearDown
    });

    testWidgets('zoom-out: centers only on small axis, with animation',
        (tester) async {
      const config = DiagramConfiguration();
      // Content wider than viewport, but shorter vertically
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 800, 100),
        viewportSize: const Size(400, 300),
      );

      addTearDown(() => bloc.close());
      await tester.pump();

      // Set a translation off the expected vertical center (freeze to avoid snap)
      bloc.setFrozenDuringDrag(true);
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(0, 10),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      final before = bloc.state.transform.translation;
      // X should not be centered because content is wider than viewport; Y should animate to 100
      expect(before.dy, isNot(closeTo(100.0, 1.0)));

      bloc.setFrozenDuringDrag(false);
      bloc.bounceBack(const Duration(milliseconds: 380));

      await tester.pump(const Duration(milliseconds: 50));
      final during = bloc.state.transform.translation;
      expect(during.dy, greaterThan(before.dy));
      // X should remain approximately the same (no centering on X)
      expect(during.dx, closeTo(before.dx, 1.0));

      await tester.pump(const Duration(milliseconds: 400));
      final after = bloc.state.transform.translation;
      expect(after.dy, closeTo(100.0, 1.0));
      expect(after.dx, closeTo(before.dx, 1.0));

      // bloc closed by tearDown
    });
  });
}
