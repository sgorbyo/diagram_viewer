// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiagramConfiguration {
  /// Background color of the diagram area.
  ///
  /// This color is used to fill the area where diagram content is displayed.
  /// Defaults to white.
  Color get backgroundColor => throw _privateConstructorUsedError;

  /// Color of the area outside the diagram bounds.
  ///
  /// This color is used to fill areas outside the logical diagram extent.
  /// Defaults to a light gray.
  Color get outsideColor => throw _privateConstructorUsedError;

  /// Distance from viewport edge that triggers auto-scroll.
  ///
  /// When an object is dragged within this distance from the viewport edge,
  /// the DiagramViewer will automatically scroll to follow the object.
  /// Defaults to 50.0 pixels.
  double get edgeThreshold => throw _privateConstructorUsedError;

  /// Maximum zoom level allowed.
  ///
  /// Users cannot zoom in beyond this level. This prevents excessive zooming
  /// that could cause performance issues or make the diagram unusable.
  /// Defaults to 10.0 (10x zoom).
  double get maxZoom => throw _privateConstructorUsedError;

  /// Minimum zoom level allowed.
  ///
  /// Users cannot zoom out beyond this level. This ensures the diagram
  /// remains visible and usable.
  /// Defaults to 0.1 (10% zoom).
  double get minZoom => throw _privateConstructorUsedError;

  /// Number of pixels allowed for overscroll.
  ///
  /// Users can scroll beyond the diagram bounds by this amount before
  /// the elastic bounce-back animation is triggered.
  /// Defaults to 100.0 pixels.
  double get overscrollPixels => throw _privateConstructorUsedError;

  /// Duration of the elastic bounce-back animation.
  ///
  /// When users scroll beyond the diagram bounds, this animation returns
  /// the view to valid bounds with a smooth elastic effect.
  /// Defaults to 300 milliseconds.
  Duration get bounceDuration => throw _privateConstructorUsedError;

  /// Curve of the elastic bounce-back animation.
  ///
  /// Controls the easing of the bounce-back. Defaults to easeOutCubic.
  Curve get bounceCurve => throw _privateConstructorUsedError;

  /// Interval between auto-scroll steps.
  ///
  /// When auto-scrolling is active, this defines how frequently the
  /// scroll position is updated. Lower values provide smoother scrolling
  /// but may impact performance.
  /// Defaults to 16 milliseconds (60 FPS).
  Duration get autoScrollInterval => throw _privateConstructorUsedError;

  /// Acceleration factor for auto-scroll.
  ///
  /// This factor determines how quickly auto-scroll accelerates as objects
  /// get closer to the viewport edge. Higher values provide more responsive
  /// auto-scrolling.
  /// Defaults to 1.5.
  double get autoScrollAcceleration => throw _privateConstructorUsedError;

  /// Whether to enable translation (pan) gestures.
  ///
  /// When true, users can pan the diagram by dragging. When false,
  /// panning is disabled.
  /// Defaults to true.
  bool get enableTranslation => throw _privateConstructorUsedError;

  /// Whether to enable scale (zoom) gestures.
  ///
  /// When true, users can zoom the diagram using pinch gestures or
  /// mouse wheel. When false, zooming is disabled.
  /// Defaults to true.
  bool get enableScale => throw _privateConstructorUsedError;

  /// Whether to enable rotation gestures.
  ///
  /// When true, users can rotate the diagram using gesture combinations.
  /// When false, rotation is disabled.
  /// Defaults to false.
  bool get enableRotation => throw _privateConstructorUsedError;

  /// Whether to clip content to the diagram bounds.
  ///
  /// When true, content outside the diagram bounds is clipped and not visible.
  /// When false, content can be rendered outside the bounds.
  /// Defaults to true.
  bool get clipContent => throw _privateConstructorUsedError;

  /// Whether to enable inertial scrolling.
  ///
  /// When true, scrolling continues with inertia after the user stops dragging,
  /// gradually slowing down. When false, scrolling stops immediately.
  /// Defaults to true.
  bool get enableInertialScrolling => throw _privateConstructorUsedError;

  /// Friction factor for inertial scrolling.
  ///
  /// This factor determines how quickly inertial scrolling slows down.
  /// Higher values provide more friction and shorter inertial scrolling.
  /// Defaults to 0.95.
  double get inertialFriction => throw _privateConstructorUsedError;

  /// Minimum start velocity to trigger inertia (pixels/second).
  ///
  /// Below this velocity, the view stops immediately at drag end.
  /// Defaults to 400.0 px/s.
  double get inertialMinStartVelocity => throw _privateConstructorUsedError;

  /// Minimum stop velocity for inertia (pixels/second).
  ///
  /// When the velocity decays below this value, inertia stops and
  /// bounce-back is triggered if needed. Defaults to 20.0 px/s.
  double get inertialMinStopVelocity => throw _privateConstructorUsedError;

  /// Maximum duration for the inertial phase.
  ///
  /// The inertial scrolling will stop once this duration elapses even if
  /// the velocity is still above the stop threshold. Defaults to 1200ms.
  Duration get inertialMaxDuration => throw _privateConstructorUsedError;

  /// Whether to enable keyboard shortcuts.
  ///
  /// When true, keyboard shortcuts for pan, zoom, and other operations
  /// are enabled. When false, keyboard shortcuts are disabled.
  /// Defaults to true.
  bool get enableKeyboardShortcuts => throw _privateConstructorUsedError;

  /// Whether to enable accessibility features.
  ///
  /// When true, accessibility features like screen reader support
  /// are enabled. When false, accessibility features are disabled.
  /// Defaults to true.
  bool get enableAccessibility => throw _privateConstructorUsedError;

  /// Enable verbose BLoC transitions logging for debugging.
  /// Only used in debug builds; ignored in release.
  bool get enableBlocDebugObserver => throw _privateConstructorUsedError;

  /// Enable snap-to-grid for object centers in logical space.
  ///
  /// When true, the controller may snap object centers to the nearest grid
  /// node during drag of existing objects and at drop time for DnD.
  /// Defaults to false (backward compatible).
  bool get snapGridEnabled => throw _privateConstructorUsedError;

  /// Grid spacing in logical units.
  ///
  /// Defines the distance between adjacent grid nodes. Defaults to 16.0.
  double get snapGridSpacing => throw _privateConstructorUsedError;

  /// Grid origin in logical coordinates.
  ///
  /// The grid nodes are aligned such that the origin is a grid node.
  /// Defaults to Offset.zero.
  Offset get snapGridOrigin => throw _privateConstructorUsedError;

  /// Whether to show an optional visual grid overlay.
  ///
  /// Rendering is lightweight and performed in logical space. Defaults to
  /// false to preserve previous visuals.
  bool get showSnapGrid => throw _privateConstructorUsedError;

  /// Create a copy of DiagramConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramConfigurationCopyWith<DiagramConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramConfigurationCopyWith<$Res> {
  factory $DiagramConfigurationCopyWith(DiagramConfiguration value,
          $Res Function(DiagramConfiguration) then) =
      _$DiagramConfigurationCopyWithImpl<$Res, DiagramConfiguration>;
  @useResult
  $Res call(
      {Color backgroundColor,
      Color outsideColor,
      double edgeThreshold,
      double maxZoom,
      double minZoom,
      double overscrollPixels,
      Duration bounceDuration,
      Curve bounceCurve,
      Duration autoScrollInterval,
      double autoScrollAcceleration,
      bool enableTranslation,
      bool enableScale,
      bool enableRotation,
      bool clipContent,
      bool enableInertialScrolling,
      double inertialFriction,
      double inertialMinStartVelocity,
      double inertialMinStopVelocity,
      Duration inertialMaxDuration,
      bool enableKeyboardShortcuts,
      bool enableAccessibility,
      bool enableBlocDebugObserver,
      bool snapGridEnabled,
      double snapGridSpacing,
      Offset snapGridOrigin,
      bool showSnapGrid});
}

/// @nodoc
class _$DiagramConfigurationCopyWithImpl<$Res,
        $Val extends DiagramConfiguration>
    implements $DiagramConfigurationCopyWith<$Res> {
  _$DiagramConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? outsideColor = null,
    Object? edgeThreshold = null,
    Object? maxZoom = null,
    Object? minZoom = null,
    Object? overscrollPixels = null,
    Object? bounceDuration = null,
    Object? bounceCurve = null,
    Object? autoScrollInterval = null,
    Object? autoScrollAcceleration = null,
    Object? enableTranslation = null,
    Object? enableScale = null,
    Object? enableRotation = null,
    Object? clipContent = null,
    Object? enableInertialScrolling = null,
    Object? inertialFriction = null,
    Object? inertialMinStartVelocity = null,
    Object? inertialMinStopVelocity = null,
    Object? inertialMaxDuration = null,
    Object? enableKeyboardShortcuts = null,
    Object? enableAccessibility = null,
    Object? enableBlocDebugObserver = null,
    Object? snapGridEnabled = null,
    Object? snapGridSpacing = null,
    Object? snapGridOrigin = null,
    Object? showSnapGrid = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      outsideColor: null == outsideColor
          ? _value.outsideColor
          : outsideColor // ignore: cast_nullable_to_non_nullable
              as Color,
      edgeThreshold: null == edgeThreshold
          ? _value.edgeThreshold
          : edgeThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      maxZoom: null == maxZoom
          ? _value.maxZoom
          : maxZoom // ignore: cast_nullable_to_non_nullable
              as double,
      minZoom: null == minZoom
          ? _value.minZoom
          : minZoom // ignore: cast_nullable_to_non_nullable
              as double,
      overscrollPixels: null == overscrollPixels
          ? _value.overscrollPixels
          : overscrollPixels // ignore: cast_nullable_to_non_nullable
              as double,
      bounceDuration: null == bounceDuration
          ? _value.bounceDuration
          : bounceDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      bounceCurve: null == bounceCurve
          ? _value.bounceCurve
          : bounceCurve // ignore: cast_nullable_to_non_nullable
              as Curve,
      autoScrollInterval: null == autoScrollInterval
          ? _value.autoScrollInterval
          : autoScrollInterval // ignore: cast_nullable_to_non_nullable
              as Duration,
      autoScrollAcceleration: null == autoScrollAcceleration
          ? _value.autoScrollAcceleration
          : autoScrollAcceleration // ignore: cast_nullable_to_non_nullable
              as double,
      enableTranslation: null == enableTranslation
          ? _value.enableTranslation
          : enableTranslation // ignore: cast_nullable_to_non_nullable
              as bool,
      enableScale: null == enableScale
          ? _value.enableScale
          : enableScale // ignore: cast_nullable_to_non_nullable
              as bool,
      enableRotation: null == enableRotation
          ? _value.enableRotation
          : enableRotation // ignore: cast_nullable_to_non_nullable
              as bool,
      clipContent: null == clipContent
          ? _value.clipContent
          : clipContent // ignore: cast_nullable_to_non_nullable
              as bool,
      enableInertialScrolling: null == enableInertialScrolling
          ? _value.enableInertialScrolling
          : enableInertialScrolling // ignore: cast_nullable_to_non_nullable
              as bool,
      inertialFriction: null == inertialFriction
          ? _value.inertialFriction
          : inertialFriction // ignore: cast_nullable_to_non_nullable
              as double,
      inertialMinStartVelocity: null == inertialMinStartVelocity
          ? _value.inertialMinStartVelocity
          : inertialMinStartVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      inertialMinStopVelocity: null == inertialMinStopVelocity
          ? _value.inertialMinStopVelocity
          : inertialMinStopVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      inertialMaxDuration: null == inertialMaxDuration
          ? _value.inertialMaxDuration
          : inertialMaxDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      enableKeyboardShortcuts: null == enableKeyboardShortcuts
          ? _value.enableKeyboardShortcuts
          : enableKeyboardShortcuts // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAccessibility: null == enableAccessibility
          ? _value.enableAccessibility
          : enableAccessibility // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBlocDebugObserver: null == enableBlocDebugObserver
          ? _value.enableBlocDebugObserver
          : enableBlocDebugObserver // ignore: cast_nullable_to_non_nullable
              as bool,
      snapGridEnabled: null == snapGridEnabled
          ? _value.snapGridEnabled
          : snapGridEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      snapGridSpacing: null == snapGridSpacing
          ? _value.snapGridSpacing
          : snapGridSpacing // ignore: cast_nullable_to_non_nullable
              as double,
      snapGridOrigin: null == snapGridOrigin
          ? _value.snapGridOrigin
          : snapGridOrigin // ignore: cast_nullable_to_non_nullable
              as Offset,
      showSnapGrid: null == showSnapGrid
          ? _value.showSnapGrid
          : showSnapGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagramConfigurationImplCopyWith<$Res>
    implements $DiagramConfigurationCopyWith<$Res> {
  factory _$$DiagramConfigurationImplCopyWith(_$DiagramConfigurationImpl value,
          $Res Function(_$DiagramConfigurationImpl) then) =
      __$$DiagramConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Color backgroundColor,
      Color outsideColor,
      double edgeThreshold,
      double maxZoom,
      double minZoom,
      double overscrollPixels,
      Duration bounceDuration,
      Curve bounceCurve,
      Duration autoScrollInterval,
      double autoScrollAcceleration,
      bool enableTranslation,
      bool enableScale,
      bool enableRotation,
      bool clipContent,
      bool enableInertialScrolling,
      double inertialFriction,
      double inertialMinStartVelocity,
      double inertialMinStopVelocity,
      Duration inertialMaxDuration,
      bool enableKeyboardShortcuts,
      bool enableAccessibility,
      bool enableBlocDebugObserver,
      bool snapGridEnabled,
      double snapGridSpacing,
      Offset snapGridOrigin,
      bool showSnapGrid});
}

/// @nodoc
class __$$DiagramConfigurationImplCopyWithImpl<$Res>
    extends _$DiagramConfigurationCopyWithImpl<$Res, _$DiagramConfigurationImpl>
    implements _$$DiagramConfigurationImplCopyWith<$Res> {
  __$$DiagramConfigurationImplCopyWithImpl(_$DiagramConfigurationImpl _value,
      $Res Function(_$DiagramConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? outsideColor = null,
    Object? edgeThreshold = null,
    Object? maxZoom = null,
    Object? minZoom = null,
    Object? overscrollPixels = null,
    Object? bounceDuration = null,
    Object? bounceCurve = null,
    Object? autoScrollInterval = null,
    Object? autoScrollAcceleration = null,
    Object? enableTranslation = null,
    Object? enableScale = null,
    Object? enableRotation = null,
    Object? clipContent = null,
    Object? enableInertialScrolling = null,
    Object? inertialFriction = null,
    Object? inertialMinStartVelocity = null,
    Object? inertialMinStopVelocity = null,
    Object? inertialMaxDuration = null,
    Object? enableKeyboardShortcuts = null,
    Object? enableAccessibility = null,
    Object? enableBlocDebugObserver = null,
    Object? snapGridEnabled = null,
    Object? snapGridSpacing = null,
    Object? snapGridOrigin = null,
    Object? showSnapGrid = null,
  }) {
    return _then(_$DiagramConfigurationImpl(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      outsideColor: null == outsideColor
          ? _value.outsideColor
          : outsideColor // ignore: cast_nullable_to_non_nullable
              as Color,
      edgeThreshold: null == edgeThreshold
          ? _value.edgeThreshold
          : edgeThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      maxZoom: null == maxZoom
          ? _value.maxZoom
          : maxZoom // ignore: cast_nullable_to_non_nullable
              as double,
      minZoom: null == minZoom
          ? _value.minZoom
          : minZoom // ignore: cast_nullable_to_non_nullable
              as double,
      overscrollPixels: null == overscrollPixels
          ? _value.overscrollPixels
          : overscrollPixels // ignore: cast_nullable_to_non_nullable
              as double,
      bounceDuration: null == bounceDuration
          ? _value.bounceDuration
          : bounceDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      bounceCurve: null == bounceCurve
          ? _value.bounceCurve
          : bounceCurve // ignore: cast_nullable_to_non_nullable
              as Curve,
      autoScrollInterval: null == autoScrollInterval
          ? _value.autoScrollInterval
          : autoScrollInterval // ignore: cast_nullable_to_non_nullable
              as Duration,
      autoScrollAcceleration: null == autoScrollAcceleration
          ? _value.autoScrollAcceleration
          : autoScrollAcceleration // ignore: cast_nullable_to_non_nullable
              as double,
      enableTranslation: null == enableTranslation
          ? _value.enableTranslation
          : enableTranslation // ignore: cast_nullable_to_non_nullable
              as bool,
      enableScale: null == enableScale
          ? _value.enableScale
          : enableScale // ignore: cast_nullable_to_non_nullable
              as bool,
      enableRotation: null == enableRotation
          ? _value.enableRotation
          : enableRotation // ignore: cast_nullable_to_non_nullable
              as bool,
      clipContent: null == clipContent
          ? _value.clipContent
          : clipContent // ignore: cast_nullable_to_non_nullable
              as bool,
      enableInertialScrolling: null == enableInertialScrolling
          ? _value.enableInertialScrolling
          : enableInertialScrolling // ignore: cast_nullable_to_non_nullable
              as bool,
      inertialFriction: null == inertialFriction
          ? _value.inertialFriction
          : inertialFriction // ignore: cast_nullable_to_non_nullable
              as double,
      inertialMinStartVelocity: null == inertialMinStartVelocity
          ? _value.inertialMinStartVelocity
          : inertialMinStartVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      inertialMinStopVelocity: null == inertialMinStopVelocity
          ? _value.inertialMinStopVelocity
          : inertialMinStopVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      inertialMaxDuration: null == inertialMaxDuration
          ? _value.inertialMaxDuration
          : inertialMaxDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      enableKeyboardShortcuts: null == enableKeyboardShortcuts
          ? _value.enableKeyboardShortcuts
          : enableKeyboardShortcuts // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAccessibility: null == enableAccessibility
          ? _value.enableAccessibility
          : enableAccessibility // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBlocDebugObserver: null == enableBlocDebugObserver
          ? _value.enableBlocDebugObserver
          : enableBlocDebugObserver // ignore: cast_nullable_to_non_nullable
              as bool,
      snapGridEnabled: null == snapGridEnabled
          ? _value.snapGridEnabled
          : snapGridEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      snapGridSpacing: null == snapGridSpacing
          ? _value.snapGridSpacing
          : snapGridSpacing // ignore: cast_nullable_to_non_nullable
              as double,
      snapGridOrigin: null == snapGridOrigin
          ? _value.snapGridOrigin
          : snapGridOrigin // ignore: cast_nullable_to_non_nullable
              as Offset,
      showSnapGrid: null == showSnapGrid
          ? _value.showSnapGrid
          : showSnapGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiagramConfigurationImpl implements _DiagramConfiguration {
  const _$DiagramConfigurationImpl(
      {this.backgroundColor = Colors.white,
      this.outsideColor = const Color(0xFF808080),
      this.edgeThreshold = 50.0,
      this.maxZoom = 10.0,
      this.minZoom = 0.1,
      this.overscrollPixels = 100.0,
      this.bounceDuration = const Duration(milliseconds: 300),
      this.bounceCurve = Curves.easeOutCubic,
      this.autoScrollInterval = const Duration(milliseconds: 16),
      this.autoScrollAcceleration = 1.5,
      this.enableTranslation = true,
      this.enableScale = true,
      this.enableRotation = false,
      this.clipContent = true,
      this.enableInertialScrolling = true,
      this.inertialFriction = 0.90,
      this.inertialMinStartVelocity = 400.0,
      this.inertialMinStopVelocity = 60.0,
      this.inertialMaxDuration = const Duration(milliseconds: 900),
      this.enableKeyboardShortcuts = true,
      this.enableAccessibility = true,
      this.enableBlocDebugObserver = false,
      this.snapGridEnabled = false,
      this.snapGridSpacing = 16.0,
      this.snapGridOrigin = Offset.zero,
      this.showSnapGrid = false});

  /// Background color of the diagram area.
  ///
  /// This color is used to fill the area where diagram content is displayed.
  /// Defaults to white.
  @override
  @JsonKey()
  final Color backgroundColor;

  /// Color of the area outside the diagram bounds.
  ///
  /// This color is used to fill areas outside the logical diagram extent.
  /// Defaults to a light gray.
  @override
  @JsonKey()
  final Color outsideColor;

  /// Distance from viewport edge that triggers auto-scroll.
  ///
  /// When an object is dragged within this distance from the viewport edge,
  /// the DiagramViewer will automatically scroll to follow the object.
  /// Defaults to 50.0 pixels.
  @override
  @JsonKey()
  final double edgeThreshold;

  /// Maximum zoom level allowed.
  ///
  /// Users cannot zoom in beyond this level. This prevents excessive zooming
  /// that could cause performance issues or make the diagram unusable.
  /// Defaults to 10.0 (10x zoom).
  @override
  @JsonKey()
  final double maxZoom;

  /// Minimum zoom level allowed.
  ///
  /// Users cannot zoom out beyond this level. This ensures the diagram
  /// remains visible and usable.
  /// Defaults to 0.1 (10% zoom).
  @override
  @JsonKey()
  final double minZoom;

  /// Number of pixels allowed for overscroll.
  ///
  /// Users can scroll beyond the diagram bounds by this amount before
  /// the elastic bounce-back animation is triggered.
  /// Defaults to 100.0 pixels.
  @override
  @JsonKey()
  final double overscrollPixels;

  /// Duration of the elastic bounce-back animation.
  ///
  /// When users scroll beyond the diagram bounds, this animation returns
  /// the view to valid bounds with a smooth elastic effect.
  /// Defaults to 300 milliseconds.
  @override
  @JsonKey()
  final Duration bounceDuration;

  /// Curve of the elastic bounce-back animation.
  ///
  /// Controls the easing of the bounce-back. Defaults to easeOutCubic.
  @override
  @JsonKey()
  final Curve bounceCurve;

  /// Interval between auto-scroll steps.
  ///
  /// When auto-scrolling is active, this defines how frequently the
  /// scroll position is updated. Lower values provide smoother scrolling
  /// but may impact performance.
  /// Defaults to 16 milliseconds (60 FPS).
  @override
  @JsonKey()
  final Duration autoScrollInterval;

  /// Acceleration factor for auto-scroll.
  ///
  /// This factor determines how quickly auto-scroll accelerates as objects
  /// get closer to the viewport edge. Higher values provide more responsive
  /// auto-scrolling.
  /// Defaults to 1.5.
  @override
  @JsonKey()
  final double autoScrollAcceleration;

  /// Whether to enable translation (pan) gestures.
  ///
  /// When true, users can pan the diagram by dragging. When false,
  /// panning is disabled.
  /// Defaults to true.
  @override
  @JsonKey()
  final bool enableTranslation;

  /// Whether to enable scale (zoom) gestures.
  ///
  /// When true, users can zoom the diagram using pinch gestures or
  /// mouse wheel. When false, zooming is disabled.
  /// Defaults to true.
  @override
  @JsonKey()
  final bool enableScale;

  /// Whether to enable rotation gestures.
  ///
  /// When true, users can rotate the diagram using gesture combinations.
  /// When false, rotation is disabled.
  /// Defaults to false.
  @override
  @JsonKey()
  final bool enableRotation;

  /// Whether to clip content to the diagram bounds.
  ///
  /// When true, content outside the diagram bounds is clipped and not visible.
  /// When false, content can be rendered outside the bounds.
  /// Defaults to true.
  @override
  @JsonKey()
  final bool clipContent;

  /// Whether to enable inertial scrolling.
  ///
  /// When true, scrolling continues with inertia after the user stops dragging,
  /// gradually slowing down. When false, scrolling stops immediately.
  /// Defaults to true.
  @override
  @JsonKey()
  final bool enableInertialScrolling;

  /// Friction factor for inertial scrolling.
  ///
  /// This factor determines how quickly inertial scrolling slows down.
  /// Higher values provide more friction and shorter inertial scrolling.
  /// Defaults to 0.95.
  @override
  @JsonKey()
  final double inertialFriction;

  /// Minimum start velocity to trigger inertia (pixels/second).
  ///
  /// Below this velocity, the view stops immediately at drag end.
  /// Defaults to 400.0 px/s.
  @override
  @JsonKey()
  final double inertialMinStartVelocity;

  /// Minimum stop velocity for inertia (pixels/second).
  ///
  /// When the velocity decays below this value, inertia stops and
  /// bounce-back is triggered if needed. Defaults to 20.0 px/s.
  @override
  @JsonKey()
  final double inertialMinStopVelocity;

  /// Maximum duration for the inertial phase.
  ///
  /// The inertial scrolling will stop once this duration elapses even if
  /// the velocity is still above the stop threshold. Defaults to 1200ms.
  @override
  @JsonKey()
  final Duration inertialMaxDuration;

  /// Whether to enable keyboard shortcuts.
  ///
  /// When true, keyboard shortcuts for pan, zoom, and other operations
  /// are enabled. When false, keyboard shortcuts are disabled.
  /// Defaults to true.
  @override
  @JsonKey()
  final bool enableKeyboardShortcuts;

  /// Whether to enable accessibility features.
  ///
  /// When true, accessibility features like screen reader support
  /// are enabled. When false, accessibility features are disabled.
  /// Defaults to true.
  @override
  @JsonKey()
  final bool enableAccessibility;

  /// Enable verbose BLoC transitions logging for debugging.
  /// Only used in debug builds; ignored in release.
  @override
  @JsonKey()
  final bool enableBlocDebugObserver;

  /// Enable snap-to-grid for object centers in logical space.
  ///
  /// When true, the controller may snap object centers to the nearest grid
  /// node during drag of existing objects and at drop time for DnD.
  /// Defaults to false (backward compatible).
  @override
  @JsonKey()
  final bool snapGridEnabled;

  /// Grid spacing in logical units.
  ///
  /// Defines the distance between adjacent grid nodes. Defaults to 16.0.
  @override
  @JsonKey()
  final double snapGridSpacing;

  /// Grid origin in logical coordinates.
  ///
  /// The grid nodes are aligned such that the origin is a grid node.
  /// Defaults to Offset.zero.
  @override
  @JsonKey()
  final Offset snapGridOrigin;

  /// Whether to show an optional visual grid overlay.
  ///
  /// Rendering is lightweight and performed in logical space. Defaults to
  /// false to preserve previous visuals.
  @override
  @JsonKey()
  final bool showSnapGrid;

  @override
  String toString() {
    return 'DiagramConfiguration(backgroundColor: $backgroundColor, outsideColor: $outsideColor, edgeThreshold: $edgeThreshold, maxZoom: $maxZoom, minZoom: $minZoom, overscrollPixels: $overscrollPixels, bounceDuration: $bounceDuration, bounceCurve: $bounceCurve, autoScrollInterval: $autoScrollInterval, autoScrollAcceleration: $autoScrollAcceleration, enableTranslation: $enableTranslation, enableScale: $enableScale, enableRotation: $enableRotation, clipContent: $clipContent, enableInertialScrolling: $enableInertialScrolling, inertialFriction: $inertialFriction, inertialMinStartVelocity: $inertialMinStartVelocity, inertialMinStopVelocity: $inertialMinStopVelocity, inertialMaxDuration: $inertialMaxDuration, enableKeyboardShortcuts: $enableKeyboardShortcuts, enableAccessibility: $enableAccessibility, enableBlocDebugObserver: $enableBlocDebugObserver, snapGridEnabled: $snapGridEnabled, snapGridSpacing: $snapGridSpacing, snapGridOrigin: $snapGridOrigin, showSnapGrid: $showSnapGrid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramConfigurationImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.outsideColor, outsideColor) ||
                other.outsideColor == outsideColor) &&
            (identical(other.edgeThreshold, edgeThreshold) ||
                other.edgeThreshold == edgeThreshold) &&
            (identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom) &&
            (identical(other.minZoom, minZoom) || other.minZoom == minZoom) &&
            (identical(other.overscrollPixels, overscrollPixels) ||
                other.overscrollPixels == overscrollPixels) &&
            (identical(other.bounceDuration, bounceDuration) ||
                other.bounceDuration == bounceDuration) &&
            (identical(other.bounceCurve, bounceCurve) ||
                other.bounceCurve == bounceCurve) &&
            (identical(other.autoScrollInterval, autoScrollInterval) ||
                other.autoScrollInterval == autoScrollInterval) &&
            (identical(other.autoScrollAcceleration, autoScrollAcceleration) ||
                other.autoScrollAcceleration == autoScrollAcceleration) &&
            (identical(other.enableTranslation, enableTranslation) ||
                other.enableTranslation == enableTranslation) &&
            (identical(other.enableScale, enableScale) ||
                other.enableScale == enableScale) &&
            (identical(other.enableRotation, enableRotation) ||
                other.enableRotation == enableRotation) &&
            (identical(other.clipContent, clipContent) ||
                other.clipContent == clipContent) &&
            (identical(other.enableInertialScrolling, enableInertialScrolling) ||
                other.enableInertialScrolling == enableInertialScrolling) &&
            (identical(other.inertialFriction, inertialFriction) ||
                other.inertialFriction == inertialFriction) &&
            (identical(
                    other.inertialMinStartVelocity, inertialMinStartVelocity) ||
                other.inertialMinStartVelocity == inertialMinStartVelocity) &&
            (identical(
                    other.inertialMinStopVelocity, inertialMinStopVelocity) ||
                other.inertialMinStopVelocity == inertialMinStopVelocity) &&
            (identical(other.inertialMaxDuration, inertialMaxDuration) ||
                other.inertialMaxDuration == inertialMaxDuration) &&
            (identical(
                    other.enableKeyboardShortcuts, enableKeyboardShortcuts) ||
                other.enableKeyboardShortcuts == enableKeyboardShortcuts) &&
            (identical(other.enableAccessibility, enableAccessibility) ||
                other.enableAccessibility == enableAccessibility) &&
            (identical(
                    other.enableBlocDebugObserver, enableBlocDebugObserver) ||
                other.enableBlocDebugObserver == enableBlocDebugObserver) &&
            (identical(other.snapGridEnabled, snapGridEnabled) ||
                other.snapGridEnabled == snapGridEnabled) &&
            (identical(other.snapGridSpacing, snapGridSpacing) ||
                other.snapGridSpacing == snapGridSpacing) &&
            (identical(other.snapGridOrigin, snapGridOrigin) ||
                other.snapGridOrigin == snapGridOrigin) &&
            (identical(other.showSnapGrid, showSnapGrid) ||
                other.showSnapGrid == showSnapGrid));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        backgroundColor,
        outsideColor,
        edgeThreshold,
        maxZoom,
        minZoom,
        overscrollPixels,
        bounceDuration,
        bounceCurve,
        autoScrollInterval,
        autoScrollAcceleration,
        enableTranslation,
        enableScale,
        enableRotation,
        clipContent,
        enableInertialScrolling,
        inertialFriction,
        inertialMinStartVelocity,
        inertialMinStopVelocity,
        inertialMaxDuration,
        enableKeyboardShortcuts,
        enableAccessibility,
        enableBlocDebugObserver,
        snapGridEnabled,
        snapGridSpacing,
        snapGridOrigin,
        showSnapGrid
      ]);

  /// Create a copy of DiagramConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramConfigurationImplCopyWith<_$DiagramConfigurationImpl>
      get copyWith =>
          __$$DiagramConfigurationImplCopyWithImpl<_$DiagramConfigurationImpl>(
              this, _$identity);
}

abstract class _DiagramConfiguration implements DiagramConfiguration {
  const factory _DiagramConfiguration(
      {final Color backgroundColor,
      final Color outsideColor,
      final double edgeThreshold,
      final double maxZoom,
      final double minZoom,
      final double overscrollPixels,
      final Duration bounceDuration,
      final Curve bounceCurve,
      final Duration autoScrollInterval,
      final double autoScrollAcceleration,
      final bool enableTranslation,
      final bool enableScale,
      final bool enableRotation,
      final bool clipContent,
      final bool enableInertialScrolling,
      final double inertialFriction,
      final double inertialMinStartVelocity,
      final double inertialMinStopVelocity,
      final Duration inertialMaxDuration,
      final bool enableKeyboardShortcuts,
      final bool enableAccessibility,
      final bool enableBlocDebugObserver,
      final bool snapGridEnabled,
      final double snapGridSpacing,
      final Offset snapGridOrigin,
      final bool showSnapGrid}) = _$DiagramConfigurationImpl;

  /// Background color of the diagram area.
  ///
  /// This color is used to fill the area where diagram content is displayed.
  /// Defaults to white.
  @override
  Color get backgroundColor;

  /// Color of the area outside the diagram bounds.
  ///
  /// This color is used to fill areas outside the logical diagram extent.
  /// Defaults to a light gray.
  @override
  Color get outsideColor;

  /// Distance from viewport edge that triggers auto-scroll.
  ///
  /// When an object is dragged within this distance from the viewport edge,
  /// the DiagramViewer will automatically scroll to follow the object.
  /// Defaults to 50.0 pixels.
  @override
  double get edgeThreshold;

  /// Maximum zoom level allowed.
  ///
  /// Users cannot zoom in beyond this level. This prevents excessive zooming
  /// that could cause performance issues or make the diagram unusable.
  /// Defaults to 10.0 (10x zoom).
  @override
  double get maxZoom;

  /// Minimum zoom level allowed.
  ///
  /// Users cannot zoom out beyond this level. This ensures the diagram
  /// remains visible and usable.
  /// Defaults to 0.1 (10% zoom).
  @override
  double get minZoom;

  /// Number of pixels allowed for overscroll.
  ///
  /// Users can scroll beyond the diagram bounds by this amount before
  /// the elastic bounce-back animation is triggered.
  /// Defaults to 100.0 pixels.
  @override
  double get overscrollPixels;

  /// Duration of the elastic bounce-back animation.
  ///
  /// When users scroll beyond the diagram bounds, this animation returns
  /// the view to valid bounds with a smooth elastic effect.
  /// Defaults to 300 milliseconds.
  @override
  Duration get bounceDuration;

  /// Curve of the elastic bounce-back animation.
  ///
  /// Controls the easing of the bounce-back. Defaults to easeOutCubic.
  @override
  Curve get bounceCurve;

  /// Interval between auto-scroll steps.
  ///
  /// When auto-scrolling is active, this defines how frequently the
  /// scroll position is updated. Lower values provide smoother scrolling
  /// but may impact performance.
  /// Defaults to 16 milliseconds (60 FPS).
  @override
  Duration get autoScrollInterval;

  /// Acceleration factor for auto-scroll.
  ///
  /// This factor determines how quickly auto-scroll accelerates as objects
  /// get closer to the viewport edge. Higher values provide more responsive
  /// auto-scrolling.
  /// Defaults to 1.5.
  @override
  double get autoScrollAcceleration;

  /// Whether to enable translation (pan) gestures.
  ///
  /// When true, users can pan the diagram by dragging. When false,
  /// panning is disabled.
  /// Defaults to true.
  @override
  bool get enableTranslation;

  /// Whether to enable scale (zoom) gestures.
  ///
  /// When true, users can zoom the diagram using pinch gestures or
  /// mouse wheel. When false, zooming is disabled.
  /// Defaults to true.
  @override
  bool get enableScale;

  /// Whether to enable rotation gestures.
  ///
  /// When true, users can rotate the diagram using gesture combinations.
  /// When false, rotation is disabled.
  /// Defaults to false.
  @override
  bool get enableRotation;

  /// Whether to clip content to the diagram bounds.
  ///
  /// When true, content outside the diagram bounds is clipped and not visible.
  /// When false, content can be rendered outside the bounds.
  /// Defaults to true.
  @override
  bool get clipContent;

  /// Whether to enable inertial scrolling.
  ///
  /// When true, scrolling continues with inertia after the user stops dragging,
  /// gradually slowing down. When false, scrolling stops immediately.
  /// Defaults to true.
  @override
  bool get enableInertialScrolling;

  /// Friction factor for inertial scrolling.
  ///
  /// This factor determines how quickly inertial scrolling slows down.
  /// Higher values provide more friction and shorter inertial scrolling.
  /// Defaults to 0.95.
  @override
  double get inertialFriction;

  /// Minimum start velocity to trigger inertia (pixels/second).
  ///
  /// Below this velocity, the view stops immediately at drag end.
  /// Defaults to 400.0 px/s.
  @override
  double get inertialMinStartVelocity;

  /// Minimum stop velocity for inertia (pixels/second).
  ///
  /// When the velocity decays below this value, inertia stops and
  /// bounce-back is triggered if needed. Defaults to 20.0 px/s.
  @override
  double get inertialMinStopVelocity;

  /// Maximum duration for the inertial phase.
  ///
  /// The inertial scrolling will stop once this duration elapses even if
  /// the velocity is still above the stop threshold. Defaults to 1200ms.
  @override
  Duration get inertialMaxDuration;

  /// Whether to enable keyboard shortcuts.
  ///
  /// When true, keyboard shortcuts for pan, zoom, and other operations
  /// are enabled. When false, keyboard shortcuts are disabled.
  /// Defaults to true.
  @override
  bool get enableKeyboardShortcuts;

  /// Whether to enable accessibility features.
  ///
  /// When true, accessibility features like screen reader support
  /// are enabled. When false, accessibility features are disabled.
  /// Defaults to true.
  @override
  bool get enableAccessibility;

  /// Enable verbose BLoC transitions logging for debugging.
  /// Only used in debug builds; ignored in release.
  @override
  bool get enableBlocDebugObserver;

  /// Enable snap-to-grid for object centers in logical space.
  ///
  /// When true, the controller may snap object centers to the nearest grid
  /// node during drag of existing objects and at drop time for DnD.
  /// Defaults to false (backward compatible).
  @override
  bool get snapGridEnabled;

  /// Grid spacing in logical units.
  ///
  /// Defines the distance between adjacent grid nodes. Defaults to 16.0.
  @override
  double get snapGridSpacing;

  /// Grid origin in logical coordinates.
  ///
  /// The grid nodes are aligned such that the origin is a grid node.
  /// Defaults to Offset.zero.
  @override
  Offset get snapGridOrigin;

  /// Whether to show an optional visual grid overlay.
  ///
  /// Rendering is lightweight and performed in logical space. Defaults to
  /// false to preserve previous visuals.
  @override
  bool get showSnapGrid;

  /// Create a copy of DiagramConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramConfigurationImplCopyWith<_$DiagramConfigurationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
