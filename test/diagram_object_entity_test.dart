import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

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
  Rect enclosingRect() => bounds;

  @override
  List<Object?> get props => [bounds, color, id];
}

void main() {
  group('DiagramObjectEntity Tests', () {
    late TestDiagramObject testObject;

    setUp(() {
      testObject = TestDiagramObject(
        bounds: const Rect.fromLTWH(10, 20, 100, 50),
        color: Colors.red,
        id: 'test-1',
      );
    });

    group('Basic Properties', () {
      test('enclosingRect returns correct bounds', () {
        // Act
        final rect = testObject.enclosingRect();

        // Assert
        expect(rect, const Rect.fromLTWH(10, 20, 100, 50));
        expect(rect.left, 10);
        expect(rect.top, 20);
        expect(rect.width, 100);
        expect(rect.height, 50);
      });

      test('props contains all identity properties', () {
        // Act
        final props = testObject.props;

        // Assert
        expect(props, contains(const Rect.fromLTWH(10, 20, 100, 50)));
        expect(props, contains(Colors.red));
        expect(props, contains('test-1'));
        expect(props.length, 3);
      });
    });

    group('Equality', () {
      test('identical objects are equal', () {
        // Arrange
        final object1 = TestDiagramObject(
          bounds: const Rect.fromLTWH(10, 20, 100, 50),
          color: Colors.red,
          id: 'test-1',
        );
        final object2 = TestDiagramObject(
          bounds: const Rect.fromLTWH(10, 20, 100, 50),
          color: Colors.red,
          id: 'test-1',
        );

        // Assert
        expect(object1, equals(object2));
        expect(object1.hashCode, equals(object2.hashCode));
      });

      test('different objects are not equal', () {
        // Arrange
        final object1 = TestDiagramObject(
          bounds: const Rect.fromLTWH(10, 20, 100, 50),
          color: Colors.red,
          id: 'test-1',
        );
        final object2 = TestDiagramObject(
          bounds: const Rect.fromLTWH(10, 20, 100, 50),
          color: Colors.blue, // Different color
          id: 'test-1',
        );

        // Assert
        expect(object1, isNot(equals(object2)));
        expect(object1.hashCode, isNot(equals(object2.hashCode)));
      });
    });

    group('Canvas Rendering', () {
      testWidgets('paint can be called without errors',
          (WidgetTester tester) async {
        // Arrange
        final canvas = Canvas(PictureRecorder());

        // Act & Assert - Should not throw
        expect(() => testObject.paint(canvas), returnsNormally);
      });

      testWidgets('paint renders with correct paint',
          (WidgetTester tester) async {
        // Arrange
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);

        // Act
        testObject.paint(canvas);

        // Assert
        final picture = recorder.endRecording();
        expect(picture, isNotNull);
      });
    });

    group('Boundary Calculations', () {
      test('enclosingRect handles zero size', () {
        // Arrange
        final zeroObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(10, 20, 0, 0),
          color: Colors.red,
          id: 'zero',
        );

        // Act
        final rect = zeroObject.enclosingRect();

        // Assert
        expect(rect.width, 0);
        expect(rect.height, 0);
        expect(rect.left, 10);
        expect(rect.top, 20);
      });

      test('enclosingRect handles negative coordinates', () {
        // Arrange
        final negativeObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(-10, -20, 100, 50),
          color: Colors.red,
          id: 'negative',
        );

        // Act
        final rect = negativeObject.enclosingRect();

        // Assert
        expect(rect.left, -10);
        expect(rect.top, -20);
        expect(rect.width, 100);
        expect(rect.height, 50);
      });
    });

    group('Edge Cases', () {
      test('handles very large bounds', () {
        // Arrange
        final largeObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(0, 0, double.maxFinite, double.maxFinite),
          color: Colors.red,
          id: 'large',
        );

        // Act
        final rect = largeObject.enclosingRect();

        // Assert
        expect(rect.width, double.maxFinite);
        expect(rect.height, double.maxFinite);
      });

      test('handles very small bounds', () {
        // Arrange
        final smallObject = TestDiagramObject(
          bounds:
              const Rect.fromLTWH(0, 0, double.minPositive, double.minPositive),
          color: Colors.red,
          id: 'small',
        );

        // Act
        final rect = smallObject.enclosingRect();

        // Assert
        expect(rect.width, double.minPositive);
        expect(rect.height, double.minPositive);
      });
    });
  });
}
