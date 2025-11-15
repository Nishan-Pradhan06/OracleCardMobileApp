// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_daily_guidance_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateDailyGuidanceEvent {

 AdminDailyGuidanceModel get adminDailyGuidanceM;
/// Create a copy of CreateDailyGuidanceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDailyGuidanceEventCopyWith<CreateDailyGuidanceEvent> get copyWith => _$CreateDailyGuidanceEventCopyWithImpl<CreateDailyGuidanceEvent>(this as CreateDailyGuidanceEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDailyGuidanceEvent&&(identical(other.adminDailyGuidanceM, adminDailyGuidanceM) || other.adminDailyGuidanceM == adminDailyGuidanceM));
}


@override
int get hashCode => Object.hash(runtimeType,adminDailyGuidanceM);

@override
String toString() {
  return 'CreateDailyGuidanceEvent(adminDailyGuidanceM: $adminDailyGuidanceM)';
}


}

/// @nodoc
abstract mixin class $CreateDailyGuidanceEventCopyWith<$Res>  {
  factory $CreateDailyGuidanceEventCopyWith(CreateDailyGuidanceEvent value, $Res Function(CreateDailyGuidanceEvent) _then) = _$CreateDailyGuidanceEventCopyWithImpl;
@useResult
$Res call({
 AdminDailyGuidanceModel adminDailyGuidanceM
});




}
/// @nodoc
class _$CreateDailyGuidanceEventCopyWithImpl<$Res>
    implements $CreateDailyGuidanceEventCopyWith<$Res> {
  _$CreateDailyGuidanceEventCopyWithImpl(this._self, this._then);

  final CreateDailyGuidanceEvent _self;
  final $Res Function(CreateDailyGuidanceEvent) _then;

/// Create a copy of CreateDailyGuidanceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adminDailyGuidanceM = null,}) {
  return _then(_self.copyWith(
adminDailyGuidanceM: null == adminDailyGuidanceM ? _self.adminDailyGuidanceM : adminDailyGuidanceM // ignore: cast_nullable_to_non_nullable
as AdminDailyGuidanceModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDailyGuidanceEvent].
extension CreateDailyGuidanceEventPatterns on CreateDailyGuidanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateDailyGuidanceE value)?  createDailyGuidance,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDailyGuidanceE() when createDailyGuidance != null:
return createDailyGuidance(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateDailyGuidanceE value)  createDailyGuidance,}){
final _that = this;
switch (_that) {
case _CreateDailyGuidanceE():
return createDailyGuidance(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateDailyGuidanceE value)?  createDailyGuidance,}){
final _that = this;
switch (_that) {
case _CreateDailyGuidanceE() when createDailyGuidance != null:
return createDailyGuidance(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AdminDailyGuidanceModel adminDailyGuidanceM)?  createDailyGuidance,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDailyGuidanceE() when createDailyGuidance != null:
return createDailyGuidance(_that.adminDailyGuidanceM);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AdminDailyGuidanceModel adminDailyGuidanceM)  createDailyGuidance,}) {final _that = this;
switch (_that) {
case _CreateDailyGuidanceE():
return createDailyGuidance(_that.adminDailyGuidanceM);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AdminDailyGuidanceModel adminDailyGuidanceM)?  createDailyGuidance,}) {final _that = this;
switch (_that) {
case _CreateDailyGuidanceE() when createDailyGuidance != null:
return createDailyGuidance(_that.adminDailyGuidanceM);case _:
  return null;

}
}

}

/// @nodoc


class _CreateDailyGuidanceE implements CreateDailyGuidanceEvent {
  const _CreateDailyGuidanceE(this.adminDailyGuidanceM);
  

@override final  AdminDailyGuidanceModel adminDailyGuidanceM;

/// Create a copy of CreateDailyGuidanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDailyGuidanceECopyWith<_CreateDailyGuidanceE> get copyWith => __$CreateDailyGuidanceECopyWithImpl<_CreateDailyGuidanceE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDailyGuidanceE&&(identical(other.adminDailyGuidanceM, adminDailyGuidanceM) || other.adminDailyGuidanceM == adminDailyGuidanceM));
}


@override
int get hashCode => Object.hash(runtimeType,adminDailyGuidanceM);

@override
String toString() {
  return 'CreateDailyGuidanceEvent.createDailyGuidance(adminDailyGuidanceM: $adminDailyGuidanceM)';
}


}

/// @nodoc
abstract mixin class _$CreateDailyGuidanceECopyWith<$Res> implements $CreateDailyGuidanceEventCopyWith<$Res> {
  factory _$CreateDailyGuidanceECopyWith(_CreateDailyGuidanceE value, $Res Function(_CreateDailyGuidanceE) _then) = __$CreateDailyGuidanceECopyWithImpl;
@override @useResult
$Res call({
 AdminDailyGuidanceModel adminDailyGuidanceM
});




}
/// @nodoc
class __$CreateDailyGuidanceECopyWithImpl<$Res>
    implements _$CreateDailyGuidanceECopyWith<$Res> {
  __$CreateDailyGuidanceECopyWithImpl(this._self, this._then);

  final _CreateDailyGuidanceE _self;
  final $Res Function(_CreateDailyGuidanceE) _then;

/// Create a copy of CreateDailyGuidanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adminDailyGuidanceM = null,}) {
  return _then(_CreateDailyGuidanceE(
null == adminDailyGuidanceM ? _self.adminDailyGuidanceM : adminDailyGuidanceM // ignore: cast_nullable_to_non_nullable
as AdminDailyGuidanceModel,
  ));
}


}

// dart format on
