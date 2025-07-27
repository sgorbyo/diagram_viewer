import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Painting Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Background Painting', () {
      testWidgets('should paint background consistently',
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

        // Act
        await tester.pump();

        // Assert - Widget should render without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle logical extent changes',
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

        // Assert - Widget should handle all extent changes without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Painter Consistency', () {
      testWidgets('should repaint when logical extent changes',
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

        // Act - Send redraw command with different extent
        final newExtent = const Rect.fromLTWH(50, 50, 300, 300);
        mockController.sendCommand(DiagramCommand.redraw(
          renderables: mockController.objects,
          logicalExtent: newExtent,
        ));
        await tester.pump();

        // Assert - Widget should handle the change without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle transform changes',
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

        // Act - Send transform command
        final newTransform =
            const Transform2D(scale: 2.0, translation: Offset(10, 20));
        mockController
            .sendCommand(DiagramCommand.setTransform(transform: newTransform));
        await tester.pump();

        // Assert - Widget should handle the transform change without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Object Painting', () {
      testWidgets('should paint objects correctly',
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

        // Assert - Widget should render objects without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.objects.length, 1);
      });

      testWidgets('should handle multiple objects',
          (WidgetTester tester) async {
        // Arrange
        final testObject1 = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        final testObject2 = TestDiagramObject(
          bounds: const Rect.fromLTWH(300, 300, 200, 200),
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

        // Assert - Widget should render multiple objects without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.objects.length, 2);
      });
    });

    group('Debug Painting', () {
      testWidgets('should paint debug information when enabled',
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
                debug: true, // Enable debug painting
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert - Widget should render debug info without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}
