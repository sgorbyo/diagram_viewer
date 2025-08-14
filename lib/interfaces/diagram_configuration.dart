import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagram_configuration.freezed.dart';

/// Configuration class that defines all configurable parameters for the DiagramViewer.
///
/// This class provides the DiagramViewer with settings for:
/// - Visual appearance (background color, etc.)
/// - Interaction behavior (edge thresholds, zoom limits, etc.)
/// - Animation parameters (bounce duration, auto-scroll intervals, etc.)
///
/// Clients can customize these settings based on their diagram type and user preferences.
///
/// ## Example Usage
///
/// ```dart
/// final config = DiagramConfiguration(
///   backgroundColor: Colors.white,
///   edgeThreshold: 50.0,
///   maxZoom: 10.0,
///   minZoom: 0.1,
///   overscrollPixels: 100.0,
///   bounceDuration: Duration(milliseconds: 300),
///   autoScrollInterval: Duration(milliseconds: 16),
///   autoScrollAcceleration: 1.5,
/// );
/// ```
@freezed
class DiagramConfiguration with _$DiagramConfiguration {
  const factory DiagramConfiguration({
    /// Background color of the diagram area.
    ///
    /// This color is used to fill the area where diagram content is displayed.
    /// Defaults to white.
    @Default(Colors.white) Color backgroundColor,

    /// Color of the area outside the diagram bounds.
    ///
    /// This color is used to fill areas outside the logical diagram extent.
    /// Defaults to a light gray.
    @Default(Color(0xFF808080)) Color outsideColor,

    /// Distance from viewport edge that triggers auto-scroll.
    ///
    /// When an object is dragged within this distance from the viewport edge,
    /// the DiagramViewer will automatically scroll to follow the object.
    /// Defaults to 50.0 pixels.
    @Default(50.0) double edgeThreshold,

    /// Maximum zoom level allowed.
    ///
    /// Users cannot zoom in beyond this level. This prevents excessive zooming
    /// that could cause performance issues or make the diagram unusable.
    /// Defaults to 10.0 (10x zoom).
    @Default(10.0) double maxZoom,

    /// Minimum zoom level allowed.
    ///
    /// Users cannot zoom out beyond this level. This ensures the diagram
    /// remains visible and usable.
    /// Defaults to 0.1 (10% zoom).
    @Default(0.1) double minZoom,

    /// Number of pixels allowed for overscroll.
    ///
    /// Users can scroll beyond the diagram bounds by this amount before
    /// the elastic bounce-back animation is triggered.
    /// Defaults to 100.0 pixels.
    @Default(100.0) double overscrollPixels,

    /// Duration of the elastic bounce-back animation.
    ///
    /// When users scroll beyond the diagram bounds, this animation returns
    /// the view to valid bounds with a smooth elastic effect.
    /// Defaults to 300 milliseconds.
    @Default(Duration(milliseconds: 300)) Duration bounceDuration,

    /// Curve of the elastic bounce-back animation.
    ///
    /// Controls the easing of the bounce-back. Defaults to easeOutCubic.
    @Default(Curves.easeOutCubic) Curve bounceCurve,

    /// Interval between auto-scroll steps.
    ///
    /// When auto-scrolling is active, this defines how frequently the
    /// scroll position is updated. Lower values provide smoother scrolling
    /// but may impact performance.
    /// Defaults to 16 milliseconds (60 FPS).
    @Default(Duration(milliseconds: 16)) Duration autoScrollInterval,

    /// Acceleration factor for auto-scroll.
    ///
    /// This factor determines how quickly auto-scroll accelerates as objects
    /// get closer to the viewport edge. Higher values provide more responsive
    /// auto-scrolling.
    /// Defaults to 1.5.
    @Default(1.5) double autoScrollAcceleration,

    /// Whether to enable translation (pan) gestures.
    ///
    /// When true, users can pan the diagram by dragging. When false,
    /// panning is disabled.
    /// Defaults to true.
    @Default(true) bool enableTranslation,

    /// Whether to enable scale (zoom) gestures.
    ///
    /// When true, users can zoom the diagram using pinch gestures or
    /// mouse wheel. When false, zooming is disabled.
    /// Defaults to true.
    @Default(true) bool enableScale,

    /// Whether to enable rotation gestures.
    ///
    /// When true, users can rotate the diagram using gesture combinations.
    /// When false, rotation is disabled.
    /// Defaults to false.
    @Default(false) bool enableRotation,

    /// Whether to clip content to the diagram bounds.
    ///
    /// When true, content outside the diagram bounds is clipped and not visible.
    /// When false, content can be rendered outside the bounds.
    /// Defaults to true.
    @Default(true) bool clipContent,

    /// Whether to enable inertial scrolling.
    ///
    /// When true, scrolling continues with inertia after the user stops dragging,
    /// gradually slowing down. When false, scrolling stops immediately.
    /// Defaults to true.
    @Default(true) bool enableInertialScrolling,

    /// Friction factor for inertial scrolling.
    ///
    /// This factor determines how quickly inertial scrolling slows down.
    /// Higher values provide more friction and shorter inertial scrolling.
    /// Defaults to 0.95.
    @Default(0.95) double inertialFriction,

    /// Whether to enable keyboard shortcuts.
    ///
    /// When true, keyboard shortcuts for pan, zoom, and other operations
    /// are enabled. When false, keyboard shortcuts are disabled.
    /// Defaults to true.
    @Default(true) bool enableKeyboardShortcuts,

    /// Whether to enable accessibility features.
    ///
    /// When true, accessibility features like screen reader support
    /// are enabled. When false, accessibility features are disabled.
    /// Defaults to true.
    @Default(true) bool enableAccessibility,

    /// Enable verbose BLoC transitions logging for debugging.
    /// Only used in debug builds; ignored in release.
    @Default(false) bool enableBlocDebugObserver,

    /// Enable snap-to-grid for object centers in logical space.
    ///
    /// When true, the controller may snap object centers to the nearest grid
    /// node during drag of existing objects and at drop time for DnD.
    /// Defaults to false (backward compatible).
    @Default(false) bool snapGridEnabled,

    /// Grid spacing in logical units.
    ///
    /// Defines the distance between adjacent grid nodes. Defaults to 16.0.
    @Default(16.0) double snapGridSpacing,

    /// Grid origin in logical coordinates.
    ///
    /// The grid nodes are aligned such that the origin is a grid node.
    /// Defaults to Offset.zero.
    @Default(Offset.zero) Offset snapGridOrigin,

    /// Whether to show an optional visual grid overlay.
    ///
    /// Rendering is lightweight and performed in logical space. Defaults to
    /// false to preserve previous visuals.
    @Default(false) bool showSnapGrid,
  }) = _DiagramConfiguration;

  /// Creates a default configuration suitable for most diagram types.
  ///
  /// This factory constructor provides sensible defaults that work well
  /// for most diagram types. Clients can customize specific parameters
  /// as needed.
  static const DiagramConfiguration defaults = DiagramConfiguration();

  /// Creates a configuration optimized for touch devices.
  ///
  /// This factory constructor provides settings optimized for touch devices
  /// like tablets and phones, with larger edge thresholds and touch-friendly
  /// interaction settings.
  static const DiagramConfiguration touchOptimized = DiagramConfiguration(
    edgeThreshold: 80.0,
    maxZoom: 8.0,
    minZoom: 0.2,
    overscrollPixels: 150.0,
    bounceDuration: Duration(milliseconds: 400),
    autoScrollAcceleration: 2.0,
    enableKeyboardShortcuts: false,
  );

  /// Creates a configuration optimized for desktop devices.
  ///
  /// This factory constructor provides settings optimized for desktop devices
  /// with mouse and keyboard input, including keyboard shortcuts and
  /// precise interaction settings.
  static const DiagramConfiguration desktopOptimized = DiagramConfiguration(
    edgeThreshold: 30.0,
    maxZoom: 15.0,
    minZoom: 0.05,
    overscrollPixels: 50.0,
    bounceDuration: Duration(milliseconds: 250),
    autoScrollAcceleration: 1.2,
    enableRotation: true,
    inertialFriction: 0.98,
  );
}
