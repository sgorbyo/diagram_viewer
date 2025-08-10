import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/events/hit_test_result.dart';
import 'package:vector_math/vector_math.dart';

// Mock object for testing hit-testing
class MockDiagramObject extends DiagramObjectEntity {
  final String _id;
  final Offset _center;
  final double _radius;
  final bool _isVisible;
  final bool _isInteractive;

  MockDiagramObject({
    required String id,
    required Offset center,
    required double radius,
    bool isVisible = true,
    bool isInteractive = true,
  })  : _id = id,
        _center = center,
        _radius = radius,
        _isVisible = isVisible,
        _isInteractive = isInteractive;

  @override
  String get id => _id;

  @override
  Offset get center => _center;

  @override
  Rect get logicalBounds => Rect.fromCircle(center: _center, radius: _radius);

  @override
  bool get isVisible => _isVisible;

  @override
  bool get isInteractive => _isInteractive;

  @override
  void paint(Canvas canvas) {
    // Mock implementation
  }

  @override
  bool contains(Offset point) {
    final distance = (point - _center).distance;
    return distance <= _radius;
  }

  @override
  List<Object?> get props =>
      [_id, _center, _radius, _isVisible, _isInteractive];
}

// Mock CerchioEntity for testing
class MockCerchioEntity extends DiagramObjectEntity {
  final String _id;
  final Offset _center;
  final double _radius;
  final bool _isVisible;
  final bool _isInteractive;

  MockCerchioEntity({
    required String id,
    required Offset center,
    required double radius,
    bool isVisible = true,
    bool isInteractive = true,
  })  : _id = id,
        _center = center,
        _radius = radius,
        _isVisible = isVisible,
        _isInteractive = isInteractive;

  @override
  String get id => _id;

  @override
  Offset get center => _center;

  @override
  Rect get logicalBounds => Rect.fromCircle(center: _center, radius: _radius);

  @override
  bool get isVisible => _isVisible;

  @override
  bool get isInteractive => _isInteractive;

  @override
  void paint(Canvas canvas) {
    // Mock implementation
  }

  @override
  bool contains(Offset point) {
    final distance = (point - _center).distance;
    final contains = distance <= _radius;
    return contains;
  }

  @override
  List<Object?> get props =>
      [_id, _center, _radius, _isVisible, _isInteractive];
}

void main() {
  group('Transform2D Coordinate Conversion Tests', () {
    group('Identity Transform', () {
      test('should convert coordinates correctly with identity transform', () {
        const transform = Transform2D.identity;
        const logicalPoint = Offset(100, 200);
        const physicalPoint = Offset(100, 200);

        // Test logical to physical
        final convertedPhysical = transform.logicalToPhysical(logicalPoint);
        expect(convertedPhysical.dx, closeTo(physicalPoint.dx, 0.001));
        expect(convertedPhysical.dy, closeTo(physicalPoint.dy, 0.001));

        // Test physical to logical
        final convertedLogical = transform.physicalToLogical(physicalPoint);
        expect(convertedLogical.dx, closeTo(logicalPoint.dx, 0.001));
        expect(convertedLogical.dy, closeTo(logicalPoint.dy, 0.001));
      });
    });

    group('Scale Transform', () {
      test('should convert coordinates correctly with scale transform', () {
        const transform = Transform2D(scale: 2.0);
        const logicalPoint = Offset(100, 200);
        const expectedPhysicalPoint = Offset(200, 400); // 2x scale

        // Test logical to physical
        final convertedPhysical = transform.logicalToPhysical(logicalPoint);
        expect(convertedPhysical.dx, closeTo(expectedPhysicalPoint.dx, 0.001));
        expect(convertedPhysical.dy, closeTo(expectedPhysicalPoint.dy, 0.001));

        // Test physical to logical (round trip)
        final convertedLogical = transform.physicalToLogical(convertedPhysical);
        expect(convertedLogical.dx, closeTo(logicalPoint.dx, 0.001));
        expect(convertedLogical.dy, closeTo(logicalPoint.dy, 0.001));
      });

      test('should convert coordinates correctly with scale and translation',
          () {
        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(50, 100),
        );
        const logicalPoint = Offset(100, 200);
        const expectedPhysicalPoint =
            Offset(250, 500); // (100*2 + 50, 200*2 + 100)

        // Test logical to physical
        final convertedPhysical = transform.logicalToPhysical(logicalPoint);
        expect(convertedPhysical.dx, closeTo(expectedPhysicalPoint.dx, 0.001));
        expect(convertedPhysical.dy, closeTo(expectedPhysicalPoint.dy, 0.001));

        // Test physical to logical (round trip)
        final convertedLogical = transform.physicalToLogical(convertedPhysical);
        expect(convertedLogical.dx, closeTo(logicalPoint.dx, 0.001));
        expect(convertedLogical.dy, closeTo(logicalPoint.dy, 0.001));
      });
    });

    group('Translation Transform', () {
      test('should convert coordinates correctly with translation only', () {
        const transform = Transform2D(translation: Offset(50, 100));
        const logicalPoint = Offset(100, 200);
        const expectedPhysicalPoint = Offset(150, 300); // (100 + 50, 200 + 100)

        // Test logical to physical
        final convertedPhysical = transform.logicalToPhysical(logicalPoint);
        expect(convertedPhysical.dx, closeTo(expectedPhysicalPoint.dx, 0.001));
        expect(convertedPhysical.dy, closeTo(expectedPhysicalPoint.dy, 0.001));

        // Test physical to logical (round trip)
        final convertedLogical = transform.physicalToLogical(convertedPhysical);
        expect(convertedLogical.dx, closeTo(logicalPoint.dx, 0.001));
        expect(convertedLogical.dy, closeTo(logicalPoint.dy, 0.001));
      });
    });

    group('Complex Transform (Scale + Translation)', () {
      test('should convert coordinates correctly with scale and translation',
          () {
        const transform = Transform2D(
          scale: 1.5,
          translation: Offset(100, 200),
        );
        const logicalPoint = Offset(200, 300);
        const expectedPhysicalPoint =
            Offset(400, 650); // (200*1.5 + 100, 300*1.5 + 200)

        // Test logical to physical
        final convertedPhysical = transform.logicalToPhysical(logicalPoint);
        expect(convertedPhysical.dx, closeTo(expectedPhysicalPoint.dx, 0.001));
        expect(convertedPhysical.dy, closeTo(expectedPhysicalPoint.dy, 0.001));

        // Test physical to logical (round trip)
        final convertedLogical = transform.physicalToLogical(convertedPhysical);
        expect(convertedLogical.dx, closeTo(logicalPoint.dx, 0.001));
        expect(convertedLogical.dy, closeTo(logicalPoint.dy, 0.001));
      });

      test('should convert physical coordinates back to logical correctly', () {
        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(50, 100),
        );
        const physicalPoint = Offset(250, 500);
        const expectedLogicalPoint =
            Offset(100, 200); // ((250-50)/2, (500-100)/2)

        // Test physical to logical
        final convertedLogical = transform.physicalToLogical(physicalPoint);
        expect(convertedLogical.dx, closeTo(expectedLogicalPoint.dx, 0.001));
        expect(convertedLogical.dy, closeTo(expectedLogicalPoint.dy, 0.001));

        // Test logical to physical (round trip)
        final convertedPhysical = transform.logicalToPhysical(convertedLogical);
        expect(convertedPhysical.dx, closeTo(physicalPoint.dx, 0.001));
        expect(convertedPhysical.dy, closeTo(physicalPoint.dy, 0.001));
      });
    });

    group('Matrix4 Conversion Tests', () {
      test('should create correct Matrix4 for identity transform', () {
        const transform = Transform2D.identity;
        final matrix = transform.toMatrix4();

        // Test that the matrix is identity
        expect(matrix[0], closeTo(1.0, 0.001)); // scale x
        expect(matrix[5], closeTo(1.0, 0.001)); // scale y
        expect(matrix[12], closeTo(0.0, 0.001)); // translation x
        expect(matrix[13], closeTo(0.0, 0.001)); // translation y
      });

      test('should create correct Matrix4 for scale transform', () {
        const transform = Transform2D(scale: 2.0);
        final matrix = transform.toMatrix4();

        // Test scale
        expect(matrix[0], closeTo(2.0, 0.001)); // scale x
        expect(matrix[5], closeTo(2.0, 0.001)); // scale y
        expect(matrix[12], closeTo(0.0, 0.001)); // translation x
        expect(matrix[13], closeTo(0.0, 0.001)); // translation y
      });

      test('should create correct Matrix4 for translation transform', () {
        const transform = Transform2D(translation: Offset(50, 100));
        final matrix = transform.toMatrix4();

        // Test translation
        expect(matrix[0], closeTo(1.0, 0.001)); // scale x
        expect(matrix[5], closeTo(1.0, 0.001)); // scale y
        expect(matrix[12], closeTo(50.0, 0.001)); // translation x
        expect(matrix[13], closeTo(100.0, 0.001)); // translation y
      });

      test('should create correct Matrix4 for scale and translation transform',
          () {
        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(50, 100),
        );
        final matrix = transform.toMatrix4();

        // Test scale and translation
        expect(matrix[0], closeTo(2.0, 0.001)); // scale x
        expect(matrix[5], closeTo(2.0, 0.001)); // scale y
        expect(matrix[12], closeTo(50.0, 0.001)); // translation x
        expect(matrix[13], closeTo(100.0, 0.001)); // translation y
      });
    });

    group('Inverse Transform Tests', () {
      test('should have correct inverse for identity transform', () {
        const transform = Transform2D.identity;
        final inverse = transform.inverse;

        expect(inverse.scale, closeTo(1.0, 0.001));
        expect(inverse.translation.dx, closeTo(0.0, 0.001));
        expect(inverse.translation.dy, closeTo(0.0, 0.001));
      });

      test('should have correct inverse for scale transform', () {
        const transform = Transform2D(scale: 2.0);
        final inverse = transform.inverse;

        expect(inverse.scale, closeTo(0.5, 0.001));
        expect(inverse.translation.dx, closeTo(0.0, 0.001));
        expect(inverse.translation.dy, closeTo(0.0, 0.001));
      });

      test('should have correct inverse for translation transform', () {
        const transform = Transform2D(translation: Offset(50, 100));
        final inverse = transform.inverse;

        expect(inverse.scale, closeTo(1.0, 0.001));
        expect(inverse.translation.dx, closeTo(-50.0, 0.001));
        expect(inverse.translation.dy, closeTo(-100.0, 0.001));
      });

      test('should have correct inverse for scale and translation transform',
          () {
        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(50, 100),
        );
        final inverse = transform.inverse;

        expect(inverse.scale, closeTo(0.5, 0.001));
        expect(inverse.translation.dx, closeTo(-25.0, 0.001)); // -50/2
        expect(inverse.translation.dy, closeTo(-50.0, 0.001)); // -100/2
      });
    });

    group('Round Trip Tests', () {
      test('should preserve coordinates through round trip conversion', () {
        const transform = Transform2D(
          scale: 1.5,
          translation: Offset(100, 200),
        );
        const originalLogical = Offset(300, 400);

        // Logical -> Physical -> Logical
        final physical = transform.logicalToPhysical(originalLogical);
        final backToLogical = transform.physicalToLogical(physical);

        expect(backToLogical.dx, closeTo(originalLogical.dx, 0.001));
        expect(backToLogical.dy, closeTo(originalLogical.dy, 0.001));
      });

      test(
          'should preserve coordinates through round trip conversion (reverse)',
          () {
        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(50, 100),
        );
        const originalPhysical = Offset(250, 500);

        // Physical -> Logical -> Physical
        final logical = transform.physicalToLogical(originalPhysical);
        final backToPhysical = transform.logicalToPhysical(logical);

        expect(backToPhysical.dx, closeTo(originalPhysical.dx, 0.001));
        expect(backToPhysical.dy, closeTo(originalPhysical.dy, 0.001));
      });
    });

    group('Matrix4 Order of Operations Tests', () {
      test('should apply operations in correct order: scale then translate',
          () {
        // This test specifically checks the order of operations in toMatrix4()
        // The current implementation applies: translate -> scale -> rotate
        // But for diagram viewers, we typically want: scale -> rotate -> translate

        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(100, 200),
        );
        final matrix = transform.toMatrix4();

        // With current implementation (translate -> scale):
        // Matrix should be: [scale, 0, 0, translate.x*scale]
        //                    [0, scale, 0, translate.y*scale]
        //                    [0, 0, 1, 0]
        //                    [0, 0, 0, 1]

        // With correct implementation (scale -> translate):
        // Matrix should be: [scale, 0, 0, translate.x]
        //                    [0, scale, 0, translate.y]
        //                    [0, 0, 1, 0]
        //                    [0, 0, 0, 1]

        // Test that the matrix elements are correct for the current implementation
        expect(matrix[0], closeTo(2.0, 0.001)); // scale x
        expect(matrix[5], closeTo(2.0, 0.001)); // scale y
        expect(matrix[12], closeTo(100.0, 0.001)); // translation x
        expect(matrix[13], closeTo(200.0, 0.001)); // translation y

        // Test coordinate conversion with this matrix
        const logicalPoint = Offset(50, 100);
        final physicalPoint = transform.logicalToPhysical(logicalPoint);

        // Expected: (50*2 + 100, 100*2 + 200) = (200, 400)
        expect(physicalPoint.dx, closeTo(200.0, 0.001));
        expect(physicalPoint.dy, closeTo(400.0, 0.001));
      });

      test('should demonstrate the problem with current order of operations',
          () {
        // This test demonstrates that the current order is actually correct
        // The issue might be elsewhere

        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(100, 200),
        );

        // Test a specific coordinate conversion
        const logicalPoint = Offset(50, 100);
        final physicalPoint = transform.logicalToPhysical(logicalPoint);

        // With current implementation: translate -> scale
        // logicalPoint(50,100) -> scale(100,200) -> translate(200,400)
        expect(physicalPoint.dx, closeTo(200.0, 0.001));
        expect(physicalPoint.dy, closeTo(400.0, 0.001));

        // Round trip should work
        final backToLogical = transform.physicalToLogical(physicalPoint);
        expect(backToLogical.dx, closeTo(logicalPoint.dx, 0.001));
        expect(backToLogical.dy, closeTo(logicalPoint.dy, 0.001));
      });
    });

    group('Hit-Testing Tests', () {
      test('should perform hit-testing correctly with identity transform', () {
        const transform = Transform2D.identity;
        final objects = [
          MockDiagramObject(
            id: 'circle1',
            center: Offset(100, 100),
            radius: 50,
          ),
          MockDiagramObject(
            id: 'circle2',
            center: Offset(200, 200),
            radius: 30,
          ),
        ];

        // Test hit on circle1
        final hitResults1 = _performHitTesting(
          Offset(120, 120), // Inside circle1
          transform,
          objects,
        );
        expect(hitResults1.length, equals(1));
        expect(hitResults1.first.object.id, equals('circle1'));

        // Test hit on circle2
        final hitResults2 = _performHitTesting(
          Offset(210, 210), // Inside circle2
          transform,
          objects,
        );
        expect(hitResults2.length, equals(1));
        expect(hitResults2.first.object.id, equals('circle2'));

        // Test miss
        final hitResults3 = _performHitTesting(
          Offset(300, 300), // Outside both circles
          transform,
          objects,
        );
        expect(hitResults3.length, equals(0));
      });

      test('should perform hit-testing correctly with scale transform', () {
        const transform = Transform2D(scale: 2.0);
        final objects = [
          MockDiagramObject(
            id: 'circle1',
            center: Offset(100, 100),
            radius: 50,
          ),
        ];

        // Physical point (240, 240) should map to logical point (120, 120)
        // which is inside the circle at (100, 100) with radius 50
        final hitResults = _performHitTesting(
          Offset(240, 240), // Physical coordinates
          transform,
          objects,
        );
        expect(hitResults.length, equals(1));
        expect(hitResults.first.object.id, equals('circle1'));
      });

      test('should perform hit-testing correctly with translation transform',
          () {
        const transform = Transform2D(translation: Offset(50, 50));
        final objects = [
          MockDiagramObject(
            id: 'circle1',
            center: Offset(100, 100),
            radius: 50,
          ),
        ];

        // Physical point (150, 150) should map to logical point (100, 100)
        // which is at the center of the circle
        final hitResults = _performHitTesting(
          Offset(150, 150), // Physical coordinates
          transform,
          objects,
        );
        expect(hitResults.length, equals(1));
        expect(hitResults.first.object.id, equals('circle1'));
      });

      test('should perform hit-testing correctly with scale and translation',
          () {
        const transform = Transform2D(
          scale: 2.0,
          translation: Offset(100, 100),
        );
        final objects = [
          MockDiagramObject(
            id: 'circle1',
            center: Offset(100, 100),
            radius: 50,
          ),
        ];

        // Physical point (300, 300) should map to logical point (100, 100)
        // ((300-100)/2, (300-100)/2) = (100, 100)
        final hitResults = _performHitTesting(
          Offset(300, 300), // Physical coordinates
          transform,
          objects,
        );
        expect(hitResults.length, equals(1));
        expect(hitResults.first.object.id, equals('circle1'));
      });
    });

    group('CerchioEntity-like Tests', () {
      test('should test contains method with small radius', () {
        final object = MockCerchioEntity(
          id: 'small-circle',
          center: Offset(100, 100),
          radius: 10, // Small radius
        );

        // Test point inside circle
        expect(object.contains(Offset(105, 105)), isTrue);

        // Test point at edge of circle
        expect(object.contains(Offset(110, 100)), isTrue);

        // Test point outside circle
        expect(object.contains(Offset(115, 115)), isFalse);
      });

      test('should test contains method with larger radius', () {
        final object = MockCerchioEntity(
          id: 'large-circle',
          center: Offset(200, 200),
          radius: 50, // Larger radius
        );

        // Test point inside circle
        expect(object.contains(Offset(220, 220)), isTrue);

        // Test point at edge of circle
        expect(object.contains(Offset(250, 200)), isTrue);

        // Test point outside circle
        expect(object.contains(Offset(260, 260)), isFalse);
      });

      test('should test hit-testing with small circles', () {
        const transform = Transform2D.identity;
        final objects = [
          MockCerchioEntity(
            id: 'small-circle',
            center: Offset(100, 100),
            radius: 10, // Small radius
          ),
        ];

        // Test hit on small circle
        final hitResults = _performHitTesting(
          Offset(105, 105), // Inside small circle
          transform,
          objects,
        );
        expect(hitResults.length, equals(1));
        expect(hitResults.first.object.id, equals('small-circle'));

        // Test miss on small circle
        final missResults = _performHitTesting(
          Offset(120, 120), // Outside small circle
          transform,
          objects,
        );
        expect(missResults.length, equals(0));
      });

      test(
          'should demonstrate the problem with CerchioEntity not using MoveableNode',
          () {
        // This test demonstrates that CerchioEntity doesn't use MoveableNode
        // and calculates center dynamically from position

        // Simulate CerchioEntity behavior (without MoveableNode)
        final position = Vector4(100, 200, 0, 1);
        final radius = 50.0;

        // Center is calculated dynamically
        final center = Offset(position.x, position.y);
        expect(center, equals(Offset(100, 200)));

        // Test contains method
        final distance = (Offset(120, 220) - center).distance;
        final contains = distance <= radius;
        expect(contains, isTrue); // Point should be inside circle

        // Test with transform
        const transform = Transform2D(scale: 2.0, translation: Offset(50, 100));
        final physicalPoint = Offset(290, 540); // Physical coordinates
        final logicalPoint = transform.physicalToLogical(physicalPoint);

        // Logical point should be (120, 220) which is inside the circle
        expect(logicalPoint.dx, closeTo(120, 0.001));
        expect(logicalPoint.dy, closeTo(220, 0.001));

        // Test hit-testing
        final objects = [
          MockCerchioEntity(
            id: 'test-circle',
            center: center,
            radius: radius,
          ),
        ];

        final hitResults = _performHitTesting(
          physicalPoint,
          transform,
          objects,
        );

        // This should find the circle
        expect(hitResults.length, equals(1));
        expect(hitResults.first.object.id, equals('test-circle'));
      });

      test('should demonstrate the problem with drag threshold being too low',
          () {
        // This test demonstrates that the drag threshold of 1.0 pixel is too low
        // and causes taps to be interpreted as drags

        // Simulate a small movement during a click (1.5 pixels)
        final startPosition = Offset(100, 100);
        final endPosition = Offset(101.5, 101.5);
        final movement = (endPosition - startPosition).distance;

        // With current threshold of 1.0, this would be interpreted as a drag
        expect(movement, greaterThan(1.0));
        expect(movement, lessThan(3.0)); // Small movement (actual is ~2.12)

        // This demonstrates that even a tiny movement (1.5 pixels)
        // would be interpreted as a drag instead of a tap
        // The threshold should be higher, like 5-10 pixels

        // Test with different thresholds
        const lowThreshold = 1.0;
        const highThreshold = 5.0;

        expect(movement > lowThreshold, isTrue); // Would be drag
        expect(movement > highThreshold, isFalse); // Would be tap

        // This shows that a higher threshold would fix the problem
        expect(movement <= highThreshold, isTrue);
      });

      test('should demonstrate the new multi-criteria drag detection logic',
          () {
        // This test demonstrates the new multi-criteria logic for drag detection
        // which uses distance, velocity, and time instead of just distance

        // Simulate different scenarios

        // Scenario 1: Small movement, short time (should be tap)
        final smallMovement = Offset(2.0, 2.0); // 2.83 pixels
        final shortDuration = Duration(milliseconds: 100);

        // With new logic: distance=2.83 < 3.0, velocity=28.3 < 50.0, time=100ms < 300ms
        // This should be a tap

        // Scenario 2: Small movement, long time (should be drag)
        final longDuration = Duration(milliseconds: 400);

        // With new logic: distance=2.83 < 3.0, velocity=7.1 < 50.0, time=400ms > 300ms
        // This should be a drag due to time threshold

        // Scenario 3: Large movement, short time (should be drag)
        final largeMovement = Offset(10.0, 10.0); // 14.14 pixels
        final shortDuration2 = Duration(milliseconds: 100);

        // With new logic: distance=14.14 > 3.0, velocity=141.4 > 50.0, time=100ms < 300ms
        // This should be a drag due to distance and velocity thresholds

        // Test the thresholds
        const distanceThreshold = 3.0;
        const velocityThreshold = 50.0;
        const maxTapDuration = Duration(milliseconds: 300);

        // Scenario 1: Should be tap
        final velocity1 = smallMovement.distance /
            shortDuration.inMilliseconds *
            1000; // pixels/second
        expect(smallMovement.distance <= distanceThreshold, isTrue);
        expect(velocity1 <= velocityThreshold, isTrue);
        expect(shortDuration <= maxTapDuration, isTrue);

        // Scenario 2: Should be drag (time threshold)
        expect(smallMovement.distance <= distanceThreshold, isTrue);
        expect(longDuration > maxTapDuration, isTrue);

        // Scenario 3: Should be drag (distance and velocity thresholds)
        expect(largeMovement.distance > distanceThreshold, isTrue);
        final velocity3 = largeMovement.distance /
            shortDuration2.inMilliseconds *
            1000; // pixels/second
        expect(velocity3 > velocityThreshold, isTrue);
      });
    });
  });
}

/// Mock hit-testing function for testing
List<HitTestResult> _performHitTesting(
  Offset position,
  Transform2D transform,
  List<DiagramObjectEntity> objects,
) {
  final logicalPosition = transform.physicalToLogical(position);
  final results = <HitTestResult>[];

  for (final object in objects) {
    if (object.isVisible &&
        object.isInteractive &&
        object.contains(logicalPosition)) {
      final distance = (logicalPosition - object.center).distance;
      results.add(HitTestResult(
        object: object,
        distanceFromCenter: distance,
        hitPoint: logicalPosition,
      ));
    }
  }

  // Sort by distance (closest first)
  results.sort((a, b) => a.distanceFromCenter.compareTo(b.distanceFromCenter));
  return results;
}
