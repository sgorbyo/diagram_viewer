import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';

void main() {
  group('Overscroll bounce respects configured duration', () {
    testWidgets('bounceBack runs for about configured 1000ms', (tester) async {
      const config = DiagramConfiguration(
        bounceDuration: Duration(milliseconds: 1000),
      );
      final bloc = TransformBloc(
        configuration: config,
        diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        viewportSize: const Size(400, 300),
      );
      addTearDown(() => bloc.close());

      await tester.pump();

      // Move away within elastic window and freeze to avoid snap
      bloc.setFrozenDuringDrag(true);
      bloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(
          scale: 1.0,
          translation: Offset(230, 100),
          rotation: 0.0,
        ),
      ));
      await tester.pump();

      final start = bloc.state.transform.translation;
      expect(start.dx, greaterThan(160));

      // Unfreeze and start bounce with long duration
      bloc.setFrozenDuringDrag(false);
      bloc.bounceBack(const Duration(milliseconds: 1000));

      // After 100ms, it should have progressed but not finished
      await tester.pump(const Duration(milliseconds: 100));
      final t100 = bloc.state.transform.translation;
      expect(t100.dx, lessThan(start.dx));
      expect(t100.dx, greaterThan(150));

      // After 900ms total, still not at target (tolerance), expect further progress
      await tester.pump(const Duration(milliseconds: 800));
      final t900 = bloc.state.transform.translation;
      expect(t900.dx, lessThan(t100.dx));
      expect(t900.dx, greaterThan(150));

      // After total 1100ms, animation should have completed ~ target
      await tester.pump(const Duration(milliseconds: 200));
      final end = bloc.state.transform.translation;
      expect(end.dx, closeTo(150.0, 1.0));
      expect(end.dy, closeTo(100.0, 1.0));
    });
  });
}
