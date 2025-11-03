part of 'audio_player_bloc.dart';

@freezed
class AudioPlayerEvent with _$AudioPlayerEvent {
  const factory AudioPlayerEvent.play(String audioUrl) = _Play;
  const factory AudioPlayerEvent.pause() = _Pause;
  const factory AudioPlayerEvent.resume() = _Resume;
  const factory AudioPlayerEvent.stop() = _Stop;
  ///position usually have in -0 to 1 
  const factory AudioPlayerEvent.seek(double position) = _Seek;
  const factory AudioPlayerEvent.durationChanged(Duration duration) =
      _DurationChanged;
  const factory AudioPlayerEvent.positionChanged(Duration position) =
      _PositionChanged;
}
