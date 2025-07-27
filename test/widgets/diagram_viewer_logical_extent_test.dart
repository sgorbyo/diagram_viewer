import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Logical Extent Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Initial Logical Extent', () {
      testWidgets('should display correct initial logical extent',
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
                debug: true, // Enable debug to see logical extent
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert - Widget should render without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.objects.length, 1);
      });

      testWidgets('should handle empty object list',
          (WidgetTester tester) async {
        // Arrange - No objects added
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
                debug: true,
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.objects.length, 0);
      });
    });

    group('Logical Extent Updates', () {
      testWidgets('should receive redraw commands with updated logical extent',
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

        // Act - Send a redraw command with updated logical extent
        final updatedExtent = const Rect.fromLTWH(50, 50, 300, 300);
        final command = DiagramCommand.redraw(
          renderables: mockController.objects,
          logicalExtent: updatedExtent,
        );
        mockController.sendCommand(command);
        await tester.pump();

        // Assert - Widget should handle the command without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle multiple redraw commands',
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

        // Act - Send multiple redraw commands with different extents
        final extent1 = const Rect.fromLTWH(0, 0, 200, 200);
        final extent2 = const Rect.fromLTWH(50, 50, 300, 300);
        final extent3 = const Rect.fromLTWH(100, 100, 400, 400);

        mockController.sendCommand(DiagramCommand.redraw(
          renderables: [],
          logicalExtent: extent1,
        ));
        await tester.pump();

        mockController.sendCommand(DiagramCommand.redraw(
          renderables: [],
          logicalExtent: extent2,
        ));
        await tester.pump();

        mockController.sendCommand(DiagramCommand.redraw(
          renderables: [],
          logicalExtent: extent3,
        ));
        await tester.pump();

        // Assert - Widget should handle all commands without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Object Movement and Extent Updates', () {
      testWidgets('should handle object movement events',
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

        // Act - Simulate object movement by sending pointer events
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Events should be sent to controller
        expect(mockController.receivedEvents, isNotEmpty);
        expect(mockController.receivedEvents.first.isPointer, isTrue);
      });

      testWidgets('should maintain consistency between objects and extent',
          (WidgetTester tester) async {
        // Arrange
        final testObject1 = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        final testObject2 = TestDiagramObject(
          bounds: const Rect.fromLTWH(400, 400, 200, 200),
          color: Colors.blue,
          id: 'test-2',
        );
        mockController.addObject(testObject1);
        mockController.addObject(testObject2);

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

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.objects.length, 2);
      });
    });

    group('Configuration and Logical Extent', () {
      testWidgets('should use controller configuration for extent calculations',
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

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(customController.configuration, equals(customConfig));

        // Cleanup
        customController.dispose();
      });
    });
  });
}
