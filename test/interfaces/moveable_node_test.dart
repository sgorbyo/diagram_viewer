import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/interfaces/moveable_node.dart';

/// A simple test implementation of DiagramObjectEntity with MoveableNode
class TestMoveableObject extends DiagramObjectEntity with MoveableNode {
  final Offset _originalPosition;
  final double size;
  final String _id;

  TestMoveableObject({
    required Offset originalPosition,
    required this.size,
    required String id,
  })  : _originalPosition = originalPosition,
        _id = id {
    // Initialize the center position
    initializeCenter(originalPosition);
  }

  @override
  String get id => _id;

  @override
  Rect get logicalBounds {
    return Rect.fromCenter(
      center: center,
      width: size,
      height: size,
    );
  }

  @override
  void paint(Canvas canvas) {
    // Test implementation - not used in tests
  }

  @override
  List<Object?> get props => [_id, _originalPosition, size];
}

void main() {
  group('MoveableNode', () {
    late TestMoveableObject object;

    setUp(() {
      object = TestMoveableObject(
        originalPosition: const Offset(100, 100),
        size: 50,
        id: 'test-object',
      );
    });

    test('should initialize with original center', () {
      expect(object.center, const Offset(100, 100));
    });

    test('should return original center when not moved', () {
      expect(object.center, const Offset(100, 100));
    });

    test('should move by relative offset', () {
      object.moveBy(const Offset(10, 20));

      expect(object.center, const Offset(110, 120));
    });

    test('should move to absolute position', () {
      object.moveTo(const Offset(200, 300));

      expect(object.center, const Offset(200, 300));
    });

    test('should accumulate movements', () {
      object.moveBy(const Offset(10, 10));
      object.moveBy(const Offset(20, 20));

      expect(object.center, const Offset(130, 130));
    });

    test('should update logical bounds when moved', () {
      final originalBounds = object.logicalBounds;
      expect(originalBounds.center, const Offset(100, 100));

      object.moveBy(const Offset(25, 25));

      final newBounds = object.logicalBounds;
      expect(newBounds.center, const Offset(125, 125));
      expect(newBounds.width, 50);
      expect(newBounds.height, 50);
    });
  });
}
