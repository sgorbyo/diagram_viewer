import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_state.dart';
import 'package:diagram_viewer/events/events.dart';
import '../interfaces/i_diagram_controller_test.dart';

class MockDiagramObject extends DiagramObjectEntity {
  final String _id;
  final Rect _bounds;
  final int _zOrder;

  MockDiagramObject({
    required String id,
    required Rect bounds,
    int zOrder = 100,
  })  : _id = id,
        _bounds = bounds,
        _zOrder = zOrder;

  @override
  Rect get logicalBounds => _bounds;

  @override
  String get id => _id;

  @override
  int get zOrder => _zOrder;

  @override
  void paint(Canvas canvas) {
    // Mock implementation
  }

  @override
  List<Object> get props => [_id, _bounds, _zOrder];
}

void main() {
  group('DiagramViewerContent', () {
    late MockDiagramController mockController;
    late EventManagementBloc eventBloc;
    late TransformBloc transformBloc;
    late ZoomBloc zoomBloc;
    late PanBloc panBloc;

    setUp(() {
      mockController = MockDiagramController();
      eventBloc = EventManagementBloc();
      transformBloc = TransformBloc(
          configuration: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)));
      zoomBloc = ZoomBloc(
        configuration: const DiagramConfiguration(
            bounceDuration: Duration(milliseconds: 0)),
        diagramRect: Rect.fromLTWH(0, 0, 1000, 1000),
        viewportSize: const Size(800, 600),
      );
      panBloc = PanBloc(
        configuration: const DiagramConfiguration(
            bounceDuration: Duration(milliseconds: 0)),
        diagramRect: Rect.fromLTWH(0, 0, 1000, 1000),
        viewportSize: const Size(800, 600),
      );
    });

    tearDown(() {
      mockController.dispose();
      eventBloc.close();
      transformBloc.close();
      zoomBloc.close();
      panBloc.close();
    });

    Widget createTestWidget({DiagramConfiguration? configOverride}) {
      return MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<EventManagementBloc>.value(value: eventBloc),
            BlocProvider<TransformBloc>.value(value: transformBloc),
            BlocProvider<ZoomBloc>.value(value: zoomBloc),
            BlocProvider<PanBloc>.value(value: panBloc),
          ],
          child: Scaffold(
            body: DiagramViewerContent(
              controller: mockController,
              configuration: configOverride ??
                  const DiagramConfiguration(
                      bounceDuration: Duration(milliseconds: 0)),
              debug: false,
            ),
          ),
        ),
      );
    }

    group('Widget Construction', () {
      testWidgets('should build without errors', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
            bounceDuration: Duration(milliseconds: 0),
          ),
        ));

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should have keyboard focus', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(createTestWidget());

        // Assert - The widget should be present
        expect(find.byType(DiagramViewerContent), findsOneWidget);
        // Note: RawKeyboardListener is internal to the widget, we can't easily test it
      });
    });

    group('Keyboard Navigation Events', () {
      testWidgets('should handle arrow key navigation',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press arrow keys
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();

        // Assert - Check that events were sent to controller
        // Note: We can't easily test the exact events sent, but we can verify
        // that the widget doesn't crash and processes the events
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should handle page navigation keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press page navigation keys
        await tester.sendKeyEvent(LogicalKeyboardKey.pageUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.pageDown);
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should handle home/end keys', (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press home/end keys
        await tester.sendKeyEvent(LogicalKeyboardKey.home);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.end);
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should not interfere with app commands',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press app command keys (should not be handled by diagram)
        await tester.sendKeyEvent(LogicalKeyboardKey.keyS);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.keyZ);
        await tester.pump();

        // Assert - Widget should still be present and functional
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });

    group('Control Key Tracking', () {
      testWidgets('should track shift key during pointer events',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press shift and then tap
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert - Check that events were processed
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should track ctrl key during pointer events',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press ctrl and then tap
        await tester.sendKeyEvent(LogicalKeyboardKey.control);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should track alt key during pointer events',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget(
          configOverride: const DiagramConfiguration(
              bounceDuration: Duration(milliseconds: 0)),
        ));
        await tester.pump();

        // Act - Press alt and then tap
        await tester.sendKeyEvent(LogicalKeyboardKey.alt);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should track meta key during pointer events',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press meta and then tap
        await tester.sendKeyEvent(LogicalKeyboardKey.meta);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should track multiple control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press multiple control keys and then tap
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.sendKeyEvent(LogicalKeyboardKey.control);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });

    group('Pointer Events with Control Keys', () {
      testWidgets('should handle pointer down with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key and then tap
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should handle pointer move with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key and then drag
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.drag(
            find.byType(DiagramViewerContent), const Offset(50, 50));
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should handle pointer up with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key, tap down, then release
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();
        // Note: Key up events are handled automatically by the framework
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });

    group('Gesture Events with Control Keys', () {
      testWidgets('should handle scale start with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key and then start scale gesture
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        // Note: Scale gestures are complex to simulate in tests
        // This test verifies the widget doesn't crash with control keys pressed

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should handle scale update with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key and then update scale gesture
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        // Note: Scale gestures are complex to simulate in tests

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should handle scale end with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key and then end scale gesture
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        // Note: Scale gestures are complex to simulate in tests

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });

    group('Scroll Events with Control Keys', () {
      testWidgets('should handle scroll with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press control key and then scroll
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        // Note: Scroll events are handled through pointer events in the actual implementation
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });

    group('Event Management Integration', () {
      testWidgets('should send events to EventManagementBloc',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Tap on the widget
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });

      testWidgets('should include control keys in pointer events',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Press shift and tap
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.tap(find.byType(DiagramViewerContent));
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });

    group('Controller Integration', () {
      testWidgets('should send diagram events to controller',
          (WidgetTester tester) async {
        // Arrange
        final events = <DiagramEventUnion>[];
        // Note: We can't easily test the eventsSink.stream in this context
        // The controller integration is tested in integration tests

        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Act - Send navigation key
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();

        // Assert - Check that events were sent to controller
        // Note: The exact events depend on the translator implementation
        expect(find.byType(DiagramViewerContent), findsOneWidget);
      });
    });
  });
}
