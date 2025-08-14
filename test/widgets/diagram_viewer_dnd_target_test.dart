import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import 'package:diagram_viewer/events/events.dart';

/// Minimal controller for probing DnD DiagramEvents and sending no commands
class DnDProbeController implements IDiagramController {
  final StreamController<DiagramCommand> _commandCtrl =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<DiagramEventUnion> _eventCtrl =
      StreamController<DiagramEventUnion>.broadcast();

  final List<DiagramEventUnion> receivedEvents = [];

  DnDProbeController() {
    _eventCtrl.stream.listen(receivedEvents.add);
  }

  @override
  Stream<DiagramCommand> get commandStream => _commandCtrl.stream;

  @override
  Sink<DiagramEventUnion> get eventsSink => _eventCtrl.sink;

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();

  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 1000, 1000);

  @override
  List<DiagramObjectEntity> get objects => const [];

  @override
  void dispose() {
    _commandCtrl.close();
    _eventCtrl.close();
  }
}

void main() {
  group('In-App DnD Target', () {
    late EventManagementBloc eventBloc;
    late TransformBloc transformBloc;
    late ZoomBloc zoomBloc;
    late PanBloc panBloc;
    late DnDProbeController controller;

    setUp(() {
      eventBloc = EventManagementBloc();
      transformBloc =
          TransformBloc(configuration: const DiagramConfiguration());
      zoomBloc = ZoomBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000),
        viewportSize: const Size(800, 600),
      );
      panBloc = PanBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000),
        viewportSize: const Size(800, 600),
      );
      controller = DnDProbeController();
    });

    tearDown(() {
      controller.dispose();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
    });

    Widget buildHarness({DiagramConfiguration? config}) {
      return MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              // Viewer as full-screen target
              MultiBlocProvider(
                providers: [
                  BlocProvider<EventManagementBloc>.value(value: eventBloc),
                  BlocProvider<TransformBloc>.value(value: transformBloc),
                  BlocProvider<ZoomBloc>.value(value: zoomBloc),
                  BlocProvider<PanBloc>.value(value: panBloc),
                ],
                child: DiagramViewerContent(
                  controller: controller,
                  configuration: config ?? const DiagramConfiguration(),
                  debug: false,
                ),
              ),
              // Draggable source in front for test convenience
              const Positioned(
                left: 20,
                top: 20,
                child: Draggable<Map<String, dynamic>>(
                  data: {'type': 'ghost', 'color': 'blue'},
                  feedback: SizedBox(
                      width: 20,
                      height: 20,
                      child: ColoredBox(color: Colors.blue)),
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: ColoredBox(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    testWidgets('shows ghost overlay and emits enter/over/leave/drop sequence',
        (tester) async {
      await tester.pumpWidget(buildHarness());
      await tester.pumpAndSettle();

      final draggableFinder = find.byType(Draggable<Map<String, dynamic>>);
      expect(draggableFinder, findsOneWidget);

      // Ensure the viewer is present in the tree
      final viewerFinder = find.byType(DiagramViewerContent);
      expect(viewerFinder, findsOneWidget);

      // Start drag from the draggable and move into viewer center
      final start = tester.getCenter(draggableFinder);
      final viewerCenter = tester.getCenter(viewerFinder);
      final gesture = await tester.startGesture(start);
      await gesture.moveTo(viewerCenter);
      await tester.pump();

      // Overlay ghost attivo entro 1 frame
      expect(find.byKey(const ValueKey('drag_ghost_overlay_inner')),
          findsOneWidget);

      // We should have an Enter followed by at least one Over
      final hasEnter = controller.receivedEvents.any((e) => e.maybeWhen(
            dragTargetEnter: (_, __, ___, ____, _____, ______) => true,
            orElse: () => false,
          ));
      expect(hasEnter, isTrue);
      final hasOver = controller.receivedEvents.any((e) => e.maybeWhen(
            dragTargetOver: (_, __, ___, ____, _____, ______, _______) => true,
            orElse: () => false,
          ));
      expect(hasOver, isTrue);

      // Drop inside viewer
      await gesture.up();
      await tester.pump();

      final hasDrop = controller.receivedEvents.any((e) => e.maybeWhen(
            dragTargetDrop: (_, __, ___, ____, _____, ______, _______) => true,
            orElse: () => false,
          ));
      expect(hasDrop, isTrue);

      // Overlay hidden dopo drop
      expect(
          find.byKey(const ValueKey('drag_ghost_overlay_inner')), findsNothing);
    });

    testWidgets('maps screen→local→logical correctly under transform',
        (tester) async {
      await tester.pumpWidget(buildHarness());
      await tester.pump();

      // Apply a non-trivial transform
      transformBloc.add(const TransformEvent.updateTransform(
        transform: Transform2D(scale: 2.0, translation: Offset(30, 40)),
      ));
      await tester.pump();

      // Ensure viewer is in the tree
      expect(find.byType(DiagramViewerContent), findsOneWidget);

      // Start drag and move to a known global point inside viewer
      final draggableFinder = find.byType(Draggable<Map<String, dynamic>>);
      final start = tester.getCenter(draggableFinder);
      const targetGlobal = Offset(200, 150);
      final gesture = await tester.startGesture(start);
      await gesture.moveTo(targetGlobal);
      await tester.pump();

      // Find last Over event and verify logicalPosition
      final overEvents = controller.receivedEvents.where((e) => e.maybeWhen(
            dragTargetOver: (a, b, c, d, e, f, g) => true,
            orElse: () => false,
          ));
      expect(overEvents, isNotEmpty);
      final lastOver = overEvents.last;

      // Extract values
      late Offset screenPosition;
      late Offset logicalPosition;
      late Transform2D snapshot;
      lastOver.when(
        dragTargetOver: (eventId, dataPreview, screenPos, logicalPos,
            transformSnapshot, timestamp, snapped) {
          screenPosition = screenPos;
          logicalPosition = logicalPos;
          snapshot = transformSnapshot;
        },
        // Unused branches
        tap: (_) => null,
        doubleTap: (_) => null,
        longPress: (_) => null,
        scroll: (_) => null,
        dragBegin: (_) => null,
        dragContinue: (_) => null,
        dragEnd: (_) => null,
        pinchBegin: (_) => null,
        pinchContinue: (_) => null,
        pinchEnd: (_) => null,
        dragTargetEnter: (a, b, c, d, e, f) => null,
        dragTargetLeave: (a, b, c) => null,
        dragTargetDrop: (a, b, c, d, e, f, g) => null,
      );

      // Validate mapping by round-tripping: logical→physical equals viewer local
      final renderBox =
          tester.renderObject(find.byType(DiagramViewerContent)) as RenderBox;
      final localFromScreen = renderBox.globalToLocal(screenPosition);
      final physicalFromLogical = snapshot.logicalToPhysical(logicalPosition);
      expect((physicalFromLogical - localFromScreen).distance, lessThan(0.01));

      await gesture.up();
    });
  });
}
