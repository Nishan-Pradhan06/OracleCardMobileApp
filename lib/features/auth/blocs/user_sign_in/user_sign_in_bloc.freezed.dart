// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSignInEvent {

 SignInModel get userSignInModel;
/// Create a copy of UserSignInEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSignInEventCopyWith<UserSignInEvent> get copyWith => _$UserSignInEventCopyWithImpl<UserSignInEvent>(this as UserSignInEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSignInEvent&&(identical(other.userSignInModel, userSignInModel) || other.userSignInModel == userSignInModel));
}


@override
int get hashCode => Object.hash(runtimeType,userSignInModel);

@override
String toString() {
  return 'UserSignInEvent(userSignInModel: $userSignInModel)';
}


}

/// @nodoc
abstract mixin class $UserSignInEventCopyWith<$Res>  {
  factory $UserSignInEventCopyWith(UserSignInEvent value, $Res Function(UserSignInEvent) _then) = _$UserSignInEventCopyWithImpl;
@useResult
$Res call({
 SignInModel userSignInModel
});




}
/// @nodoc
class _$UserSignInEventCopyWithImpl<$Res>
    implements $UserSignInEventCopyWith<$Res> {
  _$UserSignInEventCopyWithImpl(this._self, this._then);

  final UserSignInEvent _self;
  final $Res Function(UserSignInEvent) _then;

/// Create a copy of UserSignInEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userSignInModel = null,}) {
  return _then(_self.copyWith(
userSignInModel: null == userSignInModel ? _self.userSignInModel : userSignInModel // ignore: cast_nullable_to_non_nullable
as SignInModel,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSignInEvent].
extension UserSignInEventPatterns on UserSignInEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UserSignInModelEvent value)?  userSignIn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSignInModelEvent() when userSignIn != null:
return userSignIn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UserSignInModelEvent value)  userSignIn,}){
final _that = this;
switch (_that) {
case _UserSignInModelEvent():
return userSignIn(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UserSignInModelEvent value)?  userSignIn,}){
final _that = this;
switch (_that) {
case _UserSignInModelEvent() when userSignIn != null:
return userSignIn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignInModel userSignInModel)?  userSignIn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSignInModelEvent() when userSignIn != null:
return userSignIn(_that.userSignInModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignInModel userSignInModel)  userSignIn,}) {final _that = this;
switch (_that) {
case _UserSignInModelEvent():
return userSignIn(_that.userSignInModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignInModel userSignInModel)?  userSignIn,}) {final _that = this;
switch (_that) {
case _UserSignInModelEvent() when userSignIn != null:
return userSignIn(_that.userSignInModel);case _:
  return null;

}
}

}

/// @nodoc


class _UserSignInModelEvent implements UserSignInEvent {
  const _UserSignInModelEvent(this.userSignInModel);
  

@override final  SignInModel userSignInModel;

/// Create a copy of UserSignInEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSignInModelEventCopyWith<_UserSignInModelEvent> get copyWith => __$UserSignInModelEventCopyWithImpl<_UserSignInModelEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSignInModelEvent&&(identical(other.userSignInModel, userSignInModel) || other.userSignInModel == userSignInModel));
}


@override
int get hashCode => Object.hash(runtimeType,userSignInModel);

@override
String toString() {
  return 'UserSignInEvent.userSignIn(userSignInModel: $userSignInModel)';
}


}

/// @nodoc
abstract mixin class _$UserSignInModelEventCopyWith<$Res> implements $UserSignInEventCopyWith<$Res> {
  factory _$UserSignInModelEventCopyWith(_UserSignInModelEvent value, $Res Function(_UserSignInModelEvent) _then) = __$UserSignInModelEventCopyWithImpl;
@override @useResult
$Res call({
 SignInModel userSignInModel
});




}
/// @nodoc
class __$UserSignInModelEventCopyWithImpl<$Res>
    implements _$UserSignInModelEventCopyWith<$Res> {
  __$UserSignInModelEventCopyWithImpl(this._self, this._then);

  final _UserSignInModelEvent _self;
  final $Res Function(_UserSignInModelEvent) _then;

/// Create a copy of UserSignInEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userSignInModel = null,}) {
  return _then(_UserSignInModelEvent(
null == userSignInModel ? _self.userSignInModel : userSignInModel // ignore: cast_nullable_to_non_nullable
as SignInModel,
  ));
}


}

// dart format on
