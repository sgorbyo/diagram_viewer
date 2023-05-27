import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class DiagramObjectEntity extends Equatable {
  Rect enclosingRect();
  void printOnCanvas({required Canvas canvas});
}
