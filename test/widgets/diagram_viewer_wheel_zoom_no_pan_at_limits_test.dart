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
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'dart:math' as math;

void main() {
  group('Wheel zoom at limits should not pan', () {
    late MockDiagramController controller;

    Widget _harness({double maxZoom = 4.0, double minZoom = 0.5}) {
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
                create: (_) => TransformBloc(
                  configuration: cfg,
                ),
              ),
              BlocProvider<ZoomBloc>(
                create: (_) => ZoomBloc(
                  configuration: cfg,
                  diagramRect: controller.logicalExtent,
                  viewportSize: const Size(800, 600),
                ),
              ),
            ],
            child: Builder(builder: (context) {
              // Initialize bounds
              final transformBloc = context.read<TransformBloc>();
              transformBloc.add(
                TransformEvent.updateDiagramBounds(
                  diagramRect: controller.logicalExtent,
                  viewportSize: const Size(800, 600),
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
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets('Ctrl+wheel min→max path does not introduce pan drift',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5, maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Zoom out to min first
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      for (int i = 0; i < 20; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, 120), // zoom out
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }
      final stateMin = transformBloc.state;
      final physCenterBefore =
          stateMin.transform.logicalToPhysical(stateMin.diagramRect.center);

      // Now go to max
      for (int i = 0; i < 40; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -120), // zoom in
            timeStamp: Duration(milliseconds: 400 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      // Viewport center should remain stable for the logical center during zooming
      final stateMax = transformBloc.state;
      final physCenterAfter =
          stateMax.transform.logicalToPhysical(stateMax.diagramRect.center);
      expect((physCenterAfter - physCenterBefore).distance, lessThan(1e-3));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets('Ctrl+wheel at max zoom does not pan (center focal)',
        (tester) async {
      await tester.pumpWidget(_harness(maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();

      // Zoom to max first (center focal point)
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      // Use enough steps so 1.04^n reaches or exceeds maxZoom (4.0)
      for (int i = 0; i < 40; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -120), // zoom in
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      final atMaxScale = transformBloc.state.transform.scale;
      expect(atMaxScale, closeTo(4.0, 1e-6));
      final tx0 = transformBloc.state.transform.translation;

      // Further wheel-in ticks at max should NOT change translation (no pan drift)
      for (int i = 0; i < 10; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -120), // still trying to zoom in
            timeStamp: Duration(milliseconds: 400 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      final tx1 = transformBloc.state.transform.translation;
      expect((tx1 - tx0).distance, equals(0));

      // Cleanup key
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets('Ctrl+wheel at max zoom does not pan (off-center focal)',
        (tester) async {
      await tester.pumpWidget(_harness(maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();

      // Zoom to max first using center focal
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      // Use enough steps so 1.04^n reaches or exceeds maxZoom (4.0)
      for (int i = 0; i < 40; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -120), // zoom in
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      expect(transformBloc.state.transform.scale, closeTo(4.0, 1e-6));
      final tx0 = transformBloc.state.transform.translation;

      // Now try further zoom-in with an off-center focal point
      final topLeft = tester.getTopLeft(viewer) + const Offset(50, 50);
      for (int i = 0; i < 6; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: topLeft,
            scrollDelta: const Offset(0, -120),
            timeStamp: Duration(milliseconds: 400 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      final tx1 = transformBloc.state.transform.translation;
      expect((tx1 - tx0).distance, equals(0));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets(
        'Ctrl+wheel at min zoom does not pan and stays centered when content < viewport',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      // Zoom out to min first
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      for (int i = 0; i < 20; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, 120), // zoom out
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      final atMin = transformBloc.state.transform.scale;
      // Effective min is max(config.minZoom, scaleToFit)
      final state = transformBloc.state;
      final fitMin = Transform2DUtils.scaleToFit(
        contentRect: state.diagramRect,
        viewSize: state.viewportSize,
      );
      final effectiveMin = fitMin.clamp(0.5, double.infinity);
      expect(atMin, closeTo(effectiveMin, 1e-6));
      final tx0 = transformBloc.state.transform.translation;

      // Further wheel-out at min should not pan
      for (int i = 0; i < 6; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, 120),
            timeStamp: Duration(milliseconds: 400 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      final tx1 = transformBloc.state.transform.translation;
      expect((tx1 - tx0).distance, equals(0));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets(
        'Ctrl+wheel min→max burst: physical center drift < 1 px across sequence (center focal)',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5, maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Go to effective min first
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      for (int i = 0; i < 24; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, 160),
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      // Compute fitMin
      final state0 = transformBloc.state;
      final fitMin = Transform2DUtils.scaleToFit(
        contentRect: state0.diagramRect,
        viewSize: state0.viewportSize,
      );

      // Sample physical center positions while zooming from min to max
      final List<Offset> samples = [];
      for (int i = 0; i < 44; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -120), // zoom in
            timeStamp: Duration(milliseconds: 500 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
        final st = transformBloc.state;
        samples.add(
          st.transform.logicalToPhysical(st.diagramRect.center),
        );
      }

      // Verify max drift from first sample is < 1 px across the entire burst
      final origin = samples.first;
      double maxDrift = 0.0;
      for (final s in samples) {
        maxDrift = math.max(maxDrift, (s - origin).distance);
      }
      expect(maxDrift, lessThan(1.0));

      // Ensure we crossed fitMin during the burst
      final scales =
          samples.map((_) => transformBloc.state.transform.scale).toList();
      final crossedFit = scales.any((z) => z > fitMin + 1e-6);
      expect(crossedFit, isTrue);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets(
        'Ctrl+wheel min→max burst: center drift < 1 px with off-center pointer (top-left)',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5, maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final topLeft = tester.getTopLeft(viewer) + const Offset(10, 10);

      // Go to effective min first
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      for (int i = 0; i < 24; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: topLeft,
            scrollDelta: const Offset(0, 160),
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      // Sample physical center positions while zooming from min to max with off-center pointer
      final List<Offset> samples = [];
      for (int i = 0; i < 44; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: topLeft,
            scrollDelta: const Offset(0, -120), // zoom in
            timeStamp: Duration(milliseconds: 500 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
        final st = transformBloc.state;
        samples.add(
          st.transform.logicalToPhysical(st.diagramRect.center),
        );
      }

      final origin = samples.first;
      double maxDrift = 0.0;
      for (final s in samples) {
        maxDrift = math.max(maxDrift, (s - origin).distance);
      }
      expect(maxDrift, lessThan(1.0));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets(
        'Ctrl+wheel max→min burst: physical center drift < 1 px across sequence (center focal)',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5, maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Go to max first
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      for (int i = 0; i < 28; i++) {
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

      // Sample while zooming out to min; enforce stability only after crossing fitMin
      final List<Offset> smallSamples = [];
      bool crossedToSmall = false;
      for (int i = 0; i < 48; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, 120), // zoom out
            timeStamp: Duration(milliseconds: 500 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
        final st = transformBloc.state;
        final fitMin = Transform2DUtils.scaleToFit(
          contentRect: st.diagramRect,
          viewSize: st.viewportSize,
        );
        if (st.transform.scale <= fitMin + 1e-6) {
          crossedToSmall = true;
          smallSamples.add(
            st.transform.logicalToPhysical(st.diagramRect.center),
          );
        }
      }

      expect(crossedToSmall, isTrue);
      final origin = smallSamples.first;
      double maxDrift = 0.0;
      for (final s in smallSamples) {
        maxDrift = math.max(maxDrift, (s - origin).distance);
      }
      expect(maxDrift, lessThan(1.0));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets(
        'Ctrl+wheel max→min burst: center drift < 1 px with off-center pointer (top-right)',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5, maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final topRight = tester.getTopRight(viewer) - const Offset(10, -10);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      // Go to max using center first to avoid path-dependence in pointer pos
      final center = tester.getCenter(viewer);
      for (int i = 0; i < 28; i++) {
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

      final List<Offset> smallSamples = [];
      bool crossedToSmall = false;
      for (int i = 0; i < 48; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: topRight,
            scrollDelta: const Offset(0, 120), // zoom out
            timeStamp: Duration(milliseconds: 500 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
        final st = transformBloc.state;
        final fitMin = Transform2DUtils.scaleToFit(
          contentRect: st.diagramRect,
          viewSize: st.viewportSize,
        );
        if (st.transform.scale <= fitMin + 1e-6) {
          crossedToSmall = true;
          smallSamples
              .add(st.transform.logicalToPhysical(st.diagramRect.center));
        }
      }

      expect(crossedToSmall, isTrue);
      final origin = smallSamples.first;
      double maxDrift = 0.0;
      for (final s in smallSamples) {
        maxDrift = math.max(maxDrift, (s - origin).distance);
      }
      expect(maxDrift, lessThan(1.0));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });

    testWidgets(
        'Ctrl+wheel max→min burst: center drift < 1 px with off-center pointer (bottom-right)',
        (tester) async {
      await tester.pumpWidget(_harness(minZoom: 0.5, maxZoom: 4.0));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final bottomRight = tester.getBottomRight(viewer) - const Offset(10, 10);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      // Go to max using center first
      final center = tester.getCenter(viewer);
      for (int i = 0; i < 28; i++) {
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

      final List<Offset> smallSamples = [];
      bool crossedToSmall = false;
      for (int i = 0; i < 48; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: bottomRight,
            scrollDelta: const Offset(0, 120), // zoom out
            timeStamp: Duration(milliseconds: 500 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
        final st = transformBloc.state;
        final fitMin = Transform2DUtils.scaleToFit(
          contentRect: st.diagramRect,
          viewSize: st.viewportSize,
        );
        if (st.transform.scale <= fitMin + 1e-6) {
          crossedToSmall = true;
          smallSamples
              .add(st.transform.logicalToPhysical(st.diagramRect.center));
        }
      }

      expect(crossedToSmall, isTrue);
      final origin = smallSamples.first;
      double maxDrift = 0.0;
      for (final s in smallSamples) {
        maxDrift = math.max(maxDrift, (s - origin).distance);
      }
      expect(maxDrift, lessThan(1.0));

      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });
  });
}
