import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_bloc.dart';
import 'package:diagram_viewer/internal/blocs/transform/transform_event.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  test('Bounce-back snaps even for tiny overscroll (< epsilon)', () async {
    // Arrange a bloc with reasonable bounds
    const cfg = DiagramConfiguration();
    final bloc = TransformBloc(
      configuration: cfg,
      diagramRect: const Rect.fromLTWH(0, 0, 2000, 1200),
      viewportSize: const Size(800, 600),
    );

    // Compute strict legal transform at current state
    final st0 = bloc.state;
    final strict = Transform2DUtils.capTransformWithZoomLimits(
      transform: st0.transform,
      diagramRect: st0.diagramRect,
      size: st0.viewportSize,
      dynamic: false,
      minZoom: cfg.minZoom,
      maxZoom: cfg.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );

    // Prepare a start transform slightly outside strict by a tiny amount (0.2 px),
    // but within the elastic (dynamic) window so it is accepted as-is.
    const tiny = 0.2;
    final overscrolled = Transform2D(
      scale: strict.scale,
      translation: Offset(strict.translation.dx - tiny, strict.translation.dy),
      rotation: strict.rotation,
    );

    // Enable dynamic capping on update to accept the overscroll
    bloc.setFrozenDuringDrag(true);
    bloc.add(TransformEvent.updateTransform(transform: overscrolled));
    await Future<void>.delayed(const Duration(milliseconds: 1));

    final st1 = bloc.state;
    // Sanity: we are indeed slightly outside strict
    expect((st1.transform.translation - strict.translation).dx.abs() > 0.0,
        isTrue);
    expect((st1.transform.translation - strict.translation).dx.abs() < 1.0,
        isTrue);

    // Act: request bounce-back with zero duration (should snap immediately)
    bloc.bounceBack(Duration.zero);

    // Assert: final state must be snapped to strict bounds (no residual overscroll)
    final st2 = bloc.state;
    expect((st2.transform.translation - strict.translation).distance < 0.01,
        isTrue);

    await bloc.close();
  });
}
