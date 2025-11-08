// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_meditations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateMeditationsEvent {

 CreateMeditationsModel get createMeditationM;
/// Create a copy of CreateMeditationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMeditationsEventCopyWith<CreateMeditationsEvent> get copyWith => _$CreateMeditationsEventCopyWithImpl<CreateMeditationsEvent>(this as CreateMeditationsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMeditationsEvent&&(identical(other.createMeditationM, createMeditationM) || other.createMeditationM == createMeditationM));
}


@override
int get hashCode => Object.hash(runtimeType,createMeditationM);

@override
String toString() {
  return 'CreateMeditationsEvent(createMeditationM: $createMeditationM)';
}


}

/// @nodoc
abstract mixin class $CreateMeditationsEventCopyWith<$Res>  {
  factory $CreateMeditationsEventCopyWith(CreateMeditationsEvent value, $Res Function(CreateMeditationsEvent) _then) = _$CreateMeditationsEventCopyWithImpl;
@useResult
$Res call({
 CreateMeditationsModel createMeditationM
});




}
/// @nodoc
class _$CreateMeditationsEventCopyWithImpl<$Res>
    implements $CreateMeditationsEventCopyWith<$Res> {
  _$CreateMeditationsEventCopyWithImpl(this._self, this._then);

  final CreateMeditationsEvent _self;
  final $Res Function(CreateMeditationsEvent) _then;

/// Create a copy of CreateMeditationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createMeditationM = null,}) {
  return _then(_self.copyWith(
createMeditationM: null == createMeditationM ? _self.createMeditationM : createMeditationM // ignore: cast_nullable_to_non_nullable
as CreateMeditationsModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMeditationsEvent].
extension CreateMeditationsEventPatterns on CreateMeditationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateMeditationE value)?  createMeditations,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMeditationE() when createMeditations != null:
return createMeditations(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateMeditationE value)  createMeditations,}){
final _that = this;
switch (_that) {
case _CreateMeditationE():
return createMeditations(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateMeditationE value)?  createMeditations,}){
final _that = this;
switch (_that) {
case _CreateMeditationE() when createMeditations != null:
return createMeditations(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CreateMeditationsModel createMeditationM)?  createMeditations,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMeditationE() when createMeditations != null:
return createMeditations(_that.createMeditationM);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CreateMeditationsModel createMeditationM)  createMeditations,}) {final _that = this;
switch (_that) {
case _CreateMeditationE():
return createMeditations(_that.createMeditationM);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CreateMeditationsModel createMeditationM)?  createMeditations,}) {final _that = this;
switch (_that) {
case _CreateMeditationE() when createMeditations != null:
return createMeditations(_that.createMeditationM);case _:
  return null;

}
}

}

/// @nodoc


class _CreateMeditationE implements CreateMeditationsEvent {
  const _CreateMeditationE(this.createMeditationM);
  

@override final  CreateMeditationsModel createMeditationM;

/// Create a copy of CreateMeditationsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMeditationECopyWith<_CreateMeditationE> get copyWith => __$CreateMeditationECopyWithImpl<_CreateMeditationE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMeditationE&&(identical(other.createMeditationM, createMeditationM) || other.createMeditationM == createMeditationM));
}


@override
int get hashCode => Object.hash(runtimeType,createMeditationM);

@override
String toString() {
  return 'CreateMeditationsEvent.createMeditations(createMeditationM: $createMeditationM)';
}


}

/// @nodoc
abstract mixin class _$CreateMeditationECopyWith<$Res> implements $CreateMeditationsEventCopyWith<$Res> {
  factory _$CreateMeditationECopyWith(_CreateMeditationE value, $Res Function(_CreateMeditationE) _then) = __$CreateMeditationECopyWithImpl;
@override @useResult
$Res call({
 CreateMeditationsModel createMeditationM
});




}
/// @nodoc
class __$CreateMeditationECopyWithImpl<$Res>
    implements _$CreateMeditationECopyWith<$Res> {
  __$CreateMeditationECopyWithImpl(this._self, this._then);

  final _CreateMeditationE _self;
  final $Res Function(_CreateMeditationE) _then;

/// Create a copy of CreateMeditationsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createMeditationM = null,}) {
  return _then(_CreateMeditationE(
null == createMeditationM ? _self.createMeditationM : createMeditationM // ignore: cast_nullable_to_non_nullable
as CreateMeditationsModel,
  ));
}


}

// dart format on
