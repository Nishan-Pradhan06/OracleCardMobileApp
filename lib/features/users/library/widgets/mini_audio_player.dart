import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:oracle_card_app/features/users/home/bloc/audio_player/audio_player_bloc.dart';

class MiniAudioPlayerWidget extends StatefulWidget {
  final AudioPlayerBloc bloc;
  final String audioUrl;
  final bool autoplay;

  const MiniAudioPlayerWidget({
    super.key,
    required this.bloc,
    required this.audioUrl,
    this.autoplay = false,
  });

  @override
  State<MiniAudioPlayerWidget> createState() => _MiniAudioPlayerWidgetState();
}

class _MiniAudioPlayerWidgetState extends State<MiniAudioPlayerWidget> {
  PlayerState? _playerState;

  @override
  void initState() {
    super.initState();
    if (widget.autoplay) {
      widget.bloc.add(AudioPlayerEvent.play(widget.audioUrl));
    }
  }

  @override
  void dispose() {
    try {
      widget.bloc.add(const AudioPlayerEvent.stop());
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      bloc: widget.bloc,
      builder: (context, state) {
        bool isLoading = false;
        bool isPlaying = false;

        state.whenOrNull(
          loading: () => isLoading = true,
          loaded: (data) {
            _playerState = data.playerState;
            isPlaying = data.playerState == PlayerState.playing;
          },
        );

        return Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF6B48FF),
          ),
          child: IconButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_playerState == null ||
                        _playerState == PlayerState.stopped && !isPlaying) {
                      widget.bloc.add(AudioPlayerEvent.play(widget.audioUrl));
                      return;
                    } else if (isPlaying) {
                      widget.bloc.add(const AudioPlayerEvent.pause());
                    } else {
                      widget.bloc.add(const AudioPlayerEvent.resume());
                    }
                  },
            icon: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        );
      },
    );
  }
}
