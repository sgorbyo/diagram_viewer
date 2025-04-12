import 'package:flutter/material.dart';
import 'dart:math';

import 'package:diagram_viewer/tools/scrolling_matrix4.dart';

/// Constrains a proposed scale value to be within the allowable range.
///
/// This function ensures the scale value doesn't exceed maximum or minimum bounds,
/// which helps maintain reasonable zoom levels during diagram interaction.
///
/// @param proposedNewScale The scale value suggested by user interaction
/// @param maxAllowableScale The maximum scale value permitted
/// @param minAllowableScale The minimum scale value permitted
/// @return The constrained scale value
double correctedScaleForEndEvent({
  required double proposedNewScale,
  required double maxAllowableScale,
  required double minAllowableScale,
}) {
  double result;

  result = proposedNewScale.clamp(minAllowableScale, maxAllowableScale);

  return result;
}

/// Calculates the minimum static X-offset based on the viewing area and diagram dimensions.
///
/// This function determines how far left the diagram can be scrolled, considering
/// the current scale and the diagram's size relative to the viewing area.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param diagramRect The bounding rectangle of the diagram
/// @return The minimum allowable X-offset
double minStaticOffsetX({
  required Size clientRectPixelSize,
  required double appliedScale,
  required Rect diagramRect,
}) {
  final Offset minScaleXY = minStaticScaleXY(
    clientRectPixelSize: clientRectPixelSize,
    diagramSize: diagramRect.size,
  );
  return appliedScale >= minScaleXY.dx
      ? -diagramRect.left * appliedScale
      : (clientRectPixelSize.width - diagramRect.width * appliedScale) / 2.0 -
          diagramRect.left * appliedScale;
}

/// Calculates the minimum static Y-offset based on the viewing area and diagram dimensions.
///
/// This function determines how far up the diagram can be scrolled, considering
/// the current scale and the diagram's size relative to the viewing area.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param diagramRect The bounding rectangle of the diagram
/// @return The minimum allowable Y-offset
double minStaticOffsetY({
  required Size clientRectPixelSize,
  required double appliedScale,
  required Rect diagramRect,
}) {
  final Offset minScaleXY = minStaticScaleXY(
    clientRectPixelSize: clientRectPixelSize,
    diagramSize: diagramRect.size,
  );
  return appliedScale >= minScaleXY.dy
      ? -diagramRect.top * appliedScale
      : (clientRectPixelSize.height - diagramRect.height * appliedScale) / 2.0 -
          diagramRect.top * appliedScale;
}

/// Calculates the maximum static X-offset based on the viewing area and diagram dimensions.
///
/// This function determines how far right the diagram can be scrolled, considering
/// the current scale and the diagram's size relative to the viewing area.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param diagramRect The bounding rectangle of the diagram
/// @return The maximum allowable X-offset
double maxStaticOffsetX({
  required Size clientRectPixelSize,
  required double appliedScale,
  required Rect diagramRect,
}) {
  final Offset minScaleXY = minStaticScaleXY(
    clientRectPixelSize: clientRectPixelSize,
    diagramSize: diagramRect.size,
  );
  return appliedScale >= minScaleXY.dx
      ? clientRectPixelSize.width - diagramRect.right * appliedScale
      : minStaticOffsetX(
          clientRectPixelSize: clientRectPixelSize,
          appliedScale: appliedScale,
          diagramRect: diagramRect,
        );
}

/// Calculates the maximum static Y-offset based on the viewing area and diagram dimensions.
///
/// This function determines how far down the diagram can be scrolled, considering
/// the current scale and the diagram's size relative to the viewing area.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param diagramRect The bounding rectangle of the diagram
/// @return The maximum allowable Y-offset
double maxStaticOffsetY({
  required Size clientRectPixelSize,
  required double appliedScale,
  required Rect diagramRect,
}) {
  final Offset minScaleXY = minStaticScaleXY(
    clientRectPixelSize: clientRectPixelSize,
    diagramSize: diagramRect.size,
  );
  return appliedScale >= minScaleXY.dy
      ? clientRectPixelSize.height - diagramRect.bottom * appliedScale
      : minStaticOffsetY(
          clientRectPixelSize: clientRectPixelSize,
          appliedScale: appliedScale,
          diagramRect: diagramRect,
        );
}

/// Combines maximum X and Y offsets into a single [Offset] object.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param diagramRect The bounding rectangle of the diagram
/// @return An [Offset] containing maximum allowable X and Y offsets
Offset maxStaticOffset({
  required Size clientRectPixelSize,
  required double appliedScale,
  required Rect diagramRect,
}) =>
    Offset(
        maxStaticOffsetX(
          clientRectPixelSize: clientRectPixelSize,
          appliedScale: appliedScale,
          diagramRect: diagramRect,
        ),
        maxStaticOffsetY(
          clientRectPixelSize: clientRectPixelSize,
          appliedScale: appliedScale,
          diagramRect: diagramRect,
        ));

/// Combines minimum X and Y offsets into a single [Offset] object.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param diagramRect The bounding rectangle of the diagram
/// @return An [Offset] containing minimum allowable X and Y offsets
Offset minStaticOffset({
  required Size clientRectPixelSize,
  required double appliedScale,
  required Rect diagramRect,
}) =>
    Offset(
        minStaticOffsetX(
          clientRectPixelSize: clientRectPixelSize,
          appliedScale: appliedScale,
          diagramRect: diagramRect,
        ),
        minStaticOffsetY(
          clientRectPixelSize: clientRectPixelSize,
          appliedScale: appliedScale,
          diagramRect: diagramRect,
        ));

/// Calculates the minimum static scale factors separately for X and Y dimensions.
///
/// This function determines the minimum scale factors needed to fit the diagram
/// within the client viewing area along each axis.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param diagramSize The size of the diagram content
/// @return An [Offset] containing minimum scale factors for X and Y dimensions
Offset minStaticScaleXY({
  required Size clientRectPixelSize,
  required Size diagramSize,
}) {
  return Offset(clientRectPixelSize.width / diagramSize.width,
      clientRectPixelSize.height / diagramSize.height);
}

/// Calculates the minimum static scale factor to fit the diagram within the viewing area.
///
/// This returns the smaller of the X and Y scale factors, ensuring the diagram
/// fits completely within the viewing area.
///
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param diagramSize The size of the diagram content
/// @return The minimum scale factor that ensures the diagram fits within the viewing area
double minStaticScale({
  required Size clientRectPixelSize,
  required Size diagramSize,
}) {
  final Offset minXY = minStaticScaleXY(
      clientRectPixelSize: clientRectPixelSize, diagramSize: diagramSize);
  return min(minXY.dx, minXY.dy);
}

/// Ensures an offset is within the allowable range when scrolling ends.
///
/// This function prevents the diagram from being scrolled beyond its boundaries
/// by clamping the offset to the minimum and maximum allowable values.
///
/// @param offsetToCheck The offset to validate and correct
/// @param diagramRect The bounding rectangle of the diagram
/// @param clientRectPixelSize The size of the viewing area in pixels
/// @param appliedScale The current scale factor applied to the diagram
/// @param maxAllowableStaticOffset The maximum allowable offset values
/// @param minAllowableStaticOffset The minimum allowable offset values
/// @return The corrected offset that keeps the diagram within bounds
Offset correctedOffsetForEndEvent({
  required Offset offsetToCheck,
  required Rect diagramRect,
  required Size clientRectPixelSize,
  required double appliedScale,
  required Offset maxAllowableStaticOffset,
  required Offset minAllowableStaticOffset,
}) {
  Offset resultOffset = offsetToCheck;

  resultOffset = offsetSafeClamp(
      offsetToCheck, maxAllowableStaticOffset, minAllowableStaticOffset);

  return resultOffset;
}

/// Safely clamps an [Offset] between minimum and maximum values.
///
/// This function ensures that both X and Y components of the offset are
/// independently constrained to their respective bounds.
///
/// @param toClamp The offset to be clamped
/// @param min The minimum allowable offset values
/// @param max The maximum allowable offset values
/// @return The clamped offset with each component within its respective bounds
Offset offsetSafeClamp(Offset toClamp, Offset min, Offset max) {
  Offset result = toClamp;
  if (result.dx < min.dx) {
    result = Offset(min.dx, result.dy);
  } else if (result.dx > max.dx) {
    result = Offset(max.dx, result.dy);
  }
  if (result.dy < min.dy) {
    result = Offset(result.dx, min.dy);
  } else if (result.dy > max.dy) {
    result = Offset(result.dx, max.dy);
  }
  return result;
}

/// Normalizes a [Matrix4] by ensuring its scale and translation components
/// are within allowable ranges.
///
/// This function is useful for correcting a transformation matrix after user
/// interactions to ensure the diagram stays within viewable bounds and maintains
/// reasonable zoom levels.
///
/// @param sourceMatrix The original matrix to normalize
/// @param minScale The minimum allowable scale value
/// @param maxScale The maximum allowable scale value
/// @param minOffset The minimum allowable offset values
/// @param maxOffset The maximum allowable offset values
/// @return A new normalized [Matrix4] with constrained values
Matrix4 normalizeMatrix4({
  required Matrix4 sourceMatrix,
  required double minScale,
  required double maxScale,
  required Offset minOffset,
  required Offset maxOffset,
}) {
  final Offset correctOffset = offsetSafeClamp(
      Offset(sourceMatrix[12], sourceMatrix[13]), maxOffset, minOffset);
  final Matrix4 result = Matrix4.copy(sourceMatrix);
  result[0] = result[0].clamp(minScale, maxScale);
  result[5] = result[0];
  result[12] = correctOffset.dx;
  result[13] = correctOffset.dy;
  return result;
}

/// Creates a translation-only transformation matrix.
///
/// @param translation The offset by which to translate
/// @return A [Matrix4] representing the translation
Matrix4 _translate(Offset translation) {
  final double dx = translation.dx;
  final double dy = translation.dy;

  //  ..[0]  = 1       # x scale
  //  ..[5]  = 1       # y scale
  //  ..[10] = 1       # diagonal "one"
  //  ..[12] = dx      # x translation
  //  ..[13] = dy      # y translation
  //  ..[15] = 1       # diagonal "one"
  return Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
}

/// Creates a scaling transformation matrix with a focal point.
///
/// The focal point represents the center around which scaling occurs, allowing
/// for zoom operations that are anchored to a specific point (e.g., cursor position).
///
/// @param scale The scale factor to apply
/// @param focalPoint The point around which to scale
/// @return A [Matrix4] representing the scale transformation
Matrix4 _scale(double scale, Offset focalPoint) {
  final double dx = (1 - scale) * focalPoint.dx;
  final double dy = (1 - scale) * focalPoint.dy;

  //  ..[0]  = scale   # x scale
  //  ..[5]  = scale   # y scale
  //  ..[10] = 1       # diagonal "one"
  //  ..[12] = dx      # x translation
  //  ..[13] = dy      # y translation
  //  ..[15] = 1       # diagonal "one"
  return Matrix4(scale, 0, 0, 0, 0, scale, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
}

/// Applies a translation to a [Matrix4] transformation matrix.
///
/// This function multiplies the input matrix by a translation matrix
/// to produce a new matrix that represents the combined transformation.
///
/// @param matrix The original transformation matrix
/// @param translationDelta The offset by which to translate
/// @return A new [Matrix4] with the translation applied
Matrix4 translateMatrix({
  required Matrix4 matrix,
  required Offset translationDelta,
}) {
  final Matrix4 translationDeltaMatrix = _translate(translationDelta);
  // ignore: unnecessary_parenthesis
  return (translationDeltaMatrix * matrix) as Matrix4;
}

/// Applies a scale transformation to a [Matrix4] transformation matrix.
///
/// This function multiplies the input matrix by a scale matrix to produce
/// a new matrix that represents the combined transformation.
///
/// @param matrix The original transformation matrix
/// @param scaleDelta The scale factor to apply
/// @param focalPoint The point around which to scale
/// @return A new [Matrix4] with the scale applied
Matrix4 scaleMatrix({
  required Matrix4 matrix,
  required double scaleDelta,
  required Offset focalPoint,
}) {
  final Matrix4 scaleDeltaMatrix = _scale(scaleDelta, focalPoint);
  // ignore: unnecessary_parenthesis
  return (scaleDeltaMatrix * matrix as Matrix4);
}

/// Calculates the Euclidean distance between the translation components of two matrices.
///
/// This function is useful for determining how much the view position has changed
/// between two transformation states.
///
/// @param matrix1 The first transformation matrix
/// @param matrix2 The second transformation matrix
/// @return The distance between the translation components
double distanceTranslationBetweenMatrices(Matrix4 matrix1, Matrix4 matrix2) {
  return sqrt(pow(matrix2.x - matrix1.x, 2) + pow(matrix2.y - matrix1.y, 2));
}

/// Calculates the difference between the scale components of two matrices.
///
/// This function is useful for determining how much the zoom level has changed
/// between two transformation states.
///
/// @param matrix1 The first transformation matrix
/// @param matrix2 The second transformation matrix
/// @return The magnitude of the scale difference
double distanceScaleBetweenMatrices(Matrix4 matrix1, Matrix4 matrix2) {
  return sqrt(pow(matrix2.zoom, 2) - pow(matrix1.zoom, 2));
}
