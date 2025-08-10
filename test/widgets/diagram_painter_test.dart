import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_painter.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

class MockDiagramObject extends DiagramObjectEntity {
  final String _id;
  final Rect _bounds;
  final int _zOrder;
  final bool _isVisible;

  MockDiagramObject({
    required String id,
    required Rect bounds,
    int zOrder = 100,
    bool isVisible = true,
  })  : _id = id,
        _bounds = bounds,
        _zOrder = zOrder,
        _isVisible = isVisible;

  @override
  Rect get logicalBounds => _bounds;

  @override
  String get id => _id;

  @override
  int get zOrder => _zOrder;

  @override
  bool get isVisible => _isVisible;

  @override
  void paint(Canvas canvas) {
    // Mock implementation - just verify the method is called
  }

  @override
  List<Object> get props => [_id, _bounds, _zOrder, _isVisible];
}

void main() {
  group('DiagramPainter', () {
    late Transform2D transform;
    late List<DiagramObjectEntity> objects;
    late Rect logicalExtent;
    late DiagramConfiguration configuration;

    setUp(() {
      transform = const Transform2D();
      objects = [
        MockDiagramObject(
          id: 'object1',
          bounds: const Rect.fromLTWH(0, 0, 100, 100),
          zOrder: 100,
        ),
        MockDiagramObject(
          id: 'object2',
          bounds: const Rect.fromLTWH(200, 200, 100, 100),
          zOrder: 200,
        ),
      ];
      logicalExtent = const Rect.fromLTWH(0, 0, 1000, 1000);
      configuration = const DiagramConfiguration();
    });

    group('Painter Construction', () {
      test('should create painter with required parameters', () {
        // Arrange & Act
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter, isNotNull);
        expect(painter.transform, equals(transform));
        expect(painter.objects, equals(objects));
        expect(painter.logicalExtent, equals(logicalExtent));
        expect(painter.configuration, equals(configuration));
        expect(painter.debug, isFalse);
      });

      test('should create painter with debug enabled', () {
        // Arrange & Act
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: true,
        );

        // Assert
        expect(painter.debug, isTrue);
      });
    });

    group('Painting', () {
      test('should create painter with correct properties', () {
        // Arrange
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter.transform, equals(transform));
        expect(painter.objects, equals(objects));
        expect(painter.logicalExtent, equals(logicalExtent));
        expect(painter.configuration, equals(configuration));
        expect(painter.debug, isFalse);
      });

      test('should create painter with debug enabled', () {
        // Arrange
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: true,
        );

        // Assert
        expect(painter.debug, isTrue);
      });

      test('should handle empty objects list', () {
        // Arrange
        final painter = DiagramPainter(
          transform: transform,
          objects: [],
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter.objects, isEmpty);
      });

      test('should handle multiple objects', () {
        // Arrange
        final multipleObjects = [
          MockDiagramObject(
            id: 'object1',
            bounds: const Rect.fromLTWH(0, 0, 100, 100),
          ),
          MockDiagramObject(
            id: 'object2',
            bounds: const Rect.fromLTWH(200, 200, 100, 100),
          ),
          MockDiagramObject(
            id: 'object3',
            bounds: const Rect.fromLTWH(400, 400, 100, 100),
          ),
        ];
        final painter = DiagramPainter(
          transform: transform,
          objects: multipleObjects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter.objects.length, equals(3));
      });
    });

    group('Hit Testing', () {
      test('should find objects at position', () {
        // Arrange
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act
        final hitObjects = painter.findObjectsAtPoint(const Offset(50, 50));

        // Assert
        expect(hitObjects, isNotNull);
        expect(hitObjects!.length, equals(1));
        expect(hitObjects.first.id, equals('object1'));
      });

      test('should return null for no hits', () {
        // Arrange
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act
        final hitObjects = painter.findObjectsAtPoint(const Offset(1000, 1000));

        // Assert
        expect(hitObjects, isNull);
      });

      test('should respect z-order in hit testing', () {
        // Arrange
        final overlappingObjects = [
          MockDiagramObject(
            id: 'background',
            bounds: const Rect.fromLTWH(0, 0, 200, 200),
            zOrder: 100,
          ),
          MockDiagramObject(
            id: 'foreground',
            bounds: const Rect.fromLTWH(50, 50, 100, 100),
            zOrder: 200,
          ),
        ];
        final painter = DiagramPainter(
          transform: transform,
          objects: overlappingObjects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act
        final hitObjects = painter.findObjectsAtPoint(const Offset(75, 75));

        // Assert
        expect(hitObjects, isNotNull);
        expect(hitObjects!.length, equals(2));
        // Should return objects in z-order (highest first)
        expect(hitObjects.first.id, equals('foreground'));
        expect(hitObjects.last.id, equals('background'));
      });

      test('should ignore invisible objects', () {
        // Arrange
        final invisibleObject = MockDiagramObject(
          id: 'invisible',
          bounds: const Rect.fromLTWH(0, 0, 100, 100),
          isVisible: false,
        );
        final allObjects = [...objects, invisibleObject];
        final painter = DiagramPainter(
          transform: transform,
          objects: allObjects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act
        final hitObjects = painter.findObjectsAtPoint(const Offset(50, 50));

        // Assert
        expect(hitObjects, isNotNull);
        expect(hitObjects!.length, equals(1));
        expect(hitObjects.first.id, equals('object1'));
      });
    });

    group('Should Repaint', () {
      test('should repaint when transform changes', () {
        // Arrange
        final painter1 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        const newTransform = Transform2D(scale: 2.0);
        final painter2 = DiagramPainter(
          transform: newTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act & Assert
        expect(painter1.shouldRepaint(painter2), isTrue);
      });

      test('should repaint when objects change', () {
        // Arrange
        final painter1 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        final newObjects = [
          MockDiagramObject(
            id: 'newObject',
            bounds: const Rect.fromLTWH(0, 0, 50, 50),
          ),
        ];
        final painter2 = DiagramPainter(
          transform: transform,
          objects: newObjects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act & Assert
        expect(painter1.shouldRepaint(painter2), isTrue);
      });

      test('should repaint when logical extent changes', () {
        // Arrange
        final painter1 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        const newLogicalExtent = Rect.fromLTWH(0, 0, 2000, 2000);
        final painter2 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: newLogicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act & Assert
        expect(painter1.shouldRepaint(painter2), isTrue);
      });

      test('should repaint when configuration changes', () {
        // Arrange
        final painter1 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        const newConfiguration = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 5.0,
        );
        final painter2 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: newConfiguration,
          debug: false,
        );

        // Act & Assert
        expect(painter1.shouldRepaint(painter2), isTrue);
      });

      test('should repaint when debug flag changes', () {
        // Arrange
        final painter1 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        final painter2 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: true,
        );

        // Act & Assert
        expect(painter1.shouldRepaint(painter2), isTrue);
      });

      test('should not repaint when nothing changes', () {
        // Arrange
        final painter1 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        final painter2 = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Act & Assert
        expect(painter1.shouldRepaint(painter2), isFalse);
      });
    });

    group('Transform Handling', () {
      test('should create painter with scaled transform', () {
        // Arrange
        const scaledTransform = Transform2D(scale: 2.0);
        final painter = DiagramPainter(
          transform: scaledTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter.transform, equals(scaledTransform));
      });

      test('should create painter with translated transform', () {
        // Arrange
        const translatedTransform = Transform2D(
          translation: Offset(100, 100),
        );
        final painter = DiagramPainter(
          transform: translatedTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter.transform, equals(translatedTransform));
      });

      test('should create painter with complex transform', () {
        // Arrange
        const complexTransform = Transform2D(
          scale: 1.5,
          translation: Offset(50, 50),
        );
        final painter = DiagramPainter(
          transform: complexTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: configuration,
          debug: false,
        );

        // Assert
        expect(painter.transform, equals(complexTransform));
      });
    });

    group('Configuration', () {
      test('should use configuration settings', () {
        // Arrange
        const customConfig = DiagramConfiguration(
          backgroundColor: Colors.red,
          minZoom: 0.1,
          maxZoom: 10.0,
        );
        final painter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: customConfig,
          debug: false,
        );

        // Assert
        expect(painter.configuration, equals(customConfig));
      });
    });
  });
}
