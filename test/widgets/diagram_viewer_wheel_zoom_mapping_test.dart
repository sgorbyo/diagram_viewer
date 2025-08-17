import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('Wheel + modifier maps to zoom (TDD)', () {
    late MockDiagramController controller;

    setUp(() {
      controller = MockDiagramController();
    });

    tearDown(() {
      controller.dispose();
    });

    Widget _harness() {
      final cfg = const DiagramConfiguration(
        showSnapGrid: false,
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

    testWidgets('Ctrl+wheel zooms (scale changes), default wheel sends scroll',
        (tester) async {
      // Arrange
      await tester.pumpWidget(_harness());
      await tester.pumpAndSettle();

      final transformBloc = tester
          .element(find.byType(DiagramViewerContent))
          .read<TransformBloc>();
      final initialScale = transformBloc.state.transform.scale;

      // Act 1: default wheel (no modifiers) should forward scroll to controller and not change scale
      tester.binding.handlePointerEvent(
        const PointerScrollEvent(
          position: Offset(400, 300),
          scrollDelta: Offset(0, 40),
          timeStamp: Duration.zero,
          kind: PointerDeviceKind.mouse,
        ),
      );
      await tester.pump();

      // Assert default: controller received a scroll; scale unchanged
      expect(controller.hasReceivedEvents, isTrue);
      final afterDefaultScale = transformBloc.state.transform.scale;
      expect(afterDefaultScale, equals(initialScale));
      int defaultScrollCount = controller.receivedEvents
          .where((e) => e.maybeWhen(scroll: (_) => true, orElse: () => false))
          .length;

      // Act 2: press Ctrl and scroll up (negative dy) to zoom in
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
      tester.binding.handlePointerEvent(
        const PointerScrollEvent(
          position: Offset(400, 300),
          scrollDelta: Offset(0, -40),
          timeStamp: Duration(milliseconds: 16),
          kind: PointerDeviceKind.mouse,
        ),
      );
      await tester.pump();

      // Assert: scale increased, and no additional scroll event forwarded to controller
      final zoomedScale = transformBloc.state.transform.scale;
      expect(zoomedScale, greaterThan(afterDefaultScale));
      final afterCtrlScrollCount = controller.receivedEvents
          .where((e) => e.maybeWhen(scroll: (_) => true, orElse: () => false))
          .length;
      expect(afterCtrlScrollCount, equals(defaultScrollCount));

      // Cleanup key
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    });
  });
}
