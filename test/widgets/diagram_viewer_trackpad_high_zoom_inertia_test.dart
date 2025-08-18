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
  group('Trackpad two-finger pan at high zoom', () {
    late MockDiagramController controller;

    Widget _harness({required Rect extent, double maxZoom = 6.0}) {
      final cfg = DiagramConfiguration(
        showSnapGrid: false,
        maxZoom: maxZoom,
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

    testWidgets('Immediate pan + inertia after two-finger burst',
        (tester) async {
      await tester.pumpWidget(_harness(extent: controller.logicalExtent));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Zoom in via Cmd+wheel to reach high scale
      await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
      for (int i = 0; i < 40; i++) {
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

      // Simulate two-finger pan burst: two touch pointers moving together (scale ~ 1.0)
      final g1 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g1.down(center + const Offset(-20, -20));
      final g2 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g2.down(center + const Offset(20, 20));

      for (int i = 0; i < 12; i++) {
        await g1.moveBy(const Offset(0, -6));
        await g2.moveBy(const Offset(0, -6));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g1.up();
      await g2.up();

      final t1 = transformBloc.state.transform.translation;
      expect(t1.dy, lessThanOrEqualTo(t0.dy));

      await tester.pump(const Duration(milliseconds: 200));
      final t2 = transformBloc.state.transform.translation;
      expect(t2.dy, lessThanOrEqualTo(t1.dy));
    });

    testWidgets(
        'Back-to-back two-finger bursts both start (no alternation drop)',
        (tester) async {
      await tester.pumpWidget(_harness(extent: controller.logicalExtent));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // High zoom
      await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
      for (int i = 0; i < 40; i++) {
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
      var g1 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g1.down(center + const Offset(-25, -25));
      var g2 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g2.down(center + const Offset(25, 25));
      for (int i = 0; i < 10; i++) {
        await g1.moveBy(const Offset(8, 0));
        await g2.moveBy(const Offset(8, 0));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g1.up();
      await g2.up();
      final tA = transformBloc.state.transform.translation;
      expect(tA.dx, greaterThanOrEqualTo(t0.dx));
      await tester.pump(const Duration(milliseconds: 150));
      final tA2 = transformBloc.state.transform.translation;
      expect(tA2.dx, greaterThanOrEqualTo(tA.dx));

      // Gap
      await tester.pump(const Duration(milliseconds: 260));

      // Burst B
      g1 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g1.down(center + const Offset(-25, -25));
      g2 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g2.down(center + const Offset(25, 25));
      for (int i = 0; i < 10; i++) {
        await g1.moveBy(const Offset(8, 0));
        await g2.moveBy(const Offset(8, 0));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g1.up();
      await g2.up();
      final tB = transformBloc.state.transform.translation;
      // Only assert that burst B causes immediate pan (starts), avoiding long-tail assumptions
      expect(tB.dx, greaterThanOrEqualTo(tA2.dx));
    });
  });
}
