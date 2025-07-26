import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Global test configuration and utilities
class TestConfig {
  /// Default timeout for async operations in tests
  static const Duration defaultTimeout = Duration(seconds: 30);

  /// Default delay for stream operations
  static const Duration streamDelay = Duration(milliseconds: 100);

  /// Default test object bounds
  static const Rect defaultBounds = Rect.fromLTWH(0, 0, 100, 100);

  /// Default viewport size for widget tests
  static const Size defaultViewportSize = Size(800, 600);

  /// Default diagram content for testing
  static const List<Map<String, dynamic>> defaultTestObjects = [
    {
      'id': 'test-1',
      'bounds': [0, 0, 100, 100],
      'color': 'red',
    },
    {
      'id': 'test-2',
      'bounds': [100, 100, 100, 100],
      'color': 'blue',
    },
  ];
}

/// Test tags for organizing and filtering tests
class TestTags {
  static const String unit = 'unit';
  static const String integration = 'integration';
  static const String widget = 'widget';
  static const String bloc = 'bloc';
  static const String example = 'example';
  static const String slow = 'slow';
  static const String fast = 'fast';
}

/// Test utilities for common operations
class TestUtils {
  /// Creates a test object with default properties
  static Map<String, dynamic> createTestObject({
    String? id,
    List<double>? bounds,
    String? color,
  }) {
    return {
      'id': id ?? 'test-${DateTime.now().millisecondsSinceEpoch}',
      'bounds': bounds ?? [0, 0, 100, 100],
      'color': color ?? 'red',
    };
  }

  /// Waits for stream operations to complete
  static Future<void> waitForStream() async {
    await Future.delayed(TestConfig.streamDelay);
  }

  /// Creates a mock repository with test data
  static Future<void> setupMockRepository() async {
    // Common setup for repository tests
  }
}
