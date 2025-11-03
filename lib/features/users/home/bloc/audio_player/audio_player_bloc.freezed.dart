// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioPlayerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioPlayerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioPlayerEvent()';
}


}

/// @nodoc
class $AudioPlayerEventCopyWith<$Res>  {
$AudioPlayerEventCopyWith(AudioPlayerEvent _, $Res Function(AudioPlayerEvent) __);
}


/// Adds pattern-matching-related methods to [AudioPlayerEvent].
extension AudioPlayerEventPatterns on AudioPlayerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Play value)?  play,TResult Function( _Pause value)?  pause,TResult Function( _Resume value)?  resume,TResult Function( _Stop value)?  stop,TResult Function( _Seek value)?  seek,TResult Function( _DurationChanged value)?  durationChanged,TResult Function( _PositionChanged value)?  positionChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Play() when play != null:
return play(_that);case _Pause() when pause != null:
return pause(_that);case _Resume() when resume != null:
return resume(_that);case _Stop() when stop != null:
return stop(_that);case _Seek() when seek != null:
return seek(_that);case _DurationChanged() when durationChanged != null:
return durationChanged(_that);case _PositionChanged() when positionChanged != null:
return positionChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Play value)  play,required TResult Function( _Pause value)  pause,required TResult Function( _Resume value)  resume,required TResult Function( _Stop value)  stop,required TResult Function( _Seek value)  seek,required TResult Function( _DurationChanged value)  durationChanged,required TResult Function( _PositionChanged value)  positionChanged,}){
final _that = this;
switch (_that) {
case _Play():
return play(_that);case _Pause():
return pause(_that);case _Resume():
return resume(_that);case _Stop():
return stop(_that);case _Seek():
return seek(_that);case _DurationChanged():
return durationChanged(_that);case _PositionChanged():
return positionChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Play value)?  play,TResult? Function( _Pause value)?  pause,TResult? Function( _Resume value)?  resume,TResult? Function( _Stop value)?  stop,TResult? Function( _Seek value)?  seek,TResult? Function( _DurationChanged value)?  durationChanged,TResult? Function( _PositionChanged value)?  positionChanged,}){
final _that = this;
switch (_that) {
case _Play() when play != null:
return play(_that);case _Pause() when pause != null:
return pause(_that);case _Resume() when resume != null:
return resume(_that);case _Stop() when stop != null:
return stop(_that);case _Seek() when seek != null:
return seek(_that);case _DurationChanged() when durationChanged != null:
return durationChanged(_that);case _PositionChanged() when positionChanged != null:
return positionChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String audioUrl)?  play,TResult Function()?  pause,TResult Function()?  resume,TResult Function()?  stop,TResult Function( double position)?  seek,TResult Function( Duration duration)?  durationChanged,TResult Function( Duration position)?  positionChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Play() when play != null:
return play(_that.audioUrl);case _Pause() when pause != null:
return pause();case _Resume() when resume != null:
return resume();case _Stop() when stop != null:
return stop();case _Seek() when seek != null:
return seek(_that.position);case _DurationChanged() when durationChanged != null:
return durationChanged(_that.duration);case _PositionChanged() when positionChanged != null:
return positionChanged(_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String audioUrl)  play,required TResult Function()  pause,required TResult Function()  resume,required TResult Function()  stop,required TResult Function( double position)  seek,required TResult Function( Duration duration)  durationChanged,required TResult Function( Duration position)  positionChanged,}) {final _that = this;
switch (_that) {
case _Play():
return play(_that.audioUrl);case _Pause():
return pause();case _Resume():
return resume();case _Stop():
return stop();case _Seek():
return seek(_that.position);case _DurationChanged():
return durationChanged(_that.duration);case _PositionChanged():
return positionChanged(_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String audioUrl)?  play,TResult? Function()?  pause,TResult? Function()?  resume,TResult? Function()?  stop,TResult? Function( double position)?  seek,TResult? Function( Duration duration)?  durationChanged,TResult? Function( Duration position)?  positionChanged,}) {final _that = this;
switch (_that) {
case _Play() when play != null:
return play(_that.audioUrl);case _Pause() when pause != null:
return pause();case _Resume() when resume != null:
return resume();case _Stop() when stop != null:
return stop();case _Seek() when seek != null:
return seek(_that.position);case _DurationChanged() when durationChanged != null:
return durationChanged(_that.duration);case _PositionChanged() when positionChanged != null:
return positionChanged(_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _Play implements AudioPlayerEvent {
  const _Play(this.audioUrl);
  

 final  String audioUrl;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayCopyWith<_Play> get copyWith => __$PlayCopyWithImpl<_Play>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Play&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl));
}


@override
int get hashCode => Object.hash(runtimeType,audioUrl);

@override
String toString() {
  return 'AudioPlayerEvent.play(audioUrl: $audioUrl)';
}


}

/// @nodoc
abstract mixin class _$PlayCopyWith<$Res> implements $AudioPlayerEventCopyWith<$Res> {
  factory _$PlayCopyWith(_Play value, $Res Function(_Play) _then) = __$PlayCopyWithImpl;
@useResult
$Res call({
 String audioUrl
});




}
/// @nodoc
class __$PlayCopyWithImpl<$Res>
    implements _$PlayCopyWith<$Res> {
  __$PlayCopyWithImpl(this._self, this._then);

  final _Play _self;
  final $Res Function(_Play) _then;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? audioUrl = null,}) {
  return _then(_Play(
null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Pause implements AudioPlayerEvent {
  const _Pause();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pause);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioPlayerEvent.pause()';
}


}




/// @nodoc


class _Resume implements AudioPlayerEvent {
  const _Resume();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resume);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioPlayerEvent.resume()';
}


}




/// @nodoc


class _Stop implements AudioPlayerEvent {
  const _Stop();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stop);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioPlayerEvent.stop()';
}


}




/// @nodoc


class _Seek implements AudioPlayerEvent {
  const _Seek(this.position);
  

 final  double position;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeekCopyWith<_Seek> get copyWith => __$SeekCopyWithImpl<_Seek>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seek&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'AudioPlayerEvent.seek(position: $position)';
}


}

/// @nodoc
abstract mixin class _$SeekCopyWith<$Res> implements $AudioPlayerEventCopyWith<$Res> {
  factory _$SeekCopyWith(_Seek value, $Res Function(_Seek) _then) = __$SeekCopyWithImpl;
@useResult
$Res call({
 double position
});




}
/// @nodoc
class __$SeekCopyWithImpl<$Res>
    implements _$SeekCopyWith<$Res> {
  __$SeekCopyWithImpl(this._self, this._then);

  final _Seek _self;
  final $Res Function(_Seek) _then;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_Seek(
null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _DurationChanged implements AudioPlayerEvent {
  const _DurationChanged(this.duration);
  

 final  Duration duration;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DurationChangedCopyWith<_DurationChanged> get copyWith => __$DurationChangedCopyWithImpl<_DurationChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DurationChanged&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'AudioPlayerEvent.durationChanged(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$DurationChangedCopyWith<$Res> implements $AudioPlayerEventCopyWith<$Res> {
  factory _$DurationChangedCopyWith(_DurationChanged value, $Res Function(_DurationChanged) _then) = __$DurationChangedCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class __$DurationChangedCopyWithImpl<$Res>
    implements _$DurationChangedCopyWith<$Res> {
  __$DurationChangedCopyWithImpl(this._self, this._then);

  final _DurationChanged _self;
  final $Res Function(_DurationChanged) _then;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_DurationChanged(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _PositionChanged implements AudioPlayerEvent {
  const _PositionChanged(this.position);
  

 final  Duration position;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PositionChangedCopyWith<_PositionChanged> get copyWith => __$PositionChangedCopyWithImpl<_PositionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PositionChanged&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'AudioPlayerEvent.positionChanged(position: $position)';
}


}

/// @nodoc
abstract mixin class _$PositionChangedCopyWith<$Res> implements $AudioPlayerEventCopyWith<$Res> {
  factory _$PositionChangedCopyWith(_PositionChanged value, $Res Function(_PositionChanged) _then) = __$PositionChangedCopyWithImpl;
@useResult
$Res call({
 Duration position
});




}
/// @nodoc
class __$PositionChangedCopyWithImpl<$Res>
    implements _$PositionChangedCopyWith<$Res> {
  __$PositionChangedCopyWithImpl(this._self, this._then);

  final _PositionChanged _self;
  final $Res Function(_PositionChanged) _then;

/// Create a copy of AudioPlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_PositionChanged(
null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
