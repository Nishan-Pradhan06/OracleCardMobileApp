// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'audio_player_bloc.dart';


typedef AudioPlayerState = BaseState<AudioLoadedState>;

class AudioLoadedState {
  final Duration duration;
  final Duration position;
  final PlayerState playerState;
  AudioLoadedState({
    this.duration = Duration.zero,
    this.position = Duration.zero,
    required this.playerState,
  });

  AudioLoadedState copyWith({
    Duration? duration,
    Duration? position,
    PlayerState? playerState,
  }) {
    return AudioLoadedState(
      duration: duration ?? this.duration,
      position: position ?? this.position,
      playerState: playerState ?? this.playerState,
    );
  }
}
