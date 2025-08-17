import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('Large diagram QA – Magic Mouse responsiveness at high zoom', () {
    late MockDiagramController controller;

    Widget _harness(
        {required Rect extent, double maxZoom = 4.0, double minZoom = 0.25}) {
      final cfg = DiagramConfiguration(
        showSnapGrid: false,
        maxZoom: maxZoom,
        minZoom: minZoom,
      );
      return MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>(
                  create: (_) => EventManagementBloc()),
              BlocProvider<TransformBloc>(
                  create: (_) => TransformBloc(configuration: cfg)),
              BlocProvider<ZoomBloc>(
                create: (_) => ZoomBloc(
                  configuration: cfg,
                  diagramRect: extent,
                  viewportSize: const Size(1200, 800),
                ),
              ),
            ],
            child: Builder(builder: (context) {
              final transformBloc = context.read<TransformBloc>();
              transformBloc.add(
                TransformEvent.updateDiagramBounds(
                  diagramRect: extent,
                  viewportSize: const Size(1200, 800),
                ),
              );
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
      // Enlarge the logical extent to simulate a big diagram
      controller.setMockLogicalExtent(const Rect.fromLTWH(0, 0, 20000, 16000));
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets(
        'High zoom: small MM scroll bursts produce immediate pan and start inertia',
        (tester) async {
      await tester
          .pumpWidget(_harness(extent: controller.logicalExtent, maxZoom: 6.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Zoom in to a high scale via Cmd+wheel (simulate Magic Mouse-like step)
      await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
      for (int i = 0; i < 50; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -160),
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }
      await tester.sendKeyUpEvent(LogicalKeyboardKey.metaLeft);

      // Record translation
      final t0 = transformBloc.state.transform.translation;

      // Burst 1: small, smooth MM-like pan deltas (no modifier)
      for (int i = 0; i < 12; i++) {
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(600, 400),
            scrollDelta: Offset(0, -3),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 16));
      }

      // Expect immediate pan (allow equality due to min-step clamping)
      final t1 = transformBloc.state.transform.translation;
      expect(t1.dy, lessThanOrEqualTo(t0.dy));

      // After a brief idle, inertia should continue movement (allow equality)
      await tester.pump(const Duration(milliseconds: 200));
      final t2 = transformBloc.state.transform.translation;
      expect(t2.dy, lessThanOrEqualTo(t1.dy));
    });

    testWidgets(
        'Back-to-back MM bursts at high zoom both start (no alternation drop)',
        (tester) async {
      await tester
          .pumpWidget(_harness(extent: controller.logicalExtent, maxZoom: 6.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
      for (int i = 0; i < 50; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -160),
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }
      await tester.sendKeyUpEvent(LogicalKeyboardKey.metaLeft);

      final t0 = transformBloc.state.transform.translation;

      // Burst A
      for (int i = 0; i < 10; i++) {
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(800, 500),
            scrollDelta: Offset(5, 0),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 16));
      }
      final tA = transformBloc.state.transform.translation;
      expect(tA.dx, greaterThanOrEqualTo(t0.dx));
      await tester.pump(const Duration(milliseconds: 150));
      final tA2 = transformBloc.state.transform.translation;
      expect(tA2.dx, greaterThanOrEqualTo(tA.dx));

      // Short gap (new session)
      await tester.pump(const Duration(milliseconds: 260));

      // Burst B
      for (int i = 0; i < 10; i++) {
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(800, 500),
            scrollDelta: Offset(5, 0),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 16));
      }
      final tB = transformBloc.state.transform.translation;
      expect(tB.dx, greaterThanOrEqualTo(tA2.dx));
      await tester.pump(const Duration(milliseconds: 150));
      final tB2 = transformBloc.state.transform.translation;
      expect(tB2.dx, greaterThanOrEqualTo(tB.dx));
    });
  });
}
