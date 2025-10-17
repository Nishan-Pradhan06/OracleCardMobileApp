import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../bloc/get_daily_guidance/get_daily_guidance_bloc.dart';

class DailyGuidanceScreen extends StatefulWidget {
  const DailyGuidanceScreen({super.key});

  @override
  State<DailyGuidanceScreen> createState() => _DailyGuidanceScreenState();
}

class _DailyGuidanceScreenState extends State<DailyGuidanceScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;
  bool isLoading = false;

  final String audioUrl = 'assets/audio.mp3';

  @override
  void initState() {
    super.initState();

    // 🔹 Preload the audio source so first tap reacts instantly
    _preloadAudio();

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() => _duration = d);
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() => _position = p);
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        isPlaying = false;
        _position = Duration.zero;
      });
    });
  }

  Future<void> _preloadAudio() async {
    try {
      await _audioPlayer.setSource(AssetSource(audioUrl));
    } catch (e) {
      debugPrint('Error preloading audio: $e');
    }
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Future<void> _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
      setState(() => isPlaying = false);
    } else {
      setState(() => isLoading = true);
      try {
        await _audioPlayer.resume(); // resume plays instantly after preload
        setState(() {
          isPlaying = true;
          isLoading = false;
        });
      } catch (e) {
        debugPrint('Audio play error: $e');
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _seekTo(double relative) async {
    final seekPosition = Duration(
      milliseconds: (_duration.inMilliseconds * relative).toInt(),
    );
    await _audioPlayer.seek(seekPosition);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_duration.inMilliseconds == 0)
        ? 0
        : _position.inMilliseconds / _duration.inMilliseconds;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Daily Guidance',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetDailyGuidanceBloc>().add(
              GetDailyGuidanceEvent.getDailyGuidance(),
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: BlocBuilder<GetDailyGuidanceBloc, GetDailyGuidanceState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(height: 100),
                    loading: () => const SizedBox(
                      height: 100,
                      child: ShimmerLoaderWidget(),
                    ),
                    failure: (failure) => SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Error: ${failure.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    loaded: (data) {
                      return CustomContainer(
                        useIntrinsicHeight: true,
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.scheduledAt.toString()),
                            Text(
                              data.title,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              data.message,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    fontSize: 20,
                                    color: const Color(
                                      0xFF333333,
                                    ).withValues(alpha: 0.7),
                                  ),
                            ),

                            // 🎵 AUDIO PLAYER CARD
                            CustomContainer(
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
                                              : _togglePlayPause,
                                          icon: isLoading
                                              ? const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: 2,
                                                      ),
                                                )
                                              : Icon(
                                                  isPlaying
                                                      ? Icons.pause_rounded
                                                      : Icons
                                                            .play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_formatTime(_position)} / ${_formatTime(_duration)}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'Daily Guidance',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // 🟣 SEEKABLE PROGRESS BAR
                                  Expanded(
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onHorizontalDragUpdate: (details) {
                                            final newProgress =
                                                (details.localPosition.dx /
                                                        constraints.maxWidth)
                                                    .clamp(0.0, 1.0);
                                            _seekTo(newProgress);
                                          },
                                          onTapDown: (details) {
                                            final newProgress =
                                                (details.localPosition.dx /
                                                        constraints.maxWidth)
                                                    .clamp(0.0, 1.0);
                                            _seekTo(newProgress);
                                          },
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Container(
                                                height: 6,
                                                width: constraints.maxWidth,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              Container(
                                                height: 6,
                                                width:
                                                    constraints.maxWidth *
                                                    progress,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFF6B48FF,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
