import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'transform_2d.freezed.dart';

/// A 2D transformation class that handles scale, translation, and rotation.
///
/// This class provides a clean interface for managing 2D transformations
/// used by the DiagramViewer. It includes methods for:
/// - Converting to/from Matrix4 for Flutter rendering
/// - Applying zoom with focal point
/// - Applying pan (translation)
/// - Converting between logical and physical coordinates
///
/// ## Example Usage
///
/// ```dart
/// // Create a transform with scale 2.0 and translation (10, 20)
/// final transform = Transform2D(
///   scale: 2.0,
///   translation: Offset(10, 20),
///   rotation: 0.0,
/// );
///
/// // Apply zoom with focal point
/// final zoomed = transform.applyZoom(1.5, Offset(100, 100));
///
/// // Apply pan
/// final panned = transform.applyPan(Offset(5, 10));
///
/// // Convert coordinates
/// final physical = transform.logicalToPhysical(Offset(50, 50));
/// final logical = transform.physicalToLogical(Offset(110, 120));
/// ```
@freezed
class Transform2D with _$Transform2D {
  const Transform2D._();

  const factory Transform2D({
    /// Scale factor (1.0 = no scaling, 2.0 = 2x zoom, 0.5 = 50% zoom)
    @Default(1.0) double scale,

    /// Translation offset in pixels
    @Default(Offset.zero) Offset translation,

    /// Rotation angle in radians
    @Default(0.0) double rotation,
  }) = _Transform2D;

  /// Creates a Transform2D from a Matrix4.
  ///
  /// This factory constructor extracts scale, translation, and rotation
  /// from a Flutter Matrix4. For diagram viewers, we assume uniform scaling
  /// (scaleX = scaleY) to avoid distortions. This is optimized for performance
  /// and consistency.
  factory Transform2D.fromMatrix4(Matrix4 matrix) {
    // Extract translation
    final translation = Offset(matrix[12], matrix[13]);

    // Extract uniform scale (using scaleX only for performance and consistency)
    final scale = math.sqrt(matrix[0] * matrix[0] + matrix[1] * matrix[1]);

    // Extract rotation
    final rotation = math.atan2(matrix[1], matrix[0]);

    return Transform2D(
      scale: scale,
      translation: translation,
      rotation: rotation,
    );
  }

  /// Converts this Transform2D to a Flutter Matrix4.
  ///
  /// The resulting Matrix4 can be used directly with Flutter's Canvas
  /// for rendering transformations.
  Matrix4 toMatrix4() {
    return Matrix4.identity()
      ..translateByVector3(Vector3(translation.dx, translation.dy, 0))
      ..scaleByVector3(Vector3(scale, scale, 1.0))
      ..rotateZ(rotation);
  }

  /// Applies zoom with a focal point.
  ///
  /// The zoom is applied around the specified focal point, which means
  /// the point under the focal point stays in the same screen position.
  ///
  /// [factor] - The zoom factor (1.0 = no change, 2.0 = 2x zoom, 0.5 = 50% zoom)
  /// [focalPoint] - The point around which to zoom (in logical coordinates)
  Transform2D applyZoom(double factor, Offset focalPoint) {
    final newScale = scale * factor;

    // Formula based on the working implementation from the previous version
    // The key insight is: newTranslation = translation + focalPoint * (1 - factor) * scale
    // This ensures the focal point remains stationary during zoom when applying to existing transform
    final newTranslation = translation + focalPoint * (1 - factor) * scale;

    return copyWith(
      scale: newScale,
      translation: newTranslation,
    );
  }

  /// Applies pan (translation).
  ///
  /// Adds the specified delta to the current translation.
  ///
  /// [delta] - The translation delta to apply
  Transform2D applyPan(Offset delta) {
    return copyWith(
      translation: translation + delta,
    );
  }

  /// Converts logical coordinates to physical (screen) coordinates.
  ///
  /// Logical coordinates are in the diagram's coordinate system.
  /// Physical coordinates are in the screen's coordinate system.
  ///
  /// [logical] - The logical coordinates to convert
  Offset logicalToPhysical(Offset logical) {
    final matrix = toMatrix4();
    final vector = Vector4(logical.dx, logical.dy, 0, 1);
    final transformed = matrix.transform(vector);
    return Offset(transformed.x, transformed.y);
  }

  /// Converts physical (screen) coordinates to logical coordinates.
  ///
  /// Physical coordinates are in the screen's coordinate system.
  /// Logical coordinates are in the diagram's coordinate system.
  ///
  /// [physical] - The physical coordinates to convert
  Offset physicalToLogical(Offset physical) {
    final matrix = toMatrix4();
    final inverted = Matrix4.copy(matrix);
    inverted.invert();
    final vector = Vector4(physical.dx, physical.dy, 0, 1);
    final transformed = inverted.transform(vector);
    return Offset(transformed.x, transformed.y);
  }

  /// Returns the identity transformation (no scaling, translation, or rotation).
  static const Transform2D identity = Transform2D(
    scale: 1.0,
    translation: Offset.zero,
    rotation: 0.0,
  );

  /// Returns true if this transformation is the identity transformation.
  bool get isIdentity =>
      scale == 1.0 && translation == Offset.zero && rotation == 0.0;

  /// Returns the inverse of this transformation.
  ///
  /// The inverse transformation undoes the effects of this transformation.
  Transform2D get inverse {
    if (isIdentity) return this;

    final matrix = toMatrix4();
    final inverted = Matrix4.copy(matrix);
    inverted.invert();
    return Transform2D.fromMatrix4(inverted);
  }

  /// Composes this transformation with another transformation.
  ///
  /// The result is equivalent to applying [other] first, then this transformation.
  ///
  /// [other] - The transformation to compose with
  Transform2D compose(Transform2D other) {
    final matrix = toMatrix4() * other.toMatrix4();
    return Transform2D.fromMatrix4(matrix);
  }
}
