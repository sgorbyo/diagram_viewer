import 'dart:async';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'transform2d_utils.dart';
import 'transform2d_converter.dart';

/// Handles animations for Transform2D operations.
///
/// This class provides smooth animations for:
/// - Elastic bounce-back when exceeding bounds
/// - Inertial scrolling
/// - Initial fit-to-viewport
/// - Smooth transitions between states
///
/// These animations are migrated from the legacy ScrollingBloc to work with
/// the new Transform2D architecture.
class Transform2DAnimator {
  final TickerProvider vsync;
  final Duration defaultDuration;
  final Curve defaultCurve;

  Transform2DAnimator({
    required this.vsync,
    this.defaultDuration = const Duration(milliseconds: 300),
    this.defaultCurve = Curves.easeInOut,
  });

  /// Animates a transform to a target transform with elastic bounce-back.
  ///
  /// This animation is used when the user drags the diagram beyond its bounds
  /// and then releases, causing it to bounce back to the valid area.
  ///
  /// [from] - The starting transform
  /// [to] - The target transform
  /// [onUpdate] - Callback called during animation
  /// [onComplete] - Callback called when animation completes
  /// Returns a Future that completes when the animation finishes
  Future<void> animateElasticBounceBack({
    required Transform2D from,
    required Transform2D to,
    required ValueChanged<Transform2D> onUpdate,
    VoidCallback? onComplete,
  }) {
    return _animateTransform(
      from: from,
      to: to,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      onUpdate: onUpdate,
      onComplete: onComplete,
    );
  }

  /// Animates inertial scrolling based on velocity.
  ///
  /// This animation simulates natural deceleration when the user stops dragging,
  /// creating a smooth scrolling experience.
  ///
  /// [from] - The starting transform
  /// [velocity] - The velocity vector in pixels per second
  /// [diagramRect] - The logical bounds of the diagram
  /// [size] - The viewport size
  /// [onUpdate] - Callback called during animation
  /// [onComplete] - Callback called when animation completes
  /// Returns a Future that completes when the animation finishes
  Future<void> animateInertial({
    required Transform2D from,
    required Offset velocity,
    required Rect diagramRect,
    required Size size,
    required ValueChanged<Transform2D> onUpdate,
    VoidCallback? onComplete,
  }) {
    final (targetTransform, duration) = Transform2DUtils.calculateInertialAnimation(
      startTransform: from,
      velocity: velocity,
      diagramRect: diagramRect,
      size: size,
    );

    if (duration.inMilliseconds == 0) {
      onComplete?.call();
      return Future.value();
    }

    return _animateTransform(
      from: from,
      to: targetTransform,
      duration: duration,
      curve: Curves.easeOut,
      onUpdate: onUpdate,
      onComplete: onComplete,
    );
  }

  /// Animates the initial fit-to-viewport.
  ///
  /// This animation is used when the diagram is first loaded or when
  /// the user requests a fit-to-viewport operation.
  ///
  /// [from] - The starting transform
  /// [to] - The target transform (fit-to-viewport)
  /// [onUpdate] - Callback called during animation
  /// [onComplete] - Callback called when animation completes
  /// Returns a Future that completes when the animation finishes
  Future<void> animateInitialFit({
    required Transform2D from,
    required Transform2D to,
    required ValueChanged<Transform2D> onUpdate,
    VoidCallback? onComplete,
  }) {
    return _animateTransform(
      from: from,
      to: to,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      onUpdate: onUpdate,
      onComplete: onComplete,
    );
  }

  /// Animates a smooth transition between two transforms.
  ///
  /// This is a general-purpose animation method for smooth transitions.
  ///
  /// [from] - The starting transform
  /// [to] - The target transform
  /// [duration] - The animation duration
  /// [curve] - The animation curve
  /// [onUpdate] - Callback called during animation
  /// [onComplete] - Callback called when animation completes
  /// Returns a Future that completes when the animation finishes
  Future<void> _animateTransform({
    required Transform2D from,
    required Transform2D to,
    required Duration duration,
    required Curve curve,
    required ValueChanged<Transform2D> onUpdate,
    VoidCallback? onComplete,
  }) {
    final controller = AnimationController(
      duration: duration,
      vsync: vsync,
    );

    final animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: curve,
    ));

    animation.addListener(() {
      final interpolatedTransform = Transform2DConverter.lerp(from, to, animation.value);
      onUpdate(interpolatedTransform);
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onComplete?.call();
      }
    });

    controller.forward();

    return controller.forward().then((_) {
      controller.dispose();
    });
  }

  /// Animates a transform with custom interpolation.
  ///
  /// This method allows for custom interpolation between transforms,
  /// useful for complex animations.
  ///
  /// [from] - The starting transform
  /// [to] - The target transform
  /// [duration] - The animation duration
  /// [interpolator] - Custom interpolation function
  /// [onUpdate] - Callback called during animation
  /// [onComplete] - Callback called when animation completes
  /// Returns a Future that completes when the animation finishes
  Future<void> animateWithCustomInterpolation({
    required Transform2D from,
    required Transform2D to,
    required Duration duration,
    required Transform2D Function(Transform2D, Transform2D, double) interpolator,
    required ValueChanged<Transform2D> onUpdate,
    VoidCallback? onComplete,
  }) {
    final controller = AnimationController(
      duration: duration,
      vsync: vsync,
    );

    final animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: defaultCurve,
    ));

    animation.addListener(() {
      final interpolatedTransform = interpolator(from, to, animation.value);
      onUpdate(interpolatedTransform);
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onComplete?.call();
      }
    });

    controller.forward();

    return controller.forward().then((_) {
      controller.dispose();
    });
  }
}
