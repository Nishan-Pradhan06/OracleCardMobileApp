// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadNotificationEvent {

 int get notificationId;
/// Create a copy of ReadNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadNotificationEventCopyWith<ReadNotificationEvent> get copyWith => _$ReadNotificationEventCopyWithImpl<ReadNotificationEvent>(this as ReadNotificationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadNotificationEvent&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'ReadNotificationEvent(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class $ReadNotificationEventCopyWith<$Res>  {
  factory $ReadNotificationEventCopyWith(ReadNotificationEvent value, $Res Function(ReadNotificationEvent) _then) = _$ReadNotificationEventCopyWithImpl;
@useResult
$Res call({
 int notificationId
});




}
/// @nodoc
class _$ReadNotificationEventCopyWithImpl<$Res>
    implements $ReadNotificationEventCopyWith<$Res> {
  _$ReadNotificationEventCopyWithImpl(this._self, this._then);

  final ReadNotificationEvent _self;
  final $Res Function(ReadNotificationEvent) _then;

/// Create a copy of ReadNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationId = null,}) {
  return _then(_self.copyWith(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadNotificationEvent].
extension ReadNotificationEventPatterns on ReadNotificationEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ReadNotificationE value)?  readNotification,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadNotificationE() when readNotification != null:
return readNotification(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ReadNotificationE value)  readNotification,}){
final _that = this;
switch (_that) {
case _ReadNotificationE():
return readNotification(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ReadNotificationE value)?  readNotification,}){
final _that = this;
switch (_that) {
case _ReadNotificationE() when readNotification != null:
return readNotification(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int notificationId)?  readNotification,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadNotificationE() when readNotification != null:
return readNotification(_that.notificationId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int notificationId)  readNotification,}) {final _that = this;
switch (_that) {
case _ReadNotificationE():
return readNotification(_that.notificationId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int notificationId)?  readNotification,}) {final _that = this;
switch (_that) {
case _ReadNotificationE() when readNotification != null:
return readNotification(_that.notificationId);case _:
  return null;

}
}

}

/// @nodoc


class _ReadNotificationE implements ReadNotificationEvent {
  const _ReadNotificationE({required this.notificationId});
  

@override final  int notificationId;

/// Create a copy of ReadNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadNotificationECopyWith<_ReadNotificationE> get copyWith => __$ReadNotificationECopyWithImpl<_ReadNotificationE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadNotificationE&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'ReadNotificationEvent.readNotification(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$ReadNotificationECopyWith<$Res> implements $ReadNotificationEventCopyWith<$Res> {
  factory _$ReadNotificationECopyWith(_ReadNotificationE value, $Res Function(_ReadNotificationE) _then) = __$ReadNotificationECopyWithImpl;
@override @useResult
$Res call({
 int notificationId
});




}
/// @nodoc
class __$ReadNotificationECopyWithImpl<$Res>
    implements _$ReadNotificationECopyWith<$Res> {
  __$ReadNotificationECopyWithImpl(this._self, this._then);

  final _ReadNotificationE _self;
  final $Res Function(_ReadNotificationE) _then;

/// Create a copy of ReadNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_ReadNotificationE(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
