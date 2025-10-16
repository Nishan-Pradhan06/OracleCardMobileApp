// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceRegisterEvent {

 DeviceRegisterModel get deviceRegisterModel;
/// Create a copy of DeviceRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRegisterEventCopyWith<DeviceRegisterEvent> get copyWith => _$DeviceRegisterEventCopyWithImpl<DeviceRegisterEvent>(this as DeviceRegisterEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRegisterEvent&&(identical(other.deviceRegisterModel, deviceRegisterModel) || other.deviceRegisterModel == deviceRegisterModel));
}


@override
int get hashCode => Object.hash(runtimeType,deviceRegisterModel);

@override
String toString() {
  return 'DeviceRegisterEvent(deviceRegisterModel: $deviceRegisterModel)';
}


}

/// @nodoc
abstract mixin class $DeviceRegisterEventCopyWith<$Res>  {
  factory $DeviceRegisterEventCopyWith(DeviceRegisterEvent value, $Res Function(DeviceRegisterEvent) _then) = _$DeviceRegisterEventCopyWithImpl;
@useResult
$Res call({
 DeviceRegisterModel deviceRegisterModel
});




}
/// @nodoc
class _$DeviceRegisterEventCopyWithImpl<$Res>
    implements $DeviceRegisterEventCopyWith<$Res> {
  _$DeviceRegisterEventCopyWithImpl(this._self, this._then);

  final DeviceRegisterEvent _self;
  final $Res Function(DeviceRegisterEvent) _then;

/// Create a copy of DeviceRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceRegisterModel = null,}) {
  return _then(_self.copyWith(
deviceRegisterModel: null == deviceRegisterModel ? _self.deviceRegisterModel : deviceRegisterModel // ignore: cast_nullable_to_non_nullable
as DeviceRegisterModel,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceRegisterEvent].
extension DeviceRegisterEventPatterns on DeviceRegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DeviceRegister value)?  deviceRegister,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceRegister() when deviceRegister != null:
return deviceRegister(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DeviceRegister value)  deviceRegister,}){
final _that = this;
switch (_that) {
case _DeviceRegister():
return deviceRegister(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DeviceRegister value)?  deviceRegister,}){
final _that = this;
switch (_that) {
case _DeviceRegister() when deviceRegister != null:
return deviceRegister(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DeviceRegisterModel deviceRegisterModel)?  deviceRegister,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceRegister() when deviceRegister != null:
return deviceRegister(_that.deviceRegisterModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DeviceRegisterModel deviceRegisterModel)  deviceRegister,}) {final _that = this;
switch (_that) {
case _DeviceRegister():
return deviceRegister(_that.deviceRegisterModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DeviceRegisterModel deviceRegisterModel)?  deviceRegister,}) {final _that = this;
switch (_that) {
case _DeviceRegister() when deviceRegister != null:
return deviceRegister(_that.deviceRegisterModel);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceRegister implements DeviceRegisterEvent {
  const _DeviceRegister(this.deviceRegisterModel);
  

@override final  DeviceRegisterModel deviceRegisterModel;

/// Create a copy of DeviceRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceRegisterCopyWith<_DeviceRegister> get copyWith => __$DeviceRegisterCopyWithImpl<_DeviceRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceRegister&&(identical(other.deviceRegisterModel, deviceRegisterModel) || other.deviceRegisterModel == deviceRegisterModel));
}


@override
int get hashCode => Object.hash(runtimeType,deviceRegisterModel);

@override
String toString() {
  return 'DeviceRegisterEvent.deviceRegister(deviceRegisterModel: $deviceRegisterModel)';
}


}

/// @nodoc
abstract mixin class _$DeviceRegisterCopyWith<$Res> implements $DeviceRegisterEventCopyWith<$Res> {
  factory _$DeviceRegisterCopyWith(_DeviceRegister value, $Res Function(_DeviceRegister) _then) = __$DeviceRegisterCopyWithImpl;
@override @useResult
$Res call({
 DeviceRegisterModel deviceRegisterModel
});




}
/// @nodoc
class __$DeviceRegisterCopyWithImpl<$Res>
    implements _$DeviceRegisterCopyWith<$Res> {
  __$DeviceRegisterCopyWithImpl(this._self, this._then);

  final _DeviceRegister _self;
  final $Res Function(_DeviceRegister) _then;

/// Create a copy of DeviceRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceRegisterModel = null,}) {
  return _then(_DeviceRegister(
null == deviceRegisterModel ? _self.deviceRegisterModel : deviceRegisterModel // ignore: cast_nullable_to_non_nullable
as DeviceRegisterModel,
  ));
}


}

// dart format on
