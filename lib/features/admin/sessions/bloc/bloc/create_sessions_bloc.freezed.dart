// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateSessionsEvent {

 CreateSessionModel get createSessonM;
/// Create a copy of CreateSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSessionsEventCopyWith<CreateSessionsEvent> get copyWith => _$CreateSessionsEventCopyWithImpl<CreateSessionsEvent>(this as CreateSessionsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSessionsEvent&&(identical(other.createSessonM, createSessonM) || other.createSessonM == createSessonM));
}


@override
int get hashCode => Object.hash(runtimeType,createSessonM);

@override
String toString() {
  return 'CreateSessionsEvent(createSessonM: $createSessonM)';
}


}

/// @nodoc
abstract mixin class $CreateSessionsEventCopyWith<$Res>  {
  factory $CreateSessionsEventCopyWith(CreateSessionsEvent value, $Res Function(CreateSessionsEvent) _then) = _$CreateSessionsEventCopyWithImpl;
@useResult
$Res call({
 CreateSessionModel createSessonM
});




}
/// @nodoc
class _$CreateSessionsEventCopyWithImpl<$Res>
    implements $CreateSessionsEventCopyWith<$Res> {
  _$CreateSessionsEventCopyWithImpl(this._self, this._then);

  final CreateSessionsEvent _self;
  final $Res Function(CreateSessionsEvent) _then;

/// Create a copy of CreateSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createSessonM = null,}) {
  return _then(_self.copyWith(
createSessonM: null == createSessonM ? _self.createSessonM : createSessonM // ignore: cast_nullable_to_non_nullable
as CreateSessionModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSessionsEvent].
extension CreateSessionsEventPatterns on CreateSessionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateSessionE value)?  createSession,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSessionE() when createSession != null:
return createSession(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateSessionE value)  createSession,}){
final _that = this;
switch (_that) {
case _CreateSessionE():
return createSession(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateSessionE value)?  createSession,}){
final _that = this;
switch (_that) {
case _CreateSessionE() when createSession != null:
return createSession(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CreateSessionModel createSessonM)?  createSession,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSessionE() when createSession != null:
return createSession(_that.createSessonM);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CreateSessionModel createSessonM)  createSession,}) {final _that = this;
switch (_that) {
case _CreateSessionE():
return createSession(_that.createSessonM);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CreateSessionModel createSessonM)?  createSession,}) {final _that = this;
switch (_that) {
case _CreateSessionE() when createSession != null:
return createSession(_that.createSessonM);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSessionE implements CreateSessionsEvent {
  const _CreateSessionE(this.createSessonM);
  

@override final  CreateSessionModel createSessonM;

/// Create a copy of CreateSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionECopyWith<_CreateSessionE> get copyWith => __$CreateSessionECopyWithImpl<_CreateSessionE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSessionE&&(identical(other.createSessonM, createSessonM) || other.createSessonM == createSessonM));
}


@override
int get hashCode => Object.hash(runtimeType,createSessonM);

@override
String toString() {
  return 'CreateSessionsEvent.createSession(createSessonM: $createSessonM)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionECopyWith<$Res> implements $CreateSessionsEventCopyWith<$Res> {
  factory _$CreateSessionECopyWith(_CreateSessionE value, $Res Function(_CreateSessionE) _then) = __$CreateSessionECopyWithImpl;
@override @useResult
$Res call({
 CreateSessionModel createSessonM
});




}
/// @nodoc
class __$CreateSessionECopyWithImpl<$Res>
    implements _$CreateSessionECopyWith<$Res> {
  __$CreateSessionECopyWithImpl(this._self, this._then);

  final _CreateSessionE _self;
  final $Res Function(_CreateSessionE) _then;

/// Create a copy of CreateSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createSessonM = null,}) {
  return _then(_CreateSessionE(
null == createSessonM ? _self.createSessonM : createSessonM // ignore: cast_nullable_to_non_nullable
as CreateSessionModel,
  ));
}


}

// dart format on
