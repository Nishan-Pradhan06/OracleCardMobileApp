// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patch_user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatchUserProfileEvent {

 UserProfileModel get userProfileModel;
/// Create a copy of PatchUserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchUserProfileEventCopyWith<PatchUserProfileEvent> get copyWith => _$PatchUserProfileEventCopyWithImpl<PatchUserProfileEvent>(this as PatchUserProfileEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchUserProfileEvent&&(identical(other.userProfileModel, userProfileModel) || other.userProfileModel == userProfileModel));
}


@override
int get hashCode => Object.hash(runtimeType,userProfileModel);

@override
String toString() {
  return 'PatchUserProfileEvent(userProfileModel: $userProfileModel)';
}


}

/// @nodoc
abstract mixin class $PatchUserProfileEventCopyWith<$Res>  {
  factory $PatchUserProfileEventCopyWith(PatchUserProfileEvent value, $Res Function(PatchUserProfileEvent) _then) = _$PatchUserProfileEventCopyWithImpl;
@useResult
$Res call({
 UserProfileModel userProfileModel
});




}
/// @nodoc
class _$PatchUserProfileEventCopyWithImpl<$Res>
    implements $PatchUserProfileEventCopyWith<$Res> {
  _$PatchUserProfileEventCopyWithImpl(this._self, this._then);

  final PatchUserProfileEvent _self;
  final $Res Function(PatchUserProfileEvent) _then;

/// Create a copy of PatchUserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userProfileModel = null,}) {
  return _then(_self.copyWith(
userProfileModel: null == userProfileModel ? _self.userProfileModel : userProfileModel // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchUserProfileEvent].
extension PatchUserProfileEventPatterns on PatchUserProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PatchUserProfileE value)?  patchUserProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchUserProfileE() when patchUserProfile != null:
return patchUserProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PatchUserProfileE value)  patchUserProfile,}){
final _that = this;
switch (_that) {
case _PatchUserProfileE():
return patchUserProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PatchUserProfileE value)?  patchUserProfile,}){
final _that = this;
switch (_that) {
case _PatchUserProfileE() when patchUserProfile != null:
return patchUserProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserProfileModel userProfileModel)?  patchUserProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchUserProfileE() when patchUserProfile != null:
return patchUserProfile(_that.userProfileModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserProfileModel userProfileModel)  patchUserProfile,}) {final _that = this;
switch (_that) {
case _PatchUserProfileE():
return patchUserProfile(_that.userProfileModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserProfileModel userProfileModel)?  patchUserProfile,}) {final _that = this;
switch (_that) {
case _PatchUserProfileE() when patchUserProfile != null:
return patchUserProfile(_that.userProfileModel);case _:
  return null;

}
}

}

/// @nodoc


class _PatchUserProfileE implements PatchUserProfileEvent {
  const _PatchUserProfileE({required this.userProfileModel});
  

@override final  UserProfileModel userProfileModel;

/// Create a copy of PatchUserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchUserProfileECopyWith<_PatchUserProfileE> get copyWith => __$PatchUserProfileECopyWithImpl<_PatchUserProfileE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchUserProfileE&&(identical(other.userProfileModel, userProfileModel) || other.userProfileModel == userProfileModel));
}


@override
int get hashCode => Object.hash(runtimeType,userProfileModel);

@override
String toString() {
  return 'PatchUserProfileEvent.patchUserProfile(userProfileModel: $userProfileModel)';
}


}

/// @nodoc
abstract mixin class _$PatchUserProfileECopyWith<$Res> implements $PatchUserProfileEventCopyWith<$Res> {
  factory _$PatchUserProfileECopyWith(_PatchUserProfileE value, $Res Function(_PatchUserProfileE) _then) = __$PatchUserProfileECopyWithImpl;
@override @useResult
$Res call({
 UserProfileModel userProfileModel
});




}
/// @nodoc
class __$PatchUserProfileECopyWithImpl<$Res>
    implements _$PatchUserProfileECopyWith<$Res> {
  __$PatchUserProfileECopyWithImpl(this._self, this._then);

  final _PatchUserProfileE _self;
  final $Res Function(_PatchUserProfileE) _then;

/// Create a copy of PatchUserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userProfileModel = null,}) {
  return _then(_PatchUserProfileE(
userProfileModel: null == userProfileModel ? _self.userProfileModel : userProfileModel // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}


}

// dart format on
