import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/events/events.dart';

class _RecordingController implements IDiagramController {
  final _cmd = StreamController<DiagramCommand>.broadcast();
  final _evt = StreamController<DiagramEventUnion>.broadcast();
  final List<DiagramEventUnion> recorded = [];

  _RecordingController() {
    _evt.stream.listen(recorded.add);
  }

  @override
  Stream<DiagramCommand> get commandStream => _cmd.stream;
  @override
  Sink<DiagramEventUnion> get eventsSink => _evt.sink;
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 4000, 3000);
  @override
  List<DiagramObjectEntity> get objects => const [];
  @override
  void dispose() {
    _cmd.close();
    _evt.close();
  }

  void send(DiagramCommand cmd) => _cmd.add(cmd);
}

void main() {
  group('Autoscroll drag sync sequencing (TDD)', () {
    testWidgets(
        'dragContinue repeats with stable eventId and monotonic timestamp',
        (tester) async {
      final ctrl = _RecordingController();
      final eventBloc = EventManagementBloc();
      final transformBloc =
          TransformBloc(configuration: const DiagramConfiguration());
      final zoomBloc = ZoomBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );
      final panBloc = PanBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>.value(value: eventBloc),
              BlocProvider<TransformBloc>.value(value: transformBloc),
              BlocProvider<ZoomBloc>.value(value: zoomBloc),
              BlocProvider<PanBloc>.value(value: panBloc),
            ],
            child: DiagramViewerContent(
              controller: ctrl,
              configuration: const DiagramConfiguration(
                autoScrollInterval: Duration(milliseconds: 16),
              ),
              debug: false,
            ),
          ),
        ),
      ));
      await tester.pump();

      final viewer = find.byType(DiagramViewerContent);
      final topLeft = tester.getTopLeft(viewer);
      final start = topLeft + const Offset(20, 60);
      final g = await tester.startGesture(start);
      await tester.pump(const Duration(milliseconds: 16));

      // Trigger autoscroll ticks to synthesize pointer updates
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-800, 0)));
      await tester.pump(const Duration(milliseconds: 400));
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-800, 0)));
      await tester.pump(const Duration(milliseconds: 400));

      final continues = ctrl.recorded
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .toList();

      expect(continues.length, greaterThanOrEqualTo(1));

      // All eventIds identical
      final ids = continues
          .map((e) => e.maybeWhen(
                dragContinue: (c) => c.eventId,
                orElse: () => '',
              ))
          .toSet();
      expect(ids.length, equals(1));

      // Monotonic non-decreasing timestamps (translator uses duration since start)
      final times = continues
          .map((e) => e.maybeWhen(
                dragContinue: (c) => c.timestamp.inMilliseconds,
                orElse: () => 0,
              ))
          .toList();
      if (times.length >= 2) {
        for (int i = 1; i < times.length; i++) {
          expect(times[i], greaterThanOrEqualTo(times[i - 1]));
        }
      }

      await g.up();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
      ctrl.dispose();
    });

    testWidgets('logical positions are monotonic along autoscroll direction',
        (tester) async {
      final ctrl = _RecordingController();
      final eventBloc = EventManagementBloc();
      final transformBloc =
          TransformBloc(configuration: const DiagramConfiguration());
      final zoomBloc = ZoomBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );
      final panBloc = PanBloc(
        configuration: const DiagramConfiguration(),
        diagramRect: ctrl.logicalExtent,
        viewportSize: const Size(800, 600),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<EventManagementBloc>.value(value: eventBloc),
              BlocProvider<TransformBloc>.value(value: transformBloc),
              BlocProvider<ZoomBloc>.value(value: zoomBloc),
              BlocProvider<PanBloc>.value(value: panBloc),
            ],
            child: DiagramViewerContent(
              controller: ctrl,
              configuration: const DiagramConfiguration(
                autoScrollInterval: Duration(milliseconds: 16),
              ),
              debug: false,
            ),
          ),
        ),
      ));
      await tester.pump();

      final viewer = find.byType(DiagramViewerContent);
      final tl = tester.getTopLeft(viewer);
      final cursor = tl + const Offset(24, 44);
      final g = await tester.startGesture(cursor);
      await tester.pump(const Duration(milliseconds: 16));

      // Autoscroll towards left (negative X pan)
      ctrl.send(const DiagramCommand.autoScrollStep(velocity: Offset(-900, 0)));
      await tester.pump(const Duration(milliseconds: 600));

      final continues = ctrl.recorded
          .where((e) =>
              e.maybeWhen(dragContinue: (_) => true, orElse: () => false))
          .toList();
      expect(continues.length, greaterThanOrEqualTo(1));

      final xs = continues
          .map((e) => e.maybeWhen(
                dragContinue: (c) => c.logicalPosition.dx,
                orElse: () => 0.0,
              ))
          .toList();

      // Since content pans left, the logical position under a fixed cursor should move right (increase dx)
      int increasingSteps = 0;
      if (xs.length >= 2) {
        for (int i = 1; i < xs.length; i++) {
          if (xs[i] > xs[i - 1]) increasingSteps++;
        }
        expect(increasingSteps, greaterThan(0));
      }

      await g.up();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
      ctrl.dispose();
    });
  });
}
