import 'dart:math';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/transform_2d.dart';

/// Converter utilities for compatibility between Transform2D and Matrix4.
///
/// This class provides conversion methods to help migrate from the legacy
/// Matrix4-based system to the new Transform2D system while maintaining
/// compatibility with existing code.
class Transform2DConverter {
  /// Converts a Transform2D to a Matrix4.
  ///
  /// This method creates a Matrix4 that represents the same transformation
  /// as the given Transform2D. The Matrix4 follows the standard 2D
  /// transformation matrix structure.
  ///
  /// [transform] - The Transform2D to convert
  /// Returns a Matrix4 representing the same transformation
  static Matrix4 toMatrix4(Transform2D transform) {
    return transform.toMatrix4();
  }

  /// Converts a Matrix4 to a Transform2D.
  ///
  /// This method extracts the scale, translation, and rotation components
  /// from a Matrix4 and creates a corresponding Transform2D.
  ///
  /// [matrix] - The Matrix4 to convert
  /// Returns a Transform2D representing the same transformation
  static Transform2D fromMatrix4(Matrix4 matrix) {
    return Transform2D.fromMatrix4(matrix);
  }

  /// Creates a translation-only Transform2D.
  ///
  /// This method creates a Transform2D that only applies translation,
  /// with scale set to 1.0 and rotation set to 0.0.
  ///
  /// [translation] - The translation offset
  /// Returns a Transform2D with only translation
  static Transform2D translation(Offset translation) {
    return Transform2D(
      scale: 1.0,
      translation: translation,
      rotation: 0.0,
    );
  }

  /// Creates a scale-only Transform2D.
  ///
  /// This method creates a Transform2D that only applies scaling,
  /// with translation set to Offset.zero and rotation set to 0.0.
  ///
  /// [scale] - The scale factor
  /// [focalPoint] - The focal point for scaling (optional)
  /// Returns a Transform2D with only scaling
  static Transform2D scale(double scale, [Offset? focalPoint]) {
    if (focalPoint == null) {
      return Transform2D(
        scale: scale,
        translation: Offset.zero,
        rotation: 0.0,
      );
    }

    // Calculate translation to keep focal point in place
    final translation = Offset(
      (1 - scale) * focalPoint.dx,
      (1 - scale) * focalPoint.dy,
    );

    return Transform2D(
      scale: scale,
      translation: translation,
      rotation: 0.0,
    );
  }

  /// Creates a rotation-only Transform2D.
  ///
  /// This method creates a Transform2D that only applies rotation,
  /// with scale set to 1.0 and translation set to Offset.zero.
  ///
  /// [rotation] - The rotation angle in radians
  /// [center] - The center point for rotation (optional)
  /// Returns a Transform2D with only rotation
  static Transform2D rotation(double rotation, [Offset? center]) {
    if (center == null) {
      return Transform2D(
        scale: 1.0,
        translation: Offset.zero,
        rotation: rotation,
      );
    }

    // Calculate translation to keep center point in place
    final cosR = cos(rotation);
    final sinR = sin(rotation);
    final translation = Offset(
      center.dx * (1 - cosR) + center.dy * sinR,
      center.dy * (1 - cosR) - center.dx * sinR,
    );

    return Transform2D(
      scale: 1.0,
      translation: translation,
      rotation: rotation,
    );
  }

  /// Combines multiple Transform2D objects.
  ///
  /// This method applies multiple transformations in sequence,
  /// combining their effects into a single Transform2D.
  ///
  /// [transforms] - List of Transform2D objects to combine
  /// Returns a single Transform2D representing the combined transformation
  static Transform2D combine(List<Transform2D> transforms) {
    if (transforms.isEmpty) {
      return Transform2D.identity;
    }

    Transform2D result = transforms.first;
    for (int i = 1; i < transforms.length; i++) {
      result = result.compose(transforms[i]);
    }

    return result;
  }

  /// Interpolates between two Transform2D objects.
  ///
  /// This method creates a smooth interpolation between two transforms,
  /// useful for animations.
  ///
  /// [from] - The starting Transform2D
  /// [to] - The ending Transform2D
  /// [t] - The interpolation factor (0.0 to 1.0)
  /// Returns an interpolated Transform2D
  static Transform2D lerp(Transform2D from, Transform2D to, double t) {
    return Transform2D(
      scale: _lerpDouble(from.scale, to.scale, t) ?? from.scale,
      translation: Offset.lerp(from.translation, to.translation, t) ?? from.translation,
      rotation: _lerpDouble(from.rotation, to.rotation, t) ?? from.rotation,
    );
  }

  /// Calculates the distance between two Transform2D objects.
  ///
  /// This method provides a measure of how different two transforms are,
  /// useful for determining when animations should trigger.
  ///
  /// [a] - The first Transform2D
  /// [b] - The second Transform2D
  /// Returns the distance between the transforms
  static double distance(Transform2D a, Transform2D b) {
    final scaleDiff = (a.scale - b.scale).abs();
    final translationDiff = (a.translation - b.translation).distance;
    final rotationDiff = (a.rotation - b.rotation).abs();

    // Weight the differences based on their typical ranges
    return scaleDiff * 100 + translationDiff + rotationDiff * 50;
  }

  /// Checks if two Transform2D objects are approximately equal.
  ///
  /// This method compares two transforms with a tolerance for floating-point
  /// precision issues.
  ///
  /// [a] - The first Transform2D
  /// [b] - The second Transform2D
  /// [tolerance] - The tolerance for comparison
  /// Returns true if the transforms are approximately equal
  static bool approximatelyEqual(Transform2D a, Transform2D b, {double tolerance = 0.001}) {
    return (a.scale - b.scale).abs() < tolerance &&
           (a.translation - b.translation).distance < tolerance &&
           (a.rotation - b.rotation).abs() < tolerance;
  }

  /// Helper method for double interpolation.
  ///
  /// This method provides safe double interpolation with null handling.
  ///
  /// [a] - The first double value
  /// [b] - The second double value
  /// [t] - The interpolation factor
  /// Returns the interpolated double value or null if invalid
  static double? _lerpDouble(double a, double b, double t) {
    if (t == 0.0) return a;
    if (t == 1.0) return b;
    if (a == b) return a;
    return a + (b - a) * t;
  }
}
