// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_promo_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RedeemPromoCodeEvent {

 String get redeemPromoCode;
/// Create a copy of RedeemPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RedeemPromoCodeEventCopyWith<RedeemPromoCodeEvent> get copyWith => _$RedeemPromoCodeEventCopyWithImpl<RedeemPromoCodeEvent>(this as RedeemPromoCodeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RedeemPromoCodeEvent&&(identical(other.redeemPromoCode, redeemPromoCode) || other.redeemPromoCode == redeemPromoCode));
}


@override
int get hashCode => Object.hash(runtimeType,redeemPromoCode);

@override
String toString() {
  return 'RedeemPromoCodeEvent(redeemPromoCode: $redeemPromoCode)';
}


}

/// @nodoc
abstract mixin class $RedeemPromoCodeEventCopyWith<$Res>  {
  factory $RedeemPromoCodeEventCopyWith(RedeemPromoCodeEvent value, $Res Function(RedeemPromoCodeEvent) _then) = _$RedeemPromoCodeEventCopyWithImpl;
@useResult
$Res call({
 String redeemPromoCode
});




}
/// @nodoc
class _$RedeemPromoCodeEventCopyWithImpl<$Res>
    implements $RedeemPromoCodeEventCopyWith<$Res> {
  _$RedeemPromoCodeEventCopyWithImpl(this._self, this._then);

  final RedeemPromoCodeEvent _self;
  final $Res Function(RedeemPromoCodeEvent) _then;

/// Create a copy of RedeemPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? redeemPromoCode = null,}) {
  return _then(_self.copyWith(
redeemPromoCode: null == redeemPromoCode ? _self.redeemPromoCode : redeemPromoCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RedeemPromoCodeEvent].
extension RedeemPromoCodeEventPatterns on RedeemPromoCodeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RedeemPromoCodeE value)?  redeemPromoCode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RedeemPromoCodeE() when redeemPromoCode != null:
return redeemPromoCode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RedeemPromoCodeE value)  redeemPromoCode,}){
final _that = this;
switch (_that) {
case _RedeemPromoCodeE():
return redeemPromoCode(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RedeemPromoCodeE value)?  redeemPromoCode,}){
final _that = this;
switch (_that) {
case _RedeemPromoCodeE() when redeemPromoCode != null:
return redeemPromoCode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String redeemPromoCode)?  redeemPromoCode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RedeemPromoCodeE() when redeemPromoCode != null:
return redeemPromoCode(_that.redeemPromoCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String redeemPromoCode)  redeemPromoCode,}) {final _that = this;
switch (_that) {
case _RedeemPromoCodeE():
return redeemPromoCode(_that.redeemPromoCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String redeemPromoCode)?  redeemPromoCode,}) {final _that = this;
switch (_that) {
case _RedeemPromoCodeE() when redeemPromoCode != null:
return redeemPromoCode(_that.redeemPromoCode);case _:
  return null;

}
}

}

/// @nodoc


class _RedeemPromoCodeE implements RedeemPromoCodeEvent {
  const _RedeemPromoCodeE({required this.redeemPromoCode});
  

@override final  String redeemPromoCode;

/// Create a copy of RedeemPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedeemPromoCodeECopyWith<_RedeemPromoCodeE> get copyWith => __$RedeemPromoCodeECopyWithImpl<_RedeemPromoCodeE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedeemPromoCodeE&&(identical(other.redeemPromoCode, redeemPromoCode) || other.redeemPromoCode == redeemPromoCode));
}


@override
int get hashCode => Object.hash(runtimeType,redeemPromoCode);

@override
String toString() {
  return 'RedeemPromoCodeEvent.redeemPromoCode(redeemPromoCode: $redeemPromoCode)';
}


}

/// @nodoc
abstract mixin class _$RedeemPromoCodeECopyWith<$Res> implements $RedeemPromoCodeEventCopyWith<$Res> {
  factory _$RedeemPromoCodeECopyWith(_RedeemPromoCodeE value, $Res Function(_RedeemPromoCodeE) _then) = __$RedeemPromoCodeECopyWithImpl;
@override @useResult
$Res call({
 String redeemPromoCode
});




}
/// @nodoc
class __$RedeemPromoCodeECopyWithImpl<$Res>
    implements _$RedeemPromoCodeECopyWith<$Res> {
  __$RedeemPromoCodeECopyWithImpl(this._self, this._then);

  final _RedeemPromoCodeE _self;
  final $Res Function(_RedeemPromoCodeE) _then;

/// Create a copy of RedeemPromoCodeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? redeemPromoCode = null,}) {
  return _then(_RedeemPromoCodeE(
redeemPromoCode: null == redeemPromoCode ? _self.redeemPromoCode : redeemPromoCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
