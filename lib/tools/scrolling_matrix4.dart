import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

extension ScrollingMatrix4 on Matrix4 {
  // Scale
  double get zoom => this[0];
  set zoom(double newScale) {
    this[0] = newScale;
    this[5] = newScale;
  }

  // X translation
  double get x => this[12];
  set x(double value) {
    this[12] = value;
  }

  // Y translation
  double get y => this[13];
  set y(double value) {
    this[13] = value;
  }

  // Offset
  Offset get offset => Offset(x, y);

  set offset(Offset value) {
    x = value.dx;
    y = value.dy;
  }

  Offset get oppositeOffset => Offset(-x, -y);

  void traslateByOffset(Offset offset) {
    x += offset.dx;
    y += offset.dy;
  }
}

extension ScrollingOffset on Offset {
  Offset translateByOffset(Offset translation) =>
      Offset(dx + translation.dx, dy + translation.dy);
  Vector4 vector4() => Vector4(dx, dy, 0.0, 1);
}

extension Ext on Vector4 {
  Offset toOffset() => Offset(x, y);
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
