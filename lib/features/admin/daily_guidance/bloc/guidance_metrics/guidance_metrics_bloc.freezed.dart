// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guidance_metrics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuidanceMetricsEvent {

 int get guidanceId;
/// Create a copy of GuidanceMetricsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuidanceMetricsEventCopyWith<GuidanceMetricsEvent> get copyWith => _$GuidanceMetricsEventCopyWithImpl<GuidanceMetricsEvent>(this as GuidanceMetricsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuidanceMetricsEvent&&(identical(other.guidanceId, guidanceId) || other.guidanceId == guidanceId));
}


@override
int get hashCode => Object.hash(runtimeType,guidanceId);

@override
String toString() {
  return 'GuidanceMetricsEvent(guidanceId: $guidanceId)';
}


}

/// @nodoc
abstract mixin class $GuidanceMetricsEventCopyWith<$Res>  {
  factory $GuidanceMetricsEventCopyWith(GuidanceMetricsEvent value, $Res Function(GuidanceMetricsEvent) _then) = _$GuidanceMetricsEventCopyWithImpl;
@useResult
$Res call({
 int guidanceId
});




}
/// @nodoc
class _$GuidanceMetricsEventCopyWithImpl<$Res>
    implements $GuidanceMetricsEventCopyWith<$Res> {
  _$GuidanceMetricsEventCopyWithImpl(this._self, this._then);

  final GuidanceMetricsEvent _self;
  final $Res Function(GuidanceMetricsEvent) _then;

/// Create a copy of GuidanceMetricsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guidanceId = null,}) {
  return _then(_self.copyWith(
guidanceId: null == guidanceId ? _self.guidanceId : guidanceId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GuidanceMetricsEvent].
extension GuidanceMetricsEventPatterns on GuidanceMetricsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GuidanceMetricsE value)?  getGuidanceMetrics,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuidanceMetricsE() when getGuidanceMetrics != null:
return getGuidanceMetrics(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GuidanceMetricsE value)  getGuidanceMetrics,}){
final _that = this;
switch (_that) {
case _GuidanceMetricsE():
return getGuidanceMetrics(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GuidanceMetricsE value)?  getGuidanceMetrics,}){
final _that = this;
switch (_that) {
case _GuidanceMetricsE() when getGuidanceMetrics != null:
return getGuidanceMetrics(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int guidanceId)?  getGuidanceMetrics,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuidanceMetricsE() when getGuidanceMetrics != null:
return getGuidanceMetrics(_that.guidanceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int guidanceId)  getGuidanceMetrics,}) {final _that = this;
switch (_that) {
case _GuidanceMetricsE():
return getGuidanceMetrics(_that.guidanceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int guidanceId)?  getGuidanceMetrics,}) {final _that = this;
switch (_that) {
case _GuidanceMetricsE() when getGuidanceMetrics != null:
return getGuidanceMetrics(_that.guidanceId);case _:
  return null;

}
}

}

/// @nodoc


class _GuidanceMetricsE implements GuidanceMetricsEvent {
  const _GuidanceMetricsE(this.guidanceId);
  

@override final  int guidanceId;

/// Create a copy of GuidanceMetricsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuidanceMetricsECopyWith<_GuidanceMetricsE> get copyWith => __$GuidanceMetricsECopyWithImpl<_GuidanceMetricsE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuidanceMetricsE&&(identical(other.guidanceId, guidanceId) || other.guidanceId == guidanceId));
}


@override
int get hashCode => Object.hash(runtimeType,guidanceId);

@override
String toString() {
  return 'GuidanceMetricsEvent.getGuidanceMetrics(guidanceId: $guidanceId)';
}


}

/// @nodoc
abstract mixin class _$GuidanceMetricsECopyWith<$Res> implements $GuidanceMetricsEventCopyWith<$Res> {
  factory _$GuidanceMetricsECopyWith(_GuidanceMetricsE value, $Res Function(_GuidanceMetricsE) _then) = __$GuidanceMetricsECopyWithImpl;
@override @useResult
$Res call({
 int guidanceId
});




}
/// @nodoc
class __$GuidanceMetricsECopyWithImpl<$Res>
    implements _$GuidanceMetricsECopyWith<$Res> {
  __$GuidanceMetricsECopyWithImpl(this._self, this._then);

  final _GuidanceMetricsE _self;
  final $Res Function(_GuidanceMetricsE) _then;

/// Create a copy of GuidanceMetricsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guidanceId = null,}) {
  return _then(_GuidanceMetricsE(
null == guidanceId ? _self.guidanceId : guidanceId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
