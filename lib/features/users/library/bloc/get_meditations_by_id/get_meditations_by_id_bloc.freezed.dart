// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_meditations_by_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetMeditationsByIdEvent {

 int get meditationId;
/// Create a copy of GetMeditationsByIdEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMeditationsByIdEventCopyWith<GetMeditationsByIdEvent> get copyWith => _$GetMeditationsByIdEventCopyWithImpl<GetMeditationsByIdEvent>(this as GetMeditationsByIdEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMeditationsByIdEvent&&(identical(other.meditationId, meditationId) || other.meditationId == meditationId));
}


@override
int get hashCode => Object.hash(runtimeType,meditationId);

@override
String toString() {
  return 'GetMeditationsByIdEvent(meditationId: $meditationId)';
}


}

/// @nodoc
abstract mixin class $GetMeditationsByIdEventCopyWith<$Res>  {
  factory $GetMeditationsByIdEventCopyWith(GetMeditationsByIdEvent value, $Res Function(GetMeditationsByIdEvent) _then) = _$GetMeditationsByIdEventCopyWithImpl;
@useResult
$Res call({
 int meditationId
});




}
/// @nodoc
class _$GetMeditationsByIdEventCopyWithImpl<$Res>
    implements $GetMeditationsByIdEventCopyWith<$Res> {
  _$GetMeditationsByIdEventCopyWithImpl(this._self, this._then);

  final GetMeditationsByIdEvent _self;
  final $Res Function(GetMeditationsByIdEvent) _then;

/// Create a copy of GetMeditationsByIdEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meditationId = null,}) {
  return _then(_self.copyWith(
meditationId: null == meditationId ? _self.meditationId : meditationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetMeditationsByIdEvent].
extension GetMeditationsByIdEventPatterns on GetMeditationsByIdEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetMeditationsByIdE value)?  getMeditationsById,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMeditationsByIdE() when getMeditationsById != null:
return getMeditationsById(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetMeditationsByIdE value)  getMeditationsById,}){
final _that = this;
switch (_that) {
case _GetMeditationsByIdE():
return getMeditationsById(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetMeditationsByIdE value)?  getMeditationsById,}){
final _that = this;
switch (_that) {
case _GetMeditationsByIdE() when getMeditationsById != null:
return getMeditationsById(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int meditationId)?  getMeditationsById,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMeditationsByIdE() when getMeditationsById != null:
return getMeditationsById(_that.meditationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int meditationId)  getMeditationsById,}) {final _that = this;
switch (_that) {
case _GetMeditationsByIdE():
return getMeditationsById(_that.meditationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int meditationId)?  getMeditationsById,}) {final _that = this;
switch (_that) {
case _GetMeditationsByIdE() when getMeditationsById != null:
return getMeditationsById(_that.meditationId);case _:
  return null;

}
}

}

/// @nodoc


class _GetMeditationsByIdE implements GetMeditationsByIdEvent {
  const _GetMeditationsByIdE({required this.meditationId});
  

@override final  int meditationId;

/// Create a copy of GetMeditationsByIdEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMeditationsByIdECopyWith<_GetMeditationsByIdE> get copyWith => __$GetMeditationsByIdECopyWithImpl<_GetMeditationsByIdE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMeditationsByIdE&&(identical(other.meditationId, meditationId) || other.meditationId == meditationId));
}


@override
int get hashCode => Object.hash(runtimeType,meditationId);

@override
String toString() {
  return 'GetMeditationsByIdEvent.getMeditationsById(meditationId: $meditationId)';
}


}

/// @nodoc
abstract mixin class _$GetMeditationsByIdECopyWith<$Res> implements $GetMeditationsByIdEventCopyWith<$Res> {
  factory _$GetMeditationsByIdECopyWith(_GetMeditationsByIdE value, $Res Function(_GetMeditationsByIdE) _then) = __$GetMeditationsByIdECopyWithImpl;
@override @useResult
$Res call({
 int meditationId
});




}
/// @nodoc
class __$GetMeditationsByIdECopyWithImpl<$Res>
    implements _$GetMeditationsByIdECopyWith<$Res> {
  __$GetMeditationsByIdECopyWithImpl(this._self, this._then);

  final _GetMeditationsByIdE _self;
  final $Res Function(_GetMeditationsByIdE) _then;

/// Create a copy of GetMeditationsByIdEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meditationId = null,}) {
  return _then(_GetMeditationsByIdE(
meditationId: null == meditationId ? _self.meditationId : meditationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
