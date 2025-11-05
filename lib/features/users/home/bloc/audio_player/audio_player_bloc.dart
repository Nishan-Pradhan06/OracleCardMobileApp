import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/common/error/failure.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';
part 'audio_player_bloc.freezed.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<void>? _playerCompleteSub;
  StreamSubscription<Duration>? _durationSub;
  StreamSubscription<Duration>? _positionSub;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  PlayerState _lastPlayerState = PlayerState.stopped;

  AudioLoadedState? _loadedState;

  AudioPlayerBloc() : super(AudioPlayerState.initial()) {
    on<_Play>(_onPlay);
    on<_Pause>(_onPause);
    on<_Resume>(_onResume);
    on<_Stop>(_onStop);
    on<_Seek>(_onSeek);

    on<_DurationChanged>(_onDurationChanged);
    on<_PositionChanged>(_onPositionChanged);

    _playerCompleteSub = _audioPlayer.onPlayerComplete.listen((_) {
      add(const AudioPlayerEvent.stop());
    });

    _playerStateSub = _audioPlayer.onPlayerStateChanged.listen((state) {
      _lastPlayerState = state;

      if (state == PlayerState.completed) {
        add(const AudioPlayerEvent.stop());
      }
    });

    _durationSub = _audioPlayer.onDurationChanged.listen((d) {
      add(AudioPlayerEvent.durationChanged(d));
    });

    _positionSub = _audioPlayer.onPositionChanged.listen((p) {
      add(AudioPlayerEvent.positionChanged(p));
    });
  }

  Future<void> _onPlay(_Play event, Emitter<AudioPlayerState> emit) async {
    emit(AudioPlayerState.loading());
    try {
      final url = event.audioUrl.replaceAll('localhost', '192.168.1.65');
      await _audioPlayer.play(UrlSource(url));

      _lastPlayerState = PlayerState.playing;

      _loadedState = AudioLoadedState(
        playerState: _lastPlayerState,
        duration: _duration,
        position: _position,
      );

      emit(AudioPlayerState.loaded(_loadedState!));
    } catch (e) {
      emit(AudioPlayerState.failure(UnexpectedFailure(message: e.toString())));
    }
  }

  Future<void> _onPause(_Pause event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayer.pause();
    _lastPlayerState = PlayerState.paused;
    _loadedState =
        (_loadedState ?? AudioLoadedState(playerState: _lastPlayerState))
            .copyWith(
              playerState: _lastPlayerState,
              duration: _duration,
              position: _position,
            );
    emit(AudioPlayerState.loaded(_loadedState!));
  }

  Future<void> _onResume(_Resume event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayer.resume();
    _lastPlayerState = PlayerState.playing;
    _loadedState =
        (_loadedState ?? AudioLoadedState(playerState: _lastPlayerState))
            .copyWith(
              playerState: _lastPlayerState,
              duration: _duration,
              position: _position,
            );
    emit(AudioPlayerState.loaded(_loadedState!));
  }

  Future<void> _onStop(_Stop event, Emitter<AudioPlayerState> emit) async {
    try {
      await _audioPlayer.stop();
    } catch (_) {}
    _lastPlayerState = PlayerState.stopped;
    _position = Duration.zero;
    _loadedState =
        (_loadedState ?? AudioLoadedState(playerState: _lastPlayerState))
            .copyWith(
              playerState: _lastPlayerState,
              duration: _duration,
              position: _position,
            );
    emit(AudioPlayerState.loaded(_loadedState!));
  }

  Future<void> _onSeek(_Seek event, Emitter<AudioPlayerState> emit) async {
    try {
      final totalDuration = _duration.inSeconds;

      final seekInSecond = (totalDuration * event.position).round();
      final seekDuration = Duration(seconds: seekInSecond);
      await _audioPlayer.seek(seekDuration);
      _position = seekDuration;
      _loadedState =
          (_loadedState ?? AudioLoadedState(playerState: _lastPlayerState))
              .copyWith(
                position: _position,
                duration: _duration,
                playerState: _lastPlayerState,
              );
      emit(AudioPlayerState.loaded(_loadedState!));
    } catch (e) {
      emit(AudioPlayerState.failure(UnexpectedFailure(message: e.toString())));
    }
  }

  Future<void> _onDurationChanged(
    _DurationChanged event,
    Emitter<AudioPlayerState> emit,
  ) async {
    _duration = event.duration;

    if (_loadedState != null) {
      _loadedState = _loadedState!.copyWith(duration: _duration);
      emit(AudioPlayerState.loaded(_loadedState!));
    }
  }

  Future<void> _onPositionChanged(
    _PositionChanged event,
    Emitter<AudioPlayerState> emit,
  ) async {
    _position = event.position;
    if (_loadedState != null) {
      _loadedState = _loadedState!.copyWith(position: _position);
      emit(AudioPlayerState.loaded(_loadedState!));
    }
  }

  @override
  Future<void> close() {
    _playerStateSub?.cancel();
    _playerCompleteSub?.cancel();
    _durationSub?.cancel();
    _positionSub?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
