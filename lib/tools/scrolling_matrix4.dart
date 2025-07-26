import 'package:flutter/material.dart';

/// Extension on [Matrix4] that provides convenient accessors and mutators for
/// transformation operations commonly used in scrolling and zooming scenarios.
///
/// This extension simplifies working with [Matrix4] objects by providing
/// intuitive getters and setters for scaling and translation components,
/// which are frequently manipulated in diagram viewing interactions.
///
/// ## Usage
///
/// The extension treats the [Matrix4] as a transformation matrix with:
/// - Uniform scaling (same scale factor for x and y axes)
/// - 2D translation (x and y)
///
/// It assumes a standard 2D transformation matrix structure where:
/// - [0] and [5] represent scale factors for x and y axes respectively
/// - [12] represents x translation
/// - [13] represents y translation
///
/// Example:
/// ```dart
/// final matrix = Matrix4.identity();
/// matrix.zoom = 2.0;       // Set zoom level to 2x
/// matrix.offset = Offset(100, 50);  // Translate to (100, 50)
/// ```
extension ScrollingMatrix4 on Matrix4 {
  /// Gets the current zoom level (scale factor) of the matrix.
  ///
  /// This returns the scale factor along the x-axis, which should be
  /// identical to the y-axis scale factor in uniform scaling scenarios.
  double get zoom => this[0];

  /// Sets a uniform zoom level (scale factor) for both x and y axes.
  ///
  /// This applies the same scale factor to both axes to maintain
  /// proportional scaling.
  ///
  /// @param newScale The new scale factor to apply
  set zoom(double newScale) {
    this[0] = newScale;
    this[5] = newScale;
  }

  /// Gets the x-translation component of the matrix.
  ///
  /// This represents how far the coordinate system is translated
  /// along the x-axis.
  double get x => this[12];

  /// Sets the x-translation component of the matrix.
  ///
  /// @param value The new x-translation value
  set x(double value) {
    this[12] = value;
  }

  /// Gets the y-translation component of the matrix.
  ///
  /// This represents how far the coordinate system is translated
  /// along the y-axis.
  double get y => this[13];

  /// Sets the y-translation component of the matrix.
  ///
  /// @param value The new y-translation value
  set y(double value) {
    this[13] = value;
  }

  /// Gets the translation components as an [Offset].
  ///
  /// This combines the x and y translation values into a single [Offset] object.
  Offset get offset => Offset(x, y);

  /// Sets both x and y translation components from an [Offset].
  ///
  /// @param value The [Offset] containing new x and y translation values
  set offset(Offset value) {
    x = value.dx;
    y = value.dy;
  }

  /// Translates the coordinate system by the specified [Offset].
  ///
  /// This adds the offset's components to the current translation values,
  /// effectively moving the coordinate system relative to its current position.
  ///
  /// @param offset The [Offset] by which to translate the coordinate system
  void traslateByOffset(Offset offset) {
    x += offset.dx;
    y += offset.dy;
  }

  /// Creates an initial transformation matrix that fits the diagram within the viewport.
  ///
  /// @param diagramRect The rectangle containing the diagram content
  /// @param viewportSize The size of the viewport
  /// @return A new Matrix4 with appropriate scale and translation
  static Matrix4 getInitialMatrix({
    required Rect diagramRect,
    required Size viewportSize,
  }) {
    final matrix = Matrix4.identity();

    if (diagramRect == Rect.zero || viewportSize == Size.zero) {
      return matrix;
    }

    final scaleX = viewportSize.width / diagramRect.width;
    final scaleY = viewportSize.height / diagramRect.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    matrix.zoom = scale * 0.9; // 90% to leave some margin
    matrix.x = (viewportSize.width - diagramRect.width * matrix.zoom) / 2 -
        diagramRect.left * matrix.zoom;
    matrix.y = (viewportSize.height - diagramRect.height * matrix.zoom) / 2 -
        diagramRect.top * matrix.zoom;

    return matrix;
  }
}

/// Extension on [double] that provides utility methods for numeric precision.
///
/// This extension makes it easier to handle floating-point precision issues
/// that can occur during transformation calculations.
extension Ex on double {
  /// Rounds the double to a specified number of decimal places.
  ///
  /// This is useful for reducing floating-point precision errors and
  /// providing more predictable values for display or comparison.
  ///
  /// @param n The number of decimal places to preserve
  /// @return A new double value with the specified precision
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
