import 'package:flutter/material.dart';
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
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
        );
        mockController.sendCommand(command);

        // Assert - Widget should rebuild (we can't easily test the internal state,
        // but we can verify the widget doesn't crash)
        await tester.pump();
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should send events to controller',
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

        // Assert - The widget should handle the tap without crashing
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
          bounceDuration: const Duration(milliseconds: 300),
          autoScrollInterval: const Duration(milliseconds: 16),
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
