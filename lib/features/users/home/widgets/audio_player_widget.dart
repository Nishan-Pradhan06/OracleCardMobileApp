// ...existing code...
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:oracle_card_app/features/users/home/bloc/audio_player/audio_player_bloc.dart';
import '../../../../core/widgets/custom_container.dart';

class AudioPlayerWidget extends StatefulWidget {
  final AudioPlayerBloc bloc;
  final String audioUrl;
  final bool
  autoplay; // added - default false so it won't auto-play unless you want

  const AudioPlayerWidget({
    required this.bloc,
    required this.audioUrl,
    this.autoplay = false,
    super.key,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  PlayerState? _playerState;
  @override
  void initState() {
    super.initState();
    if (widget.autoplay) {
      widget.bloc.add(AudioPlayerEvent.play(widget.audioUrl));
    }
  }

  void _onSeek(double progress) {
    // progress expected as 0.0 - 1.0
    widget.bloc.add(AudioPlayerEvent.seek(progress));
  }

  @override
  void dispose() {
    // always send stop when widget is disposed so playback stops
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
        Duration duration = Duration.zero;
        Duration position = Duration.zero;

        state.whenOrNull(
          loading: () => isLoading = true,
          loaded: (data) {
            _playerState = data.playerState;
            duration = data.duration;
            position = data.position;
            isPlaying = data.playerState == PlayerState.playing;
          },
        );

        final progress = (duration.inMilliseconds == 0)
            ? 0.0
            : (position.inMilliseconds / duration.inMilliseconds).clamp(
                0.0,
                1.0,
              );

        String twoDigits(int n) => n.toString().padLeft(2, '0');
        String formatTime(Duration d) {
          final minutes = twoDigits(d.inMinutes.remainder(60));
          final seconds = twoDigits(d.inSeconds.remainder(60));
          return '$minutes:$seconds';
        }

        return CustomContainer(
          height: MediaQuery.sizeOf(context).height / 7.2,
          backgroundColor: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
          child: Column(
            spacing: 10,
            children: [
              Row(
                spacing: 20,
                children: [
                  Container(
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
                                  _playerState == PlayerState.stopped &&
                                      isPlaying == false) {
                                widget.bloc.add(
                                  AudioPlayerEvent.play(widget.audioUrl),
                                );
                                return;
                              } else if (isPlaying) {
                                widget.bloc.add(const AudioPlayerEvent.pause());
                              } else {
                                widget.bloc.add(
                                  const AudioPlayerEvent.resume(),
                                );
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
                              isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${formatTime(position)} / ${formatTime(duration)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Daily Guidance',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onHorizontalDragUpdate: (details) {
                        final newProgress =
                            (details.localPosition.dx / constraints.maxWidth)
                                .clamp(0.0, 1.0);
                        _onSeek(newProgress);
                      },
                      onTapDown: (details) {
                        final newProgress =
                            (details.localPosition.dx / constraints.maxWidth)
                                .clamp(0.0, 1.0);
                        _onSeek(newProgress);
                      },
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 6,
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 6,
                            width: constraints.maxWidth * progress,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6B48FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
