import 'dart:async';
import 'package:flutter/material.dart';

/// Service to perform inertial scrolling with decaying velocity.
///
/// Discrete integration using a fixed interval. Velocity is decayed each tick
/// by multiplying with [frictionFactor] (e.g., 0.95). The loop stops when the
/// velocity magnitude drops below [minStopVelocity] or when [maxDuration]
/// elapses. Call [stop] to cancel immediately.
class InertialScrollService {
  Timer? _timer;
  Offset _velocity = Offset.zero; // px/s in viewer physical space
  bool _active = false;
  Duration _elapsed = Duration.zero;

  bool get isActive => _active && _timer != null;

  void start({
    required Offset initialVelocity,
    required Duration interval,
    required double frictionFactor,
    required double minStopVelocity,
    required Duration maxDuration,
    required void Function(Offset delta) onTick,
    required VoidCallback onStop,
  }) {
    stop();
    _velocity = initialVelocity;
    _elapsed = Duration.zero;
    if (_isNearZero(_velocity)) {
      onStop();
      return;
    }
    _active = true;
    _timer = Timer.periodic(interval, (t) {
      if (!_active) {
        _cancelTimer();
        return;
      }
      _elapsed += interval;
      final dt = interval.inMilliseconds / 1000.0;
      final delta = Offset(_velocity.dx * dt, _velocity.dy * dt);
      onTick(delta);
      // Decay velocity
      _velocity =
          Offset(_velocity.dx * frictionFactor, _velocity.dy * frictionFactor);
      // Stop conditions
      if (_velocity.distance < minStopVelocity || _elapsed >= maxDuration) {
        stop();
        onStop();
      }
    });
  }

  void stop() {
    _cancelTimer();
    _velocity = Offset.zero;
    _elapsed = Duration.zero;
    _active = false;
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  bool _isNearZero(Offset v) => v.dx.abs() < 0.0001 && v.dy.abs() < 0.0001;

  void dispose() => stop();
}
