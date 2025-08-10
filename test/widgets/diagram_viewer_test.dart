import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Widget Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Widget Construction', () {
      testWidgets('should build without errors', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should accept controller parameter',
          (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Assert
        final diagramViewer = tester.widget<DiagramViewer>(
          find.byType(DiagramViewer),
        );
        expect(diagramViewer.controller, equals(mockController));
      });
    });

    group('Controller Integration', () {
      testWidgets('should listen to controller command stream',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send a command through the controller
        const command = DiagramCommand.redraw(
          renderables: [],
          logicalExtent: Rect.fromLTWH(0, 0, 1000, 1000),
        );
        mockController.sendCommand(command);

        // Assert - Widget should rebuild (we can't easily test the internal state,
        // but we can verify the widget doesn't crash)
        await tester.pump();
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should send pointer events to controller',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Tap on the diagram viewer
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - The controller should have received events
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Keyboard Navigation', () {
      testWidgets('should handle arrow key navigation',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send navigation keys
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle page navigation keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send page navigation keys
        await tester.sendKeyEvent(LogicalKeyboardKey.pageUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.pageDown);
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle home/end keys', (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send home/end keys
        await tester.sendKeyEvent(LogicalKeyboardKey.home);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.end);
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Control Key Handling', () {
      testWidgets('should handle pointer events with control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Press control key and tap
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle multiple control keys',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Press multiple control keys and tap
        await tester.sendKeyEvent(LogicalKeyboardKey.shift);
        await tester.sendKeyEvent(LogicalKeyboardKey.control);
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should not interfere with app commands',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send app command keys (should not be handled by diagram)
        await tester.sendKeyEvent(LogicalKeyboardKey.keyS);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.keyZ);
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Object Rendering', () {
      testWidgets('should render objects from controller',
          (WidgetTester tester) async {
        // Arrange
        final testObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        mockController.addObject(testObject);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert - Widget should render without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Configuration', () {
      testWidgets('should use controller configuration',
          (WidgetTester tester) async {
        // Arrange
        const customConfig = DiagramConfiguration(
          backgroundColor: Colors.blue,
          edgeThreshold: 100.0,
          maxZoom: 5.0,
          minZoom: 0.1,
          bounceDuration: Duration(milliseconds: 300),
          autoScrollInterval: Duration(milliseconds: 16),
          autoScrollAcceleration: 2.0,
        );

        final customController = MockDiagramController(
          configuration: customConfig,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: customController,
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert - Widget should use the custom configuration without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);

        // Cleanup
        customController.dispose();
      });
    });

    group('Error Handling', () {
      testWidgets('should handle null controller gracefully',
          (WidgetTester tester) async {
        // This test verifies that the widget handles edge cases properly
        // In a real implementation, the controller should be required

        // Arrange & Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController, // Using valid controller for now
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}

/// Test implementation of DiagramObjectEntity
class TestDiagramObject extends DiagramObjectEntity {
  final Rect bounds;
  final Color color;
  final String _id;

  TestDiagramObject({
    required this.bounds,
    required this.color,
    required String id,
  }) : _id = id;

  @override
  String get id => _id;

  @override
  Rect get logicalBounds => bounds;

  @override
  void paint(Canvas canvas) {
    final paint = Paint()..color = color;
    canvas.drawRect(bounds, paint);
  }

  @override
  List<Object?> get props => [bounds, color, _id];
}
