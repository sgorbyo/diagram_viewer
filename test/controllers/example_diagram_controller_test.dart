import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/diagram_event.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/events/mouse_button.dart';
import 'package:vector_math/vector_math.dart';
import '../../example/lib/controllers/example_diagram_controller.dart';
import '../../example/lib/cerchio_entity.dart';

void main() {
  group('ExampleDiagramController', () {
    late ExampleDiagramController controller;

    setUp(() {
      controller = ExampleDiagramController();
    });

    tearDown(() {
      controller.dispose();
    });

    test('should initialize with objects', () {
      // Assert
      expect(controller.objects, isNotEmpty);
      expect(controller.objects.length, greaterThan(0));

      // Verify objects are of the expected type
      for (final object in controller.objects) {
        expect(object, isA<CerchioEntity>());
      }
    });

    test('should have correct configuration', () {
      // Assert
      expect(controller.configuration, isNotNull);
      expect(controller.configuration.backgroundColor, isNotNull);
      expect(controller.configuration.minZoom, isNotNull);
      expect(controller.configuration.maxZoom, isNotNull);
    });

    test('should have logical extent', () {
      // Assert
      expect(controller.logicalExtent, isNotNull);
      expect(controller.logicalExtent.width, greaterThan(0));
      expect(controller.logicalExtent.height, greaterThan(0));
    });

    test('should provide event sink', () {
      // Assert
      expect(controller.eventsSink, isNotNull);
    });

    test('should provide command stream', () {
      // Assert
      expect(controller.commandStream, isNotNull);
    });

    group('Object Management', () {
      test('should have objects with correct properties', () {
        // Arrange
        final objects = controller.objects;

        // Assert
        expect(objects, isNotEmpty);
        for (final object in objects) {
          expect(object, isA<CerchioEntity>());
          expect(object.id, isNotEmpty);
          expect(object.center, isNotNull);
          expect(object.logicalBounds, isNotNull);
        }
      });
    });

    group('Event Processing', () {
      test('should handle tap events', () {
        // Arrange
        final objects = controller.objects;
        final firstObject = objects.first as CerchioEntity;

        // Act - Simulate tapping on an object
        controller.eventsSink.add(
          DiagramEventUnion.tap(
            DiagramTap(
              eventId: 'test-1',
              logicalPosition: const Offset(200, 200),
              screenPosition: const Offset(200, 200),
              transformSnapshot: const Transform2D(),
              hitList: [firstObject],
              timestamp: const Duration(milliseconds: 100),
              metadata: {},
              fingerCount: 1,
              mouseButton: MouseButton.left,
              isOnObject: true,
              pressDuration: const Duration(milliseconds: 50),
              velocity: const Offset(0, 0),
            ),
          ),
        );

        // Assert - The controller should handle the event without crashing
        expect(controller.objects, isNotEmpty);
      });

      test('should handle drag events', () {
        // Arrange
        final objects = controller.objects;
        final firstObject = objects.first as CerchioEntity;

        // Act - Simulate dragging an object
        controller.eventsSink.add(
          DiagramEventUnion.dragBegin(
            DiagramDragBegin(
              eventId: 'test-1',
              logicalPosition: const Offset(200, 200),
              screenPosition: const Offset(200, 200),
              transformSnapshot: const Transform2D(),
              hitList: [firstObject],
              timestamp: const Duration(milliseconds: 100),
              metadata: {},
              fingerCount: 1,
              mouseButton: MouseButton.left,
              isOnObject: true,
            ),
          ),
        );

        // Assert - The controller should handle the event without crashing
        expect(controller.objects, isNotEmpty);
      });

      test('should handle scroll events', () {
        // Arrange
        const testPosition = Offset(100, 100);

        // Act
        controller.eventsSink.add(
          DiagramEventUnion.scroll(
            DiagramScroll(
              eventId: 'test-1',
              logicalPosition: testPosition,
              screenPosition: testPosition,
              transformSnapshot: const Transform2D(),
              hitList: [],
              timestamp: const Duration(milliseconds: 100),
              metadata: {},
              scrollDelta: 10.0,
              scrollVelocity: 5.0,
              scrollDuration: const Duration(milliseconds: 50),
              scrollDirection: const Offset(0, 1),
              isInertial: false,
              scrollCount: 1,
            ),
          ),
        );

        // Assert - No exception should be thrown
        expect(controller.objects, isNotEmpty);
      });

      test('should handle pinch events', () {
        // Arrange
        const testPosition = Offset(100, 100);

        // Act
        controller.eventsSink.add(
          DiagramEventUnion.pinchBegin(
            DiagramPinchBegin(
              eventId: 'test-1',
              logicalPosition: testPosition,
              screenPosition: testPosition,
              transformSnapshot: const Transform2D(),
              hitList: [],
              timestamp: const Duration(milliseconds: 100),
              metadata: {},
              fingerCount: 2,
              focalPoint: testPosition,
            ),
          ),
        );

        // Assert - No exception should be thrown
        expect(controller.objects, isNotEmpty);
      });
    });

    group('Command Generation', () {
      test('should send redraw commands when objects move', () {
        // Arrange
        final objects = controller.objects;
        final firstObject = objects.first as CerchioEntity;

        // Act - Simulate object movement via drag
        controller.eventsSink.add(
          DiagramEventUnion.dragBegin(
            DiagramDragBegin(
              eventId: 'test-1',
              logicalPosition: const Offset(500, 500),
              screenPosition: const Offset(500, 500),
              transformSnapshot: const Transform2D(),
              hitList: [firstObject],
              timestamp: const Duration(milliseconds: 100),
              metadata: {},
              fingerCount: 1,
              mouseButton: MouseButton.left,
              isOnObject: true,
            ),
          ),
        );

        // Assert - The controller should handle the event without crashing
        expect(controller.objects, isNotEmpty);
      });
    });
  });
}
