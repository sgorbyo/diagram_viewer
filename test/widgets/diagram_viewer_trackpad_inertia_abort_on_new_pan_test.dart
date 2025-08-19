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
  group('Trackpad: new two-finger pan aborts ongoing inertia', () {
    late MockDiagramController controller;

    Widget harness({required Rect extent}) {
      const cfg = DiagramConfiguration(
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

    testWidgets('New two-finger pan during inertia reverses immediately',
        (tester) async {
      await tester.pumpWidget(harness(extent: controller.logicalExtent));
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final viewer = find.byType(DiagramViewerContent);
      final center = tester.getCenter(viewer);

      // Burst A: two-finger pan right
      final g1 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g1.down(center + const Offset(-20, -20));
      final g2 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g2.down(center + const Offset(20, 20));
      for (int i = 0; i < 12; i++) {
        await g1.moveBy(const Offset(6, 0));
        await g2.moveBy(const Offset(6, 0));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g1.up();
      await g2.up();

      final _ = transformBloc.state.transform.translation;
      await tester.pump(const Duration(milliseconds: 100));
      final tInertia = transformBloc.state.transform.translation;

      // Burst B: opposite direction (left) while inertia from A may still be running
      final g3 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g3.down(center + const Offset(-22, -22));
      final g4 = await tester.createGesture(kind: PointerDeviceKind.touch);
      await g4.down(center + const Offset(22, 22));
      for (int i = 0; i < 4; i++) {
        await g3.moveBy(const Offset(-8, 0));
        await g4.moveBy(const Offset(-8, 0));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g3.up();
      await g4.up();

      final tAfter = transformBloc.state.transform.translation;
      // Immediate reversal expected (abort prior inertia)
      expect(tAfter.dx, lessThan(tInertia.dx - 2.0));

      await tester.pump(const Duration(milliseconds: 60));
      final tAfter2 = transformBloc.state.transform.translation;
      expect(tAfter2.dx, lessThanOrEqualTo(tAfter.dx + 1.0));
    });
  });
}
