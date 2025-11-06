// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_journal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostJournalEvent {

 JournalEntryModel get journalEntryModel;
/// Create a copy of PostJournalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostJournalEventCopyWith<PostJournalEvent> get copyWith => _$PostJournalEventCopyWithImpl<PostJournalEvent>(this as PostJournalEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostJournalEvent&&(identical(other.journalEntryModel, journalEntryModel) || other.journalEntryModel == journalEntryModel));
}


@override
int get hashCode => Object.hash(runtimeType,journalEntryModel);

@override
String toString() {
  return 'PostJournalEvent(journalEntryModel: $journalEntryModel)';
}


}

/// @nodoc
abstract mixin class $PostJournalEventCopyWith<$Res>  {
  factory $PostJournalEventCopyWith(PostJournalEvent value, $Res Function(PostJournalEvent) _then) = _$PostJournalEventCopyWithImpl;
@useResult
$Res call({
 JournalEntryModel journalEntryModel
});




}
/// @nodoc
class _$PostJournalEventCopyWithImpl<$Res>
    implements $PostJournalEventCopyWith<$Res> {
  _$PostJournalEventCopyWithImpl(this._self, this._then);

  final PostJournalEvent _self;
  final $Res Function(PostJournalEvent) _then;

/// Create a copy of PostJournalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? journalEntryModel = null,}) {
  return _then(_self.copyWith(
journalEntryModel: null == journalEntryModel ? _self.journalEntryModel : journalEntryModel // ignore: cast_nullable_to_non_nullable
as JournalEntryModel,
  ));
}

}


/// Adds pattern-matching-related methods to [PostJournalEvent].
extension PostJournalEventPatterns on PostJournalEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PostJournalE value)?  postJournal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostJournalE() when postJournal != null:
return postJournal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PostJournalE value)  postJournal,}){
final _that = this;
switch (_that) {
case _PostJournalE():
return postJournal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PostJournalE value)?  postJournal,}){
final _that = this;
switch (_that) {
case _PostJournalE() when postJournal != null:
return postJournal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( JournalEntryModel journalEntryModel)?  postJournal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostJournalE() when postJournal != null:
return postJournal(_that.journalEntryModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( JournalEntryModel journalEntryModel)  postJournal,}) {final _that = this;
switch (_that) {
case _PostJournalE():
return postJournal(_that.journalEntryModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( JournalEntryModel journalEntryModel)?  postJournal,}) {final _that = this;
switch (_that) {
case _PostJournalE() when postJournal != null:
return postJournal(_that.journalEntryModel);case _:
  return null;

}
}

}

/// @nodoc


class _PostJournalE implements PostJournalEvent {
  const _PostJournalE(this.journalEntryModel);
  

@override final  JournalEntryModel journalEntryModel;

/// Create a copy of PostJournalEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostJournalECopyWith<_PostJournalE> get copyWith => __$PostJournalECopyWithImpl<_PostJournalE>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostJournalE&&(identical(other.journalEntryModel, journalEntryModel) || other.journalEntryModel == journalEntryModel));
}


@override
int get hashCode => Object.hash(runtimeType,journalEntryModel);

@override
String toString() {
  return 'PostJournalEvent.postJournal(journalEntryModel: $journalEntryModel)';
}


}

/// @nodoc
abstract mixin class _$PostJournalECopyWith<$Res> implements $PostJournalEventCopyWith<$Res> {
  factory _$PostJournalECopyWith(_PostJournalE value, $Res Function(_PostJournalE) _then) = __$PostJournalECopyWithImpl;
@override @useResult
$Res call({
 JournalEntryModel journalEntryModel
});




}
/// @nodoc
class __$PostJournalECopyWithImpl<$Res>
    implements _$PostJournalECopyWith<$Res> {
  __$PostJournalECopyWithImpl(this._self, this._then);

  final _PostJournalE _self;
  final $Res Function(_PostJournalE) _then;

/// Create a copy of PostJournalEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? journalEntryModel = null,}) {
  return _then(_PostJournalE(
null == journalEntryModel ? _self.journalEntryModel : journalEntryModel // ignore: cast_nullable_to_non_nullable
as JournalEntryModel,
  ));
}


}

// dart format on
