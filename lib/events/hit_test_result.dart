import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

part 'hit_test_result.freezed.dart';

/// Result of hit-testing with distance information
@freezed
class HitTestResult with _$HitTestResult {
  const factory HitTestResult({
    required DiagramObjectEntity object,
    required double distanceFromCenter, // Distanza dal centro dell'oggetto
    required Offset hitPoint, // Punto esatto di collisione
  }) = _HitTestResult;
}
