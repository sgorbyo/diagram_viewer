// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent event) physicalEventReceived,
    required TResult Function(PhysicalEvent event) handleDefaultPanZoom,
    required TResult Function(
            InteractionType type, String eventId, String? objectId)
        interactionStarted,
    required TResult Function(String eventId) interactionEnded,
    required TResult Function(DiagramCommand command) controllerCommandReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent event)? physicalEventReceived,
    TResult? Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult? Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult? Function(String eventId)? interactionEnded,
    TResult? Function(DiagramCommand command)? controllerCommandReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent event)? physicalEventReceived,
    TResult Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult Function(String eventId)? interactionEnded,
    TResult Function(DiagramCommand command)? controllerCommandReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhysicalEventReceived value)
        physicalEventReceived,
    required TResult Function(_HandleDefaultPanZoom value) handleDefaultPanZoom,
    required TResult Function(_InteractionStarted value) interactionStarted,
    required TResult Function(_InteractionEnded value) interactionEnded,
    required TResult Function(_ControllerCommandReceived value)
        controllerCommandReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult? Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult? Function(_InteractionStarted value)? interactionStarted,
    TResult? Function(_InteractionEnded value)? interactionEnded,
    TResult? Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult Function(_InteractionStarted value)? interactionStarted,
    TResult Function(_InteractionEnded value)? interactionEnded,
    TResult Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventManagementEventCopyWith<$Res> {
  factory $EventManagementEventCopyWith(EventManagementEvent value,
          $Res Function(EventManagementEvent) then) =
      _$EventManagementEventCopyWithImpl<$Res, EventManagementEvent>;
}

/// @nodoc
class _$EventManagementEventCopyWithImpl<$Res,
        $Val extends EventManagementEvent>
    implements $EventManagementEventCopyWith<$Res> {
  _$EventManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PhysicalEventReceivedImplCopyWith<$Res> {
  factory _$$PhysicalEventReceivedImplCopyWith(
          _$PhysicalEventReceivedImpl value,
          $Res Function(_$PhysicalEventReceivedImpl) then) =
      __$$PhysicalEventReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhysicalEvent event});

  $PhysicalEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$PhysicalEventReceivedImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res,
        _$PhysicalEventReceivedImpl>
    implements _$$PhysicalEventReceivedImplCopyWith<$Res> {
  __$$PhysicalEventReceivedImplCopyWithImpl(_$PhysicalEventReceivedImpl _value,
      $Res Function(_$PhysicalEventReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$PhysicalEventReceivedImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as PhysicalEvent,
    ));
  }

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhysicalEventCopyWith<$Res> get event {
    return $PhysicalEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$PhysicalEventReceivedImpl implements _PhysicalEventReceived {
  const _$PhysicalEventReceivedImpl(this.event);

  @override
  final PhysicalEvent event;

  @override
  String toString() {
    return 'EventManagementEvent.physicalEventReceived(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhysicalEventReceivedImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhysicalEventReceivedImplCopyWith<_$PhysicalEventReceivedImpl>
      get copyWith => __$$PhysicalEventReceivedImplCopyWithImpl<
          _$PhysicalEventReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent event) physicalEventReceived,
    required TResult Function(PhysicalEvent event) handleDefaultPanZoom,
    required TResult Function(
            InteractionType type, String eventId, String? objectId)
        interactionStarted,
    required TResult Function(String eventId) interactionEnded,
    required TResult Function(DiagramCommand command) controllerCommandReceived,
  }) {
    return physicalEventReceived(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent event)? physicalEventReceived,
    TResult? Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult? Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult? Function(String eventId)? interactionEnded,
    TResult? Function(DiagramCommand command)? controllerCommandReceived,
  }) {
    return physicalEventReceived?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent event)? physicalEventReceived,
    TResult Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult Function(String eventId)? interactionEnded,
    TResult Function(DiagramCommand command)? controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (physicalEventReceived != null) {
      return physicalEventReceived(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhysicalEventReceived value)
        physicalEventReceived,
    required TResult Function(_HandleDefaultPanZoom value) handleDefaultPanZoom,
    required TResult Function(_InteractionStarted value) interactionStarted,
    required TResult Function(_InteractionEnded value) interactionEnded,
    required TResult Function(_ControllerCommandReceived value)
        controllerCommandReceived,
  }) {
    return physicalEventReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult? Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult? Function(_InteractionStarted value)? interactionStarted,
    TResult? Function(_InteractionEnded value)? interactionEnded,
    TResult? Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
  }) {
    return physicalEventReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult Function(_InteractionStarted value)? interactionStarted,
    TResult Function(_InteractionEnded value)? interactionEnded,
    TResult Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (physicalEventReceived != null) {
      return physicalEventReceived(this);
    }
    return orElse();
  }
}

abstract class _PhysicalEventReceived implements EventManagementEvent {
  const factory _PhysicalEventReceived(final PhysicalEvent event) =
      _$PhysicalEventReceivedImpl;

  PhysicalEvent get event;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhysicalEventReceivedImplCopyWith<_$PhysicalEventReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HandleDefaultPanZoomImplCopyWith<$Res> {
  factory _$$HandleDefaultPanZoomImplCopyWith(_$HandleDefaultPanZoomImpl value,
          $Res Function(_$HandleDefaultPanZoomImpl) then) =
      __$$HandleDefaultPanZoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhysicalEvent event});

  $PhysicalEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$HandleDefaultPanZoomImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$HandleDefaultPanZoomImpl>
    implements _$$HandleDefaultPanZoomImplCopyWith<$Res> {
  __$$HandleDefaultPanZoomImplCopyWithImpl(_$HandleDefaultPanZoomImpl _value,
      $Res Function(_$HandleDefaultPanZoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$HandleDefaultPanZoomImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as PhysicalEvent,
    ));
  }

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhysicalEventCopyWith<$Res> get event {
    return $PhysicalEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$HandleDefaultPanZoomImpl implements _HandleDefaultPanZoom {
  const _$HandleDefaultPanZoomImpl(this.event);

  @override
  final PhysicalEvent event;

  @override
  String toString() {
    return 'EventManagementEvent.handleDefaultPanZoom(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandleDefaultPanZoomImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HandleDefaultPanZoomImplCopyWith<_$HandleDefaultPanZoomImpl>
      get copyWith =>
          __$$HandleDefaultPanZoomImplCopyWithImpl<_$HandleDefaultPanZoomImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent event) physicalEventReceived,
    required TResult Function(PhysicalEvent event) handleDefaultPanZoom,
    required TResult Function(
            InteractionType type, String eventId, String? objectId)
        interactionStarted,
    required TResult Function(String eventId) interactionEnded,
    required TResult Function(DiagramCommand command) controllerCommandReceived,
  }) {
    return handleDefaultPanZoom(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent event)? physicalEventReceived,
    TResult? Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult? Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult? Function(String eventId)? interactionEnded,
    TResult? Function(DiagramCommand command)? controllerCommandReceived,
  }) {
    return handleDefaultPanZoom?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent event)? physicalEventReceived,
    TResult Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult Function(String eventId)? interactionEnded,
    TResult Function(DiagramCommand command)? controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (handleDefaultPanZoom != null) {
      return handleDefaultPanZoom(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhysicalEventReceived value)
        physicalEventReceived,
    required TResult Function(_HandleDefaultPanZoom value) handleDefaultPanZoom,
    required TResult Function(_InteractionStarted value) interactionStarted,
    required TResult Function(_InteractionEnded value) interactionEnded,
    required TResult Function(_ControllerCommandReceived value)
        controllerCommandReceived,
  }) {
    return handleDefaultPanZoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult? Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult? Function(_InteractionStarted value)? interactionStarted,
    TResult? Function(_InteractionEnded value)? interactionEnded,
    TResult? Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
  }) {
    return handleDefaultPanZoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult Function(_InteractionStarted value)? interactionStarted,
    TResult Function(_InteractionEnded value)? interactionEnded,
    TResult Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (handleDefaultPanZoom != null) {
      return handleDefaultPanZoom(this);
    }
    return orElse();
  }
}

abstract class _HandleDefaultPanZoom implements EventManagementEvent {
  const factory _HandleDefaultPanZoom(final PhysicalEvent event) =
      _$HandleDefaultPanZoomImpl;

  PhysicalEvent get event;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HandleDefaultPanZoomImplCopyWith<_$HandleDefaultPanZoomImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InteractionStartedImplCopyWith<$Res> {
  factory _$$InteractionStartedImplCopyWith(_$InteractionStartedImpl value,
          $Res Function(_$InteractionStartedImpl) then) =
      __$$InteractionStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InteractionType type, String eventId, String? objectId});
}

/// @nodoc
class __$$InteractionStartedImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$InteractionStartedImpl>
    implements _$$InteractionStartedImplCopyWith<$Res> {
  __$$InteractionStartedImplCopyWithImpl(_$InteractionStartedImpl _value,
      $Res Function(_$InteractionStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? eventId = null,
    Object? objectId = freezed,
  }) {
    return _then(_$InteractionStartedImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InteractionType,
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InteractionStartedImpl implements _InteractionStarted {
  const _$InteractionStartedImpl(this.type, this.eventId, [this.objectId]);

  @override
  final InteractionType type;
  @override
  final String eventId;
  @override
  final String? objectId;

  @override
  String toString() {
    return 'EventManagementEvent.interactionStarted(type: $type, eventId: $eventId, objectId: $objectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionStartedImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, eventId, objectId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionStartedImplCopyWith<_$InteractionStartedImpl> get copyWith =>
      __$$InteractionStartedImplCopyWithImpl<_$InteractionStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent event) physicalEventReceived,
    required TResult Function(PhysicalEvent event) handleDefaultPanZoom,
    required TResult Function(
            InteractionType type, String eventId, String? objectId)
        interactionStarted,
    required TResult Function(String eventId) interactionEnded,
    required TResult Function(DiagramCommand command) controllerCommandReceived,
  }) {
    return interactionStarted(type, eventId, objectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent event)? physicalEventReceived,
    TResult? Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult? Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult? Function(String eventId)? interactionEnded,
    TResult? Function(DiagramCommand command)? controllerCommandReceived,
  }) {
    return interactionStarted?.call(type, eventId, objectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent event)? physicalEventReceived,
    TResult Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult Function(String eventId)? interactionEnded,
    TResult Function(DiagramCommand command)? controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (interactionStarted != null) {
      return interactionStarted(type, eventId, objectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhysicalEventReceived value)
        physicalEventReceived,
    required TResult Function(_HandleDefaultPanZoom value) handleDefaultPanZoom,
    required TResult Function(_InteractionStarted value) interactionStarted,
    required TResult Function(_InteractionEnded value) interactionEnded,
    required TResult Function(_ControllerCommandReceived value)
        controllerCommandReceived,
  }) {
    return interactionStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult? Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult? Function(_InteractionStarted value)? interactionStarted,
    TResult? Function(_InteractionEnded value)? interactionEnded,
    TResult? Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
  }) {
    return interactionStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult Function(_InteractionStarted value)? interactionStarted,
    TResult Function(_InteractionEnded value)? interactionEnded,
    TResult Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (interactionStarted != null) {
      return interactionStarted(this);
    }
    return orElse();
  }
}

abstract class _InteractionStarted implements EventManagementEvent {
  const factory _InteractionStarted(
      final InteractionType type, final String eventId,
      [final String? objectId]) = _$InteractionStartedImpl;

  InteractionType get type;
  String get eventId;
  String? get objectId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionStartedImplCopyWith<_$InteractionStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InteractionEndedImplCopyWith<$Res> {
  factory _$$InteractionEndedImplCopyWith(_$InteractionEndedImpl value,
          $Res Function(_$InteractionEndedImpl) then) =
      __$$InteractionEndedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$InteractionEndedImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$InteractionEndedImpl>
    implements _$$InteractionEndedImplCopyWith<$Res> {
  __$$InteractionEndedImplCopyWithImpl(_$InteractionEndedImpl _value,
      $Res Function(_$InteractionEndedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$InteractionEndedImpl(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InteractionEndedImpl implements _InteractionEnded {
  const _$InteractionEndedImpl(this.eventId);

  @override
  final String eventId;

  @override
  String toString() {
    return 'EventManagementEvent.interactionEnded(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionEndedImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionEndedImplCopyWith<_$InteractionEndedImpl> get copyWith =>
      __$$InteractionEndedImplCopyWithImpl<_$InteractionEndedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent event) physicalEventReceived,
    required TResult Function(PhysicalEvent event) handleDefaultPanZoom,
    required TResult Function(
            InteractionType type, String eventId, String? objectId)
        interactionStarted,
    required TResult Function(String eventId) interactionEnded,
    required TResult Function(DiagramCommand command) controllerCommandReceived,
  }) {
    return interactionEnded(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent event)? physicalEventReceived,
    TResult? Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult? Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult? Function(String eventId)? interactionEnded,
    TResult? Function(DiagramCommand command)? controllerCommandReceived,
  }) {
    return interactionEnded?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent event)? physicalEventReceived,
    TResult Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult Function(String eventId)? interactionEnded,
    TResult Function(DiagramCommand command)? controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (interactionEnded != null) {
      return interactionEnded(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhysicalEventReceived value)
        physicalEventReceived,
    required TResult Function(_HandleDefaultPanZoom value) handleDefaultPanZoom,
    required TResult Function(_InteractionStarted value) interactionStarted,
    required TResult Function(_InteractionEnded value) interactionEnded,
    required TResult Function(_ControllerCommandReceived value)
        controllerCommandReceived,
  }) {
    return interactionEnded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult? Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult? Function(_InteractionStarted value)? interactionStarted,
    TResult? Function(_InteractionEnded value)? interactionEnded,
    TResult? Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
  }) {
    return interactionEnded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult Function(_InteractionStarted value)? interactionStarted,
    TResult Function(_InteractionEnded value)? interactionEnded,
    TResult Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (interactionEnded != null) {
      return interactionEnded(this);
    }
    return orElse();
  }
}

abstract class _InteractionEnded implements EventManagementEvent {
  const factory _InteractionEnded(final String eventId) =
      _$InteractionEndedImpl;

  String get eventId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionEndedImplCopyWith<_$InteractionEndedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ControllerCommandReceivedImplCopyWith<$Res> {
  factory _$$ControllerCommandReceivedImplCopyWith(
          _$ControllerCommandReceivedImpl value,
          $Res Function(_$ControllerCommandReceivedImpl) then) =
      __$$ControllerCommandReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramCommand command});

  $DiagramCommandCopyWith<$Res> get command;
}

/// @nodoc
class __$$ControllerCommandReceivedImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res,
        _$ControllerCommandReceivedImpl>
    implements _$$ControllerCommandReceivedImplCopyWith<$Res> {
  __$$ControllerCommandReceivedImplCopyWithImpl(
      _$ControllerCommandReceivedImpl _value,
      $Res Function(_$ControllerCommandReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
  }) {
    return _then(_$ControllerCommandReceivedImpl(
      null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as DiagramCommand,
    ));
  }

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramCommandCopyWith<$Res> get command {
    return $DiagramCommandCopyWith<$Res>(_value.command, (value) {
      return _then(_value.copyWith(command: value));
    });
  }
}

/// @nodoc

class _$ControllerCommandReceivedImpl implements _ControllerCommandReceived {
  const _$ControllerCommandReceivedImpl(this.command);

  @override
  final DiagramCommand command;

  @override
  String toString() {
    return 'EventManagementEvent.controllerCommandReceived(command: $command)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControllerCommandReceivedImpl &&
            (identical(other.command, command) || other.command == command));
  }

  @override
  int get hashCode => Object.hash(runtimeType, command);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ControllerCommandReceivedImplCopyWith<_$ControllerCommandReceivedImpl>
      get copyWith => __$$ControllerCommandReceivedImplCopyWithImpl<
          _$ControllerCommandReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent event) physicalEventReceived,
    required TResult Function(PhysicalEvent event) handleDefaultPanZoom,
    required TResult Function(
            InteractionType type, String eventId, String? objectId)
        interactionStarted,
    required TResult Function(String eventId) interactionEnded,
    required TResult Function(DiagramCommand command) controllerCommandReceived,
  }) {
    return controllerCommandReceived(command);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent event)? physicalEventReceived,
    TResult? Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult? Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult? Function(String eventId)? interactionEnded,
    TResult? Function(DiagramCommand command)? controllerCommandReceived,
  }) {
    return controllerCommandReceived?.call(command);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent event)? physicalEventReceived,
    TResult Function(PhysicalEvent event)? handleDefaultPanZoom,
    TResult Function(InteractionType type, String eventId, String? objectId)?
        interactionStarted,
    TResult Function(String eventId)? interactionEnded,
    TResult Function(DiagramCommand command)? controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (controllerCommandReceived != null) {
      return controllerCommandReceived(command);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhysicalEventReceived value)
        physicalEventReceived,
    required TResult Function(_HandleDefaultPanZoom value) handleDefaultPanZoom,
    required TResult Function(_InteractionStarted value) interactionStarted,
    required TResult Function(_InteractionEnded value) interactionEnded,
    required TResult Function(_ControllerCommandReceived value)
        controllerCommandReceived,
  }) {
    return controllerCommandReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult? Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult? Function(_InteractionStarted value)? interactionStarted,
    TResult? Function(_InteractionEnded value)? interactionEnded,
    TResult? Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
  }) {
    return controllerCommandReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhysicalEventReceived value)? physicalEventReceived,
    TResult Function(_HandleDefaultPanZoom value)? handleDefaultPanZoom,
    TResult Function(_InteractionStarted value)? interactionStarted,
    TResult Function(_InteractionEnded value)? interactionEnded,
    TResult Function(_ControllerCommandReceived value)?
        controllerCommandReceived,
    required TResult orElse(),
  }) {
    if (controllerCommandReceived != null) {
      return controllerCommandReceived(this);
    }
    return orElse();
  }
}

abstract class _ControllerCommandReceived implements EventManagementEvent {
  const factory _ControllerCommandReceived(final DiagramCommand command) =
      _$ControllerCommandReceivedImpl;

  DiagramCommand get command;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ControllerCommandReceivedImplCopyWith<_$ControllerCommandReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EventManagementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String interactionId) panning,
    required TResult Function(String interactionId) zooming,
    required TResult Function(String interactionId, String objectId)
        objectDragging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String interactionId)? panning,
    TResult? Function(String interactionId)? zooming,
    TResult? Function(String interactionId, String objectId)? objectDragging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String interactionId)? panning,
    TResult Function(String interactionId)? zooming,
    TResult Function(String interactionId, String objectId)? objectDragging,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_ObjectDragging value) objectDragging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_ObjectDragging value)? objectDragging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_ObjectDragging value)? objectDragging,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventManagementStateCopyWith<$Res> {
  factory $EventManagementStateCopyWith(EventManagementState value,
          $Res Function(EventManagementState) then) =
      _$EventManagementStateCopyWithImpl<$Res, EventManagementState>;
}

/// @nodoc
class _$EventManagementStateCopyWithImpl<$Res,
        $Val extends EventManagementState>
    implements $EventManagementStateCopyWith<$Res> {
  _$EventManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$EventManagementStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'EventManagementState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String interactionId) panning,
    required TResult Function(String interactionId) zooming,
    required TResult Function(String interactionId, String objectId)
        objectDragging,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String interactionId)? panning,
    TResult? Function(String interactionId)? zooming,
    TResult? Function(String interactionId, String objectId)? objectDragging,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String interactionId)? panning,
    TResult Function(String interactionId)? zooming,
    TResult Function(String interactionId, String objectId)? objectDragging,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_ObjectDragging value) objectDragging,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_ObjectDragging value)? objectDragging,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_ObjectDragging value)? objectDragging,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements EventManagementState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$PanningImplCopyWith<$Res> {
  factory _$$PanningImplCopyWith(
          _$PanningImpl value, $Res Function(_$PanningImpl) then) =
      __$$PanningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String interactionId});
}

/// @nodoc
class __$$PanningImplCopyWithImpl<$Res>
    extends _$EventManagementStateCopyWithImpl<$Res, _$PanningImpl>
    implements _$$PanningImplCopyWith<$Res> {
  __$$PanningImplCopyWithImpl(
      _$PanningImpl _value, $Res Function(_$PanningImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interactionId = null,
  }) {
    return _then(_$PanningImpl(
      null == interactionId
          ? _value.interactionId
          : interactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PanningImpl implements _Panning {
  const _$PanningImpl(this.interactionId);

  @override
  final String interactionId;

  @override
  String toString() {
    return 'EventManagementState.panning(interactionId: $interactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanningImpl &&
            (identical(other.interactionId, interactionId) ||
                other.interactionId == interactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, interactionId);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanningImplCopyWith<_$PanningImpl> get copyWith =>
      __$$PanningImplCopyWithImpl<_$PanningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String interactionId) panning,
    required TResult Function(String interactionId) zooming,
    required TResult Function(String interactionId, String objectId)
        objectDragging,
  }) {
    return panning(interactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String interactionId)? panning,
    TResult? Function(String interactionId)? zooming,
    TResult? Function(String interactionId, String objectId)? objectDragging,
  }) {
    return panning?.call(interactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String interactionId)? panning,
    TResult Function(String interactionId)? zooming,
    TResult Function(String interactionId, String objectId)? objectDragging,
    required TResult orElse(),
  }) {
    if (panning != null) {
      return panning(interactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_ObjectDragging value) objectDragging,
  }) {
    return panning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_ObjectDragging value)? objectDragging,
  }) {
    return panning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_ObjectDragging value)? objectDragging,
    required TResult orElse(),
  }) {
    if (panning != null) {
      return panning(this);
    }
    return orElse();
  }
}

abstract class _Panning implements EventManagementState {
  const factory _Panning(final String interactionId) = _$PanningImpl;

  String get interactionId;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanningImplCopyWith<_$PanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZoomingImplCopyWith<$Res> {
  factory _$$ZoomingImplCopyWith(
          _$ZoomingImpl value, $Res Function(_$ZoomingImpl) then) =
      __$$ZoomingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String interactionId});
}

/// @nodoc
class __$$ZoomingImplCopyWithImpl<$Res>
    extends _$EventManagementStateCopyWithImpl<$Res, _$ZoomingImpl>
    implements _$$ZoomingImplCopyWith<$Res> {
  __$$ZoomingImplCopyWithImpl(
      _$ZoomingImpl _value, $Res Function(_$ZoomingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interactionId = null,
  }) {
    return _then(_$ZoomingImpl(
      null == interactionId
          ? _value.interactionId
          : interactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ZoomingImpl implements _Zooming {
  const _$ZoomingImpl(this.interactionId);

  @override
  final String interactionId;

  @override
  String toString() {
    return 'EventManagementState.zooming(interactionId: $interactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoomingImpl &&
            (identical(other.interactionId, interactionId) ||
                other.interactionId == interactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, interactionId);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoomingImplCopyWith<_$ZoomingImpl> get copyWith =>
      __$$ZoomingImplCopyWithImpl<_$ZoomingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String interactionId) panning,
    required TResult Function(String interactionId) zooming,
    required TResult Function(String interactionId, String objectId)
        objectDragging,
  }) {
    return zooming(interactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String interactionId)? panning,
    TResult? Function(String interactionId)? zooming,
    TResult? Function(String interactionId, String objectId)? objectDragging,
  }) {
    return zooming?.call(interactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String interactionId)? panning,
    TResult Function(String interactionId)? zooming,
    TResult Function(String interactionId, String objectId)? objectDragging,
    required TResult orElse(),
  }) {
    if (zooming != null) {
      return zooming(interactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_ObjectDragging value) objectDragging,
  }) {
    return zooming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_ObjectDragging value)? objectDragging,
  }) {
    return zooming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_ObjectDragging value)? objectDragging,
    required TResult orElse(),
  }) {
    if (zooming != null) {
      return zooming(this);
    }
    return orElse();
  }
}

abstract class _Zooming implements EventManagementState {
  const factory _Zooming(final String interactionId) = _$ZoomingImpl;

  String get interactionId;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoomingImplCopyWith<_$ZoomingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ObjectDraggingImplCopyWith<$Res> {
  factory _$$ObjectDraggingImplCopyWith(_$ObjectDraggingImpl value,
          $Res Function(_$ObjectDraggingImpl) then) =
      __$$ObjectDraggingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String interactionId, String objectId});
}

/// @nodoc
class __$$ObjectDraggingImplCopyWithImpl<$Res>
    extends _$EventManagementStateCopyWithImpl<$Res, _$ObjectDraggingImpl>
    implements _$$ObjectDraggingImplCopyWith<$Res> {
  __$$ObjectDraggingImplCopyWithImpl(
      _$ObjectDraggingImpl _value, $Res Function(_$ObjectDraggingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interactionId = null,
    Object? objectId = null,
  }) {
    return _then(_$ObjectDraggingImpl(
      null == interactionId
          ? _value.interactionId
          : interactionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ObjectDraggingImpl implements _ObjectDragging {
  const _$ObjectDraggingImpl(this.interactionId, this.objectId);

  @override
  final String interactionId;
  @override
  final String objectId;

  @override
  String toString() {
    return 'EventManagementState.objectDragging(interactionId: $interactionId, objectId: $objectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectDraggingImpl &&
            (identical(other.interactionId, interactionId) ||
                other.interactionId == interactionId) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, interactionId, objectId);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectDraggingImplCopyWith<_$ObjectDraggingImpl> get copyWith =>
      __$$ObjectDraggingImplCopyWithImpl<_$ObjectDraggingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String interactionId) panning,
    required TResult Function(String interactionId) zooming,
    required TResult Function(String interactionId, String objectId)
        objectDragging,
  }) {
    return objectDragging(interactionId, objectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String interactionId)? panning,
    TResult? Function(String interactionId)? zooming,
    TResult? Function(String interactionId, String objectId)? objectDragging,
  }) {
    return objectDragging?.call(interactionId, objectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String interactionId)? panning,
    TResult Function(String interactionId)? zooming,
    TResult Function(String interactionId, String objectId)? objectDragging,
    required TResult orElse(),
  }) {
    if (objectDragging != null) {
      return objectDragging(interactionId, objectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_ObjectDragging value) objectDragging,
  }) {
    return objectDragging(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_ObjectDragging value)? objectDragging,
  }) {
    return objectDragging?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_ObjectDragging value)? objectDragging,
    required TResult orElse(),
  }) {
    if (objectDragging != null) {
      return objectDragging(this);
    }
    return orElse();
  }
}

abstract class _ObjectDragging implements EventManagementState {
  const factory _ObjectDragging(
      final String interactionId, final String objectId) = _$ObjectDraggingImpl;

  String get interactionId;
  String get objectId;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObjectDraggingImplCopyWith<_$ObjectDraggingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
