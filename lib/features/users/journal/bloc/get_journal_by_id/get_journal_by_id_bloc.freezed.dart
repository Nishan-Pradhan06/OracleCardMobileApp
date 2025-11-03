// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_journal_by_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetJournalByIdEvent {

 int get journalId;
/// Create a copy of GetJournalByIdEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetJournalByIdEventCopyWith<GetJournalByIdEvent> get copyWith => _$GetJournalByIdEventCopyWithImpl<GetJournalByIdEvent>(this as GetJournalByIdEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetJournalByIdEvent&&(identical(other.journalId, journalId) || other.journalId == journalId));
}


@override
int get hashCode => Object.hash(runtimeType,journalId);

@override
String toString() {
  return 'GetJournalByIdEvent(journalId: $journalId)';
}


}

/// @nodoc
abstract mixin class $GetJournalByIdEventCopyWith<$Res>  {
  factory $GetJournalByIdEventCopyWith(GetJournalByIdEvent value, $Res Function(GetJournalByIdEvent) _then) = _$GetJournalByIdEventCopyWithImpl;
@useResult
$Res call({
 int journalId
});




}
/// @nodoc
class _$GetJournalByIdEventCopyWithImpl<$Res>
    implements $GetJournalByIdEventCopyWith<$Res> {
  _$GetJournalByIdEventCopyWithImpl(this._self, this._then);

  final GetJournalByIdEvent _self;
  final $Res Function(GetJournalByIdEvent) _then;

/// Create a copy of GetJournalByIdEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? journalId = null,}) {
  return _then(_self.copyWith(
journalId: null == journalId ? _self.journalId : journalId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetJournalByIdEvent].
extension GetJournalByIdEventPatterns on GetJournalByIdEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetJournalByIdE value)?  getJournalById,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetJournalByIdE() when getJournalById != null:
return getJournalById(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetJournalByIdE value)  getJournalById,}){
final _that = this;
switch (_that) {
case _GetJournalByIdE():
return getJournalById(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetJournalByIdE value)?  getJournalById,}){
final _that = this;
switch (_that) {
case _GetJournalByIdE() when getJournalById != null:
return getJournalById(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int journalId)?  getJournalById,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetJournalByIdE() when getJournalById != null:
return getJournalById(_that.journalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int journalId)  getJournalById,}) {final _that = this;
switch (_that) {
case _GetJournalByIdE():
return getJournalById(_that.journalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int journalId)?  getJournalById,}) {final _that = this;
switch (_that) {
case _GetJournalByIdE() when getJournalById != null:
return getJournalById(_that.journalId);case _:
  return null;

}
}

}

/// @nodoc


class _GetJournalByIdE implements GetJournalByIdEvent {
  const _GetJournalByIdE({required this.journalId});
  

@override final  int journalId;

/// Create a copy of GetJournalByIdEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetJournalByIdECopyWith<_GetJournalByIdE> get copyWith => __$GetJournalByIdECopyWithImpl<_GetJournalByIdE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetJournalByIdE&&(identical(other.journalId, journalId) || other.journalId == journalId));
}


@override
int get hashCode => Object.hash(runtimeType,journalId);

@override
String toString() {
  return 'GetJournalByIdEvent.getJournalById(journalId: $journalId)';
}


}

/// @nodoc
abstract mixin class _$GetJournalByIdECopyWith<$Res> implements $GetJournalByIdEventCopyWith<$Res> {
  factory _$GetJournalByIdECopyWith(_GetJournalByIdE value, $Res Function(_GetJournalByIdE) _then) = __$GetJournalByIdECopyWithImpl;
@override @useResult
$Res call({
 int journalId
});




}
/// @nodoc
class __$GetJournalByIdECopyWithImpl<$Res>
    implements _$GetJournalByIdECopyWith<$Res> {
  __$GetJournalByIdECopyWithImpl(this._self, this._then);

  final _GetJournalByIdE _self;
  final $Res Function(_GetJournalByIdE) _then;

/// Create a copy of GetJournalByIdEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? journalId = null,}) {
  return _then(_GetJournalByIdE(
journalId: null == journalId ? _self.journalId : journalId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
