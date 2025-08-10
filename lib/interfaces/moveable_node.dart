import 'dart:ui';

/// A mixin that provides movement capabilities to diagram objects.
///
/// This mixin adds the ability to move diagram objects by maintaining
/// a center position and providing methods to perform relative movements.
///
/// ## Features
///
/// - **Center Management**: Maintains the current center position of the object
/// - **Relative Movement**: Provides methods to move objects by relative amounts
/// - **Coordinate System**: Works with logical coordinates used by the diagram viewer
/// - **State Management**: Tracks movement state and provides getters for current position
///
/// ## Usage
///
/// ```dart
/// class CircleObject extends DiagramObjectEntity with MoveableNode {
///   final Offset originalCenter;
///   final double radius;
///   final Paint paint;
///
///   CircleObject({
///     required String id,
///     required this.originalCenter,
///     required this.radius,
///     required this.paint,
///   }) : super() {
///     initializeCenter(originalCenter);
///   }
///
///   @override
///   Rect get logicalBounds {
///     return Rect.fromCircle(center: center, radius: radius);
///   }
///
///   @override
///   void paint(Canvas canvas) {
///     canvas.drawCircle(center, radius, paint);
///   }
///
///   @override
///   bool contains(Offset point) {
///     return (point - center).distance <= radius;
///   }
///
/// }
/// ```
mixin MoveableNode {
  /// The current center position of the object.
  ///
  /// This represents the logical center position of the object.
  /// It should be initialized in the constructor and can be modified
  /// through movement methods.
  late Offset _center;

  /// Returns the current center position of the object.
  ///
  /// This getter provides access to the current center position.
  Offset get center => _center;

  /// Initializes the center position.
  ///
  /// This method should be called in the constructor of classes using this mixin
  /// to set the initial center position.
  ///
  /// @param initialCenter The initial center position
  void initializeCenter(Offset initialCenter) {
    _center = initialCenter;
  }

  /// Moves the object by the specified relative offset.
  ///
  /// This method adds the given offset to the current center position, effectively
  /// moving the object by the specified amount relative to its current position.
  ///
  /// @param relativeOffset The offset to move by (relative to current position)
  void moveBy(Offset relativeOffset) {
    _center += relativeOffset;
  }

  /// Moves the object to the specified absolute position.
  ///
  /// This method sets the center position to the target position.
  ///
  /// @param targetPosition The target center position to move to
  void moveTo(Offset targetPosition) {
    _center = targetPosition;
  }
}
