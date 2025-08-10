import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Tests for Magic Mouse scroll functionality
/// These tests should fail initially and pass after fixing the implementation
void main() {
  group('Magic Mouse Scroll Tests', () {
    late MockDiagramController mockController;
    late List<DiagramObjectEntity> testObjects;

    setUp(() {
      mockController = MockDiagramController();
      testObjects = [
        TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 50, 50),
          color: Colors.red,
          id: 'test-1',
        ),
        TestDiagramObject(
          bounds: const Rect.fromLTWH(200, 200, 50, 50),
          color: Colors.blue,
          id: 'test-2',
        ),
      ];
      mockController.addObject(testObjects[0]);
      mockController.addObject(testObjects[1]);
    });

    tearDown(() {
      mockController.dispose();
    });

    // Helper method to extract scroll events
    List<DiagramScroll> extractScrollEvents() {
      return mockController.receivedEvents
          .where((event) => event.maybeWhen(
                scroll: (_) => true,
                orElse: () => false,
              ))
          .map((event) => event.maybeWhen(
                scroll: (scrollEvent) => scrollEvent,
                orElse: () => throw Exception('Not a scroll event'),
              ))
          .toList();
    }

    group('Magic Mouse Scroll Detection', () {
      testWidgets('should detect Magic Mouse scroll events',
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

        // Act - Simulate Magic Mouse scroll (PointerScrollEvent)
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(100, 100),
            scrollDelta: Offset(0, 50), // Scroll down
            timeStamp: Duration.zero,
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump();

        // Assert - Should receive scroll event
        expect(mockController.hasReceivedEvents, isTrue);
        final scrollEvents = extractScrollEvents();
        expect(scrollEvents, hasLength(1));
      });

      testWidgets('should handle vertical Magic Mouse scroll correctly',
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

        // Act - Simulate vertical Magic Mouse scroll
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(100, 100),
            scrollDelta: Offset(0, 30), // Scroll down
            timeStamp: Duration.zero,
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump();

        // Assert - Should receive scroll event with correct delta
        final scrollEvents = extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(scrollEvents.first.scrollDelta, equals(30.0));
        expect(scrollEvents.first.scrollDirection, equals(const Offset(0, 1)));
      });

      testWidgets('should handle horizontal Magic Mouse scroll correctly',
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

        // Act - Simulate horizontal Magic Mouse scroll
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(100, 100),
            scrollDelta: Offset(25, 0), // Scroll right
            timeStamp: Duration.zero,
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump();

        // Assert - Should receive scroll event with correct delta
        final scrollEvents = extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(scrollEvents.first.scrollDelta, equals(25.0));
        expect(scrollEvents.first.scrollDirection, equals(const Offset(1, 0)));
      });
    });

    group('Magic Mouse Scroll Direction', () {
      testWidgets('should scroll down when Magic Mouse scrolls down',
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

        // Act - Simulate Magic Mouse scroll down
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(100, 100),
            scrollDelta: Offset(0, 40), // Scroll down
            timeStamp: Duration.zero,
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump();

        // Assert - Should scroll down (positive Y direction)
        final scrollEvents = extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(scrollEvents.first.scrollDirection.dy, greaterThan(0));
      });

      testWidgets('should scroll up when Magic Mouse scrolls up',
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

        // Act - Simulate Magic Mouse scroll up
        tester.binding.handlePointerEvent(
          const PointerScrollEvent(
            position: Offset(100, 100),
            scrollDelta: Offset(0, -35), // Scroll up
            timeStamp: Duration.zero,
            kind: PointerDeviceKind.mouse,
          ),
        );
        await tester.pump();

        // Assert - Should scroll up (negative Y direction)
        final scrollEvents = extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(scrollEvents.first.scrollDirection.dy, lessThan(0));
      });
    });
  });
}
