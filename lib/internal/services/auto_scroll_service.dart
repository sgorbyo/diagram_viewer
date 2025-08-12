import 'dart:async';
import 'package:flutter/material.dart';

/// Internal service that encapsulates the timer-driven auto-scroll loop.
///
/// Usage:
/// - call [startOrUpdate] with the current velocity and interval; provide an
///   [onTick] that will be invoked every interval with the computed delta
///   (velocity * dtSeconds).
/// - call [stop] to immediately cancel the loop.
class AutoScrollService {
  Timer? _timer;
  Offset _velocity = Offset.zero;
  bool _active = false;

  bool get isActive => _active && _timer != null;

  /// Start the loop if not already running, or update the current velocity.
  /// If velocity is approximately zero, the loop is canceled.
  void startOrUpdate({
    required Offset velocity,
    required Duration interval,
    required void Function(Offset delta) onTick,
  }) {
    _velocity = velocity;

    // If velocity ~ zero, stop the loop
    if (_isNearZero(_velocity)) {
      stop();
      return;
    }

    // Already running: just keep updated velocity
    if (isActive) return;

    _active = true;
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) {
      if (!_active) {
        _timer?.cancel();
        _timer = null;
        return;
      }

      final dtSeconds = interval.inMilliseconds / 1000.0;
      final delta = Offset(_velocity.dx * dtSeconds, _velocity.dy * dtSeconds);
      onTick(delta);
    });
  }

  /// Immediately stops the loop and resets state.
  void stop() {
    _timer?.cancel();
    _timer = null;
    _velocity = Offset.zero;
    _active = false;
  }

  bool _isNearZero(Offset v) => v.dx.abs() < 0.0001 && v.dy.abs() < 0.0001;

  void dispose() {
    stop();
  }
}
