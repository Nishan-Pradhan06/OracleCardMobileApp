// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grant_promo_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GrantPromoCodeEvent {

 String get promoCode; int get userId;
/// Create a copy of GrantPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GrantPromoCodeEventCopyWith<GrantPromoCodeEvent> get copyWith => _$GrantPromoCodeEventCopyWithImpl<GrantPromoCodeEvent>(this as GrantPromoCodeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GrantPromoCodeEvent&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,promoCode,userId);

@override
String toString() {
  return 'GrantPromoCodeEvent(promoCode: $promoCode, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GrantPromoCodeEventCopyWith<$Res>  {
  factory $GrantPromoCodeEventCopyWith(GrantPromoCodeEvent value, $Res Function(GrantPromoCodeEvent) _then) = _$GrantPromoCodeEventCopyWithImpl;
@useResult
$Res call({
 String promoCode, int userId
});




}
/// @nodoc
class _$GrantPromoCodeEventCopyWithImpl<$Res>
    implements $GrantPromoCodeEventCopyWith<$Res> {
  _$GrantPromoCodeEventCopyWithImpl(this._self, this._then);

  final GrantPromoCodeEvent _self;
  final $Res Function(GrantPromoCodeEvent) _then;

/// Create a copy of GrantPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promoCode = null,Object? userId = null,}) {
  return _then(_self.copyWith(
promoCode: null == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GrantPromoCodeEvent].
extension GrantPromoCodeEventPatterns on GrantPromoCodeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GrantPromoCodeE value)?  grantPromoCode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GrantPromoCodeE() when grantPromoCode != null:
return grantPromoCode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GrantPromoCodeE value)  grantPromoCode,}){
final _that = this;
switch (_that) {
case _GrantPromoCodeE():
return grantPromoCode(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GrantPromoCodeE value)?  grantPromoCode,}){
final _that = this;
switch (_that) {
case _GrantPromoCodeE() when grantPromoCode != null:
return grantPromoCode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String promoCode,  int userId)?  grantPromoCode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GrantPromoCodeE() when grantPromoCode != null:
return grantPromoCode(_that.promoCode,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String promoCode,  int userId)  grantPromoCode,}) {final _that = this;
switch (_that) {
case _GrantPromoCodeE():
return grantPromoCode(_that.promoCode,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String promoCode,  int userId)?  grantPromoCode,}) {final _that = this;
switch (_that) {
case _GrantPromoCodeE() when grantPromoCode != null:
return grantPromoCode(_that.promoCode,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _GrantPromoCodeE implements GrantPromoCodeEvent {
  const _GrantPromoCodeE(this.promoCode, this.userId);
  

@override final  String promoCode;
@override final  int userId;

/// Create a copy of GrantPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GrantPromoCodeECopyWith<_GrantPromoCodeE> get copyWith => __$GrantPromoCodeECopyWithImpl<_GrantPromoCodeE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GrantPromoCodeE&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,promoCode,userId);

@override
String toString() {
  return 'GrantPromoCodeEvent.grantPromoCode(promoCode: $promoCode, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$GrantPromoCodeECopyWith<$Res> implements $GrantPromoCodeEventCopyWith<$Res> {
  factory _$GrantPromoCodeECopyWith(_GrantPromoCodeE value, $Res Function(_GrantPromoCodeE) _then) = __$GrantPromoCodeECopyWithImpl;
@override @useResult
$Res call({
 String promoCode, int userId
});




}
/// @nodoc
class __$GrantPromoCodeECopyWithImpl<$Res>
    implements _$GrantPromoCodeECopyWith<$Res> {
  __$GrantPromoCodeECopyWithImpl(this._self, this._then);

  final _GrantPromoCodeE _self;
  final $Res Function(_GrantPromoCodeE) _then;

/// Create a copy of GrantPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promoCode = null,Object? userId = null,}) {
  return _then(_GrantPromoCodeE(
null == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String,null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
