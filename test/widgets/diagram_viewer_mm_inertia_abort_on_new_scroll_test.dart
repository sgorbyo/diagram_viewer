import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('Magic Mouse: new scroll aborts ongoing inertia', () {
    late MockDiagramController controller;

    Widget _harness({required Rect extent}) {
      final cfg = DiagramConfiguration(
        showSnapGrid: false,
      );
      return MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>(
                  create: (_) => EventManagementBloc()),
              BlocProvider<TransformBloc>(
                  create: (_) => TransformBloc(configuration: cfg)),
            ],
            child: Builder(builder: (context) {
              final transformBloc = context.read<TransformBloc>();
              transformBloc.add(TransformEvent.updateDiagramBounds(
                diagramRect: extent,
                viewportSize: const Size(1200, 800),
              ));
              return DiagramViewerContent(
                controller: controller,
                configuration: cfg,
                debug: false,
              );
            }),
          ),
        ),
      );
    }

    setUp(() {
      controller = MockDiagramController();
      controller.setMockLogicalExtent(const Rect.fromLTWH(0, 0, 20000, 16000));
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets(
        'New scroll during inertia reverses immediately and cancels prior motion',
        (tester) async {
      await tester.pumpWidget(_harness(extent: controller.logicalExtent));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Smooth MM-like burst upward to kick inertia (content moves down: dy decreases)
      for (int i = 0; i < 15; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -3),
            timeStamp: Duration(milliseconds: 16 * (i + 1)),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 16));
      }

      final t0 = transformBloc.state.transform.translation;
      // Allow inertia debounce to elapse and start
      await tester.pump(const Duration(milliseconds: 120));
      final tInertia = transformBloc.state.transform.translation;
      expect(tInertia.dy, lessThanOrEqualTo(t0.dy));

      // While inertia is running, send a new scroll down (opposite direction)
      tester.binding.handlePointerEvent(
        const PointerScrollEvent(
          position: Offset(600, 400),
          scrollDelta: Offset(0, 8), // down
          timeStamp: Duration(milliseconds: 400),
          kind: PointerDeviceKind.mouse,
        ),
      );
      await tester.pump(const Duration(milliseconds: 1));

      final tAfter = transformBloc.state.transform.translation;
      // Immediate effect should reverse dy clearly (>10 px to exceed amplify/minStep noise)
      expect(tAfter.dy, greaterThan(tInertia.dy + 10.0));

      // At 100ms (after 80ms debounce), must be moving in new direction noticeably
      await tester.pump(const Duration(milliseconds: 100));
      final t100 = transformBloc.state.transform.translation;
      expect(t100.dy, greaterThan(tAfter.dy + 10.0));

      // At 200ms, cumulative movement must increase further
      await tester.pump(const Duration(milliseconds: 100));
      final t200 = transformBloc.state.transform.translation;
      expect(t200.dy, greaterThan(tAfter.dy + 18.0));

      // Final displacement from pre-abort position must be significant
      final tFinal = transformBloc.state.transform.translation;
      expect(tFinal.dy, greaterThan(tInertia.dy + 28.0));
    });

    testWidgets(
        'Three rapid successive bursts alternate directions without loss',
        (tester) async {
      await tester.pumpWidget(_harness(extent: controller.logicalExtent));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Burst 1: up
      for (int i = 0; i < 12; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -3),
            timeStamp: Duration(milliseconds: 16 * (i + 1)),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 8));
      }
      await tester.pump(const Duration(milliseconds: 60));
      final tB1 = transformBloc.state.transform.translation;

      // Burst 2: down
      for (int i = 0; i < 8; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, 6),
            timeStamp: Duration(milliseconds: 300 + 16 * (i + 1)),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 8));
      }
      await tester.pump(const Duration(milliseconds: 40));
      final tB2 = transformBloc.state.transform.translation;
      expect(tB2.dy, greaterThan(tB1.dy + 8.0));

      // Burst 3: up again
      for (int i = 0; i < 8; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -6),
            timeStamp: Duration(milliseconds: 500 + 16 * (i + 1)),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 8));
      }
      await tester.pump(const Duration(milliseconds: 40));
      final tB3 = transformBloc.state.transform.translation;
      expect(tB3.dy, lessThan(tB2.dy - 8.0));
    });

    testWidgets(
        'Rapid single-tick alternating bursts are all captured with immediate >= 2px movement',
        (tester) async {
      await tester.pumpWidget(_harness(extent: controller.logicalExtent));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      Offset last = transformBloc.state.transform.translation;
      // 10 rapid single-event bursts, alternating directions, ~24ms apart
      for (int i = 0; i < 10; i++) {
        final dy = (i % 2 == 0) ? -3.0 : 3.0; // alternate up/down
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: Offset(0, dy),
            timeStamp: Duration(milliseconds: 16 * (i + 1)),
            kind: PointerDeviceKind.mouse,
          ),
        );
        // allow one frame for state to update
        await tester.pump(const Duration(milliseconds: 8));
        final now = transformBloc.state.transform.translation;
        final moved = (now.dy - last.dy).abs();
        expect(moved, greaterThanOrEqualTo(2.0));
        last = now;
        // short gap before next micro-burst
        await tester.pump(const Duration(milliseconds: 16));
      }
    });
  });
}
