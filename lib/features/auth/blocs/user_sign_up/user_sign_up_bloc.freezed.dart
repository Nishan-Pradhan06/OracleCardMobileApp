// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSignUpEvent {

 SignUpModel get signUpModel;
/// Create a copy of UserSignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSignUpEventCopyWith<UserSignUpEvent> get copyWith => _$UserSignUpEventCopyWithImpl<UserSignUpEvent>(this as UserSignUpEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSignUpEvent&&(identical(other.signUpModel, signUpModel) || other.signUpModel == signUpModel));
}


@override
int get hashCode => Object.hash(runtimeType,signUpModel);

@override
String toString() {
  return 'UserSignUpEvent(signUpModel: $signUpModel)';
}


}

/// @nodoc
abstract mixin class $UserSignUpEventCopyWith<$Res>  {
  factory $UserSignUpEventCopyWith(UserSignUpEvent value, $Res Function(UserSignUpEvent) _then) = _$UserSignUpEventCopyWithImpl;
@useResult
$Res call({
 SignUpModel signUpModel
});




}
/// @nodoc
class _$UserSignUpEventCopyWithImpl<$Res>
    implements $UserSignUpEventCopyWith<$Res> {
  _$UserSignUpEventCopyWithImpl(this._self, this._then);

  final UserSignUpEvent _self;
  final $Res Function(UserSignUpEvent) _then;

/// Create a copy of UserSignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signUpModel = null,}) {
  return _then(_self.copyWith(
signUpModel: null == signUpModel ? _self.signUpModel : signUpModel // ignore: cast_nullable_to_non_nullable
as SignUpModel,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSignUpEvent].
extension UserSignUpEventPatterns on UserSignUpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UserSignUpModelEvent value)?  userSignUp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSignUpModelEvent() when userSignUp != null:
return userSignUp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UserSignUpModelEvent value)  userSignUp,}){
final _that = this;
switch (_that) {
case _UserSignUpModelEvent():
return userSignUp(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UserSignUpModelEvent value)?  userSignUp,}){
final _that = this;
switch (_that) {
case _UserSignUpModelEvent() when userSignUp != null:
return userSignUp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignUpModel signUpModel)?  userSignUp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSignUpModelEvent() when userSignUp != null:
return userSignUp(_that.signUpModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignUpModel signUpModel)  userSignUp,}) {final _that = this;
switch (_that) {
case _UserSignUpModelEvent():
return userSignUp(_that.signUpModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignUpModel signUpModel)?  userSignUp,}) {final _that = this;
switch (_that) {
case _UserSignUpModelEvent() when userSignUp != null:
return userSignUp(_that.signUpModel);case _:
  return null;

}
}

}

/// @nodoc


class _UserSignUpModelEvent implements UserSignUpEvent {
  const _UserSignUpModelEvent(this.signUpModel);
  

@override final  SignUpModel signUpModel;

/// Create a copy of UserSignUpEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSignUpModelEventCopyWith<_UserSignUpModelEvent> get copyWith => __$UserSignUpModelEventCopyWithImpl<_UserSignUpModelEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSignUpModelEvent&&(identical(other.signUpModel, signUpModel) || other.signUpModel == signUpModel));
}


@override
int get hashCode => Object.hash(runtimeType,signUpModel);

@override
String toString() {
  return 'UserSignUpEvent.userSignUp(signUpModel: $signUpModel)';
}


}

/// @nodoc
abstract mixin class _$UserSignUpModelEventCopyWith<$Res> implements $UserSignUpEventCopyWith<$Res> {
  factory _$UserSignUpModelEventCopyWith(_UserSignUpModelEvent value, $Res Function(_UserSignUpModelEvent) _then) = __$UserSignUpModelEventCopyWithImpl;
@override @useResult
$Res call({
 SignUpModel signUpModel
});




}
/// @nodoc
class __$UserSignUpModelEventCopyWithImpl<$Res>
    implements _$UserSignUpModelEventCopyWith<$Res> {
  __$UserSignUpModelEventCopyWithImpl(this._self, this._then);

  final _UserSignUpModelEvent _self;
  final $Res Function(_UserSignUpModelEvent) _then;

/// Create a copy of UserSignUpEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signUpModel = null,}) {
  return _then(_UserSignUpModelEvent(
null == signUpModel ? _self.signUpModel : signUpModel // ignore: cast_nullable_to_non_nullable
as SignUpModel,
  ));
}


}

// dart format on
