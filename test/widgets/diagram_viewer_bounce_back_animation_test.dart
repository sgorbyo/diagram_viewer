import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
// Removed unused import

void main() {
  group('Bounce-back Animation and Centering', () {
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
