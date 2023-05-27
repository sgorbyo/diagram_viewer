import 'package:flutter/material.dart';
import 'dart:math';

import 'package:diagram_viewer/tools/scrolling_matrix4.dart';

double correctedScaleForEndEvent({
  required double proposedNewScale,
  required double maxAllowableScale,
  required double minAllowableScale,
}) {
  double result;

  print(
    'Scala prima del check: $proposedNewScale, scala massima: $maxAllowableScale, scala minima: $minAllowableScale',
  );
  result = proposedNewScale.clamp(minAllowableScale, maxAllowableScale);

  print('Delta scala proposto: $result');
  return result;
}

/// La minima coordinata x statica per l'offset
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

/// La minima coordinata y statica per l'offset
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

/// La massima coordinata x statica per l'offset
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

//
/// La massima coordinata y statica per l'offset
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

/// Calcola il minimo livello di scala statico separatamente per X e Y e pone il risultato in un Offset.
///
/// [clientRectPixelSize] è la dimensione in pixel del widget e [diagramSize] quella del diagramma da mostrare.
Offset minStaticScaleXY({
  required Size clientRectPixelSize,
  required Size diagramSize,
}) {
  return Offset(clientRectPixelSize.width / diagramSize.width,
      clientRectPixelSize.height / diagramSize.height);
}

/// Il minimo livello di scala statico
double minStaticScale({
  required Size clientRectPixelSize,
  required Size diagramSize,
}) {
  final Offset minXY = minStaticScaleXY(
      clientRectPixelSize: clientRectPixelSize, diagramSize: diagramSize);
  return min(minXY.dx, minXY.dy);
}

Offset correctedOffsetForEndEvent({
  required Offset offsetToCheck,
  required Rect diagramRect,
  required Size clientRectPixelSize,
  required double appliedScale,
  required Offset maxAllowableStaticOffset,
  required Offset minAllowableStaticOffset,
}) {
  Offset resultOffset = offsetToCheck;

  print('Offset da correggere: (${offsetToCheck.dx}, ${offsetToCheck.dy})');
  print(
      'Larghezza diagramma: ${diagramRect.width}, altezza diagramma: ${diagramRect.height}');
  print(
      'dimensioni schermo in pixel: $clientRectPixelSize e in scala ho larghezza: ${clientRectPixelSize.width / appliedScale}, '
      'altezza: ${clientRectPixelSize.height / appliedScale}');

  resultOffset = offsetSafeClamp(
      offsetToCheck, maxAllowableStaticOffset, minAllowableStaticOffset);

  if (resultOffset.dx.abs() > 5000 || resultOffset.dy.abs() > 5000) {
    print('$resultOffset');
  }

  return resultOffset;
}

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
  result[0] = result[0].clamp(minScale, maxScale) as double;
  result[5] = result[0];
  result[12] = correctOffset.dx;
  result[13] = correctOffset.dy;
  return result;
}

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

Matrix4 translateMatrix({
  required Matrix4 matrix,
  required Offset translationDelta,
}) {
  final Matrix4 translationDeltaMatrix = _translate(translationDelta);
  // ignore: unnecessary_parenthesis
  return (translationDeltaMatrix * matrix) as Matrix4;
}

Matrix4 scaleMatrix({
  required Matrix4 matrix,
  required double scaleDelta,
  required Offset focalPoint,
}) {
  final Matrix4 scaleDeltaMatrix = _scale(scaleDelta, focalPoint);
  // ignore: unnecessary_parenthesis
  return (scaleDeltaMatrix * matrix as Matrix4);
}

double distanceTranslationBetweenMatrices(Matrix4 matrix1, Matrix4 matrix2) {
  return sqrt(pow(matrix2.x - matrix1.x, 2) + pow(matrix2.y - matrix1.y, 2));
}

double distanceScaleBetweenMatrices(Matrix4 matrix1, Matrix4 matrix2) {
  return sqrt(pow(matrix2.zoom, 2) - pow(matrix1.zoom, 2));
}
