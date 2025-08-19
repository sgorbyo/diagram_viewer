import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('Classic wheel pan: no overscroll and no bounce', () {
    late MockDiagramController controller;

    Widget harness({Size viewport = const Size(800, 600)}) {
      const cfg = DiagramConfiguration(
        showSnapGrid: false,
        enableInertialScrolling: true,
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
                  diagramRect: controller.logicalExtent,
                  viewportSize: viewport,
                ),
              ),
            ],
            child: Builder(builder: (context) {
              final tBloc = context.read<TransformBloc>();
              tBloc.add(TransformEvent.updateDiagramBounds(
                diagramRect: controller.logicalExtent,
                viewportSize: viewport,
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
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets(
        'Large coarse wheel bursts stay within strict bounds and stable',
        (tester) async {
      await tester.pumpWidget(harness());
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      final t0 = transformBloc.state.transform;

      // Emit coarse classic-wheel-like scroll deltas (vertical and horizontal)
      for (int i = 0; i < 6; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(0, -40), // coarse
            timeStamp: Duration(milliseconds: 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }
      for (int i = 0; i < 6; i++) {
        tester.binding.handlePointerEvent(
          PointerScrollEvent(
            position: center,
            scrollDelta: const Offset(40, 0), // coarse
            timeStamp: Duration(milliseconds: 200 + 16 * i),
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump(const Duration(milliseconds: 1));
      }

      // Check translation within strict legal ranges (no elastic window)
      final st = transformBloc.state;
      final scale = st.transform.scale;
      final (minX, maxX) = Transform2DUtils.legalTranslationRangeX(
        scale: scale,
        diagramRect: st.diagramRect,
        viewportSize: st.viewportSize,
        dynamic: false,
        preserveCentering: true,
        recenterSmallContent: false,
        currentY: st.transform.translation.dy,
      );
      final (minY, maxY) = Transform2DUtils.legalTranslationRangeY(
        scale: scale,
        diagramRect: st.diagramRect,
        viewportSize: st.viewportSize,
        dynamic: false,
        preserveCentering: true,
        recenterSmallContent: false,
        currentX: st.transform.translation.dx,
      );

      expect(st.transform.translation.dx, inInclusiveRange(minX, maxX));
      expect(st.transform.translation.dy, inInclusiveRange(minY, maxY));

      // No inertia nor bounce should move it further after idle
      final beforeIdle = st.transform.translation;
      await tester.pump(const Duration(milliseconds: 250));
      final afterIdle = transformBloc.state.transform.translation;
      expect(afterIdle, equals(beforeIdle));

      // Sanity: since classic wheel is forwarded to controller (no internal pan),
      // the viewer transform is unchanged w.r.t. initial
      expect((afterIdle - t0.translation).distance, equals(0));
    });
  });
}
