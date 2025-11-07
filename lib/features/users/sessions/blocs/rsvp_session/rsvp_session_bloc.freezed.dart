// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsvpSessionEvent {

 int get id;
/// Create a copy of RsvpSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsvpSessionEventCopyWith<RsvpSessionEvent> get copyWith => _$RsvpSessionEventCopyWithImpl<RsvpSessionEvent>(this as RsvpSessionEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsvpSessionEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RsvpSessionEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $RsvpSessionEventCopyWith<$Res>  {
  factory $RsvpSessionEventCopyWith(RsvpSessionEvent value, $Res Function(RsvpSessionEvent) _then) = _$RsvpSessionEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$RsvpSessionEventCopyWithImpl<$Res>
    implements $RsvpSessionEventCopyWith<$Res> {
  _$RsvpSessionEventCopyWithImpl(this._self, this._then);

  final RsvpSessionEvent _self;
  final $Res Function(RsvpSessionEvent) _then;

/// Create a copy of RsvpSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RsvpSessionEvent].
extension RsvpSessionEventPatterns on RsvpSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RsvpSessionE value)?  rsvpSession,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RsvpSessionE() when rsvpSession != null:
return rsvpSession(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RsvpSessionE value)  rsvpSession,}){
final _that = this;
switch (_that) {
case _RsvpSessionE():
return rsvpSession(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RsvpSessionE value)?  rsvpSession,}){
final _that = this;
switch (_that) {
case _RsvpSessionE() when rsvpSession != null:
return rsvpSession(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  rsvpSession,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RsvpSessionE() when rsvpSession != null:
return rsvpSession(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  rsvpSession,}) {final _that = this;
switch (_that) {
case _RsvpSessionE():
return rsvpSession(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  rsvpSession,}) {final _that = this;
switch (_that) {
case _RsvpSessionE() when rsvpSession != null:
return rsvpSession(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _RsvpSessionE implements RsvpSessionEvent {
  const _RsvpSessionE(this.id);
  

@override final  int id;

/// Create a copy of RsvpSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RsvpSessionECopyWith<_RsvpSessionE> get copyWith => __$RsvpSessionECopyWithImpl<_RsvpSessionE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RsvpSessionE&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RsvpSessionEvent.rsvpSession(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RsvpSessionECopyWith<$Res> implements $RsvpSessionEventCopyWith<$Res> {
  factory _$RsvpSessionECopyWith(_RsvpSessionE value, $Res Function(_RsvpSessionE) _then) = __$RsvpSessionECopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$RsvpSessionECopyWithImpl<$Res>
    implements _$RsvpSessionECopyWith<$Res> {
  __$RsvpSessionECopyWithImpl(this._self, this._then);

  final _RsvpSessionE _self;
  final $Res Function(_RsvpSessionE) _then;

/// Create a copy of RsvpSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RsvpSessionE(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
