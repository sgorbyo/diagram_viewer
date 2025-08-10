import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
// Removed unused import
import '../interfaces/i_diagram_controller_test.dart';

/// Tests for keyboard direction issues
/// These tests should fail initially and pass after fixing the implementation
void main() {
  group('Keyboard Direction Tests', () {
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
    List<DiagramScroll> _extractScrollEvents() {
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

    group('Controller Keyboard Response Tests', () {
      test('should handle arrow up keyboard event correctly', () async {
        // Arrange - Create a keyboard scroll event
        final keyboardScrollEvent = DiagramEventUnion.scroll(
          DiagramScroll(
            eventId: 'test-1',
            logicalPosition: Offset.zero,
            screenPosition: Offset.zero,
            transformSnapshot: const Transform2D(
                scale: 1.0, translation: Offset.zero, rotation: 0.0),
            hitList: [],
            timestamp: Duration.zero,
            metadata: {
              'source': 'keyboard',
              'pressedKeys': ['Arrow Up'],
            },
            scrollDelta: 50.0,
            scrollVelocity: 0.0,
            scrollDuration: Duration.zero,
            scrollDirection: const Offset(0, -1), // Should scroll up
            isInertial: false,
            scrollCount: 1,
          ),
        );

        // Act - Send event to controller
        mockController.eventsSink.add(keyboardScrollEvent);

        // Wait for event processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Debug logging removed

        // Assert - Should receive the event
        expect(mockController.hasReceivedEvents, isTrue);
        final scrollEvents = _extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(scrollEvents.first.scrollDirection.dy,
            lessThan(0)); // Should scroll up
      });

      test('should handle arrow down keyboard event correctly', () async {
        // Arrange - Create a keyboard scroll event
        final keyboardScrollEvent = DiagramEventUnion.scroll(
          DiagramScroll(
            eventId: 'test-2',
            logicalPosition: Offset.zero,
            screenPosition: Offset.zero,
            transformSnapshot: const Transform2D(
                scale: 1.0, translation: Offset.zero, rotation: 0.0),
            hitList: [],
            timestamp: Duration.zero,
            metadata: {
              'source': 'keyboard',
              'pressedKeys': ['Arrow Down'],
            },
            scrollDelta: 50.0,
            scrollVelocity: 0.0,
            scrollDuration: Duration.zero,
            scrollDirection: const Offset(
                0, -1), // Should scroll up (view moves up, content moves down)
            isInertial: false,
            scrollCount: 1,
          ),
        );

        // Act - Send event to controller
        mockController.eventsSink.add(keyboardScrollEvent);

        // Wait for event processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Assert - Should receive the event
        expect(mockController.hasReceivedEvents, isTrue);
        final scrollEvents = _extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(
            scrollEvents.first.scrollDirection.dy,
            lessThan(
                0)); // Should scroll up (view moves up, content moves down)
      });

      test('should handle arrow left keyboard event correctly', () async {
        // Arrange - Create a keyboard scroll event
        final keyboardScrollEvent = DiagramEventUnion.scroll(
          DiagramScroll(
            eventId: 'test-3',
            logicalPosition: Offset.zero,
            screenPosition: Offset.zero,
            transformSnapshot: const Transform2D(
                scale: 1.0, translation: Offset.zero, rotation: 0.0),
            hitList: [],
            timestamp: Duration.zero,
            metadata: {
              'source': 'keyboard',
              'pressedKeys': ['Arrow Left'],
            },
            scrollDelta: 50.0,
            scrollVelocity: 0.0,
            scrollDuration: Duration.zero,
            scrollDirection: const Offset(1,
                0), // Should scroll right (view moves right, content moves left)
            isInertial: false,
            scrollCount: 1,
          ),
        );

        // Act - Send event to controller
        mockController.eventsSink.add(keyboardScrollEvent);

        // Wait for event processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Assert - Should receive the event
        expect(mockController.hasReceivedEvents, isTrue);
        final scrollEvents = _extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(
            scrollEvents.first.scrollDirection.dx,
            greaterThan(
                0)); // Should scroll right (view moves right, content moves left)
      });

      test('should handle arrow right keyboard event correctly', () async {
        // Arrange - Create a keyboard scroll event
        final keyboardScrollEvent = DiagramEventUnion.scroll(
          DiagramScroll(
            eventId: 'test-4',
            logicalPosition: Offset.zero,
            screenPosition: Offset.zero,
            transformSnapshot: const Transform2D(
                scale: 1.0, translation: Offset.zero, rotation: 0.0),
            hitList: [],
            timestamp: Duration.zero,
            metadata: {
              'source': 'keyboard',
              'pressedKeys': ['Arrow Right'],
            },
            scrollDelta: 50.0,
            scrollVelocity: 0.0,
            scrollDuration: Duration.zero,
            scrollDirection: const Offset(-1,
                0), // Should scroll left (view moves left, content moves right)
            isInertial: false,
            scrollCount: 1,
          ),
        );

        // Act - Send event to controller
        mockController.eventsSink.add(keyboardScrollEvent);

        // Wait for event processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Assert - Should receive the event
        expect(mockController.hasReceivedEvents, isTrue);
        final scrollEvents = _extractScrollEvents();
        expect(scrollEvents, hasLength(1));
        expect(
            scrollEvents.first.scrollDirection.dx,
            lessThan(
                0)); // Should scroll left (view moves left, content moves right)
      });
    });
  });
}
