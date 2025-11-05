// ...existing code...
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/users/home/bloc/audio_player/audio_player_bloc.dart';
import 'package:oracle_card_app/features/users/home/widgets/audio_player_widget.dart';
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
  final String audioUrl = 'assets/audio.mp3';

  late AudioPlayerBloc _audioPlayerBloc;

  @override
  void initState() {
    super.initState();
    // create bloc instance (if you use DI factory, replace this with sl<AudioPlayerBloc>())
    _audioPlayerBloc = AudioPlayerBloc();
  }

  @override
  void dispose() {
    // don't close if it's provided by DI; if created here and you want to close, uncomment:
    // _audioPlayerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

                            // 🎵 AUDIO PLAYER CARD - extracted widget
                            if (data.audioUrl != null)
                              AudioPlayerWidget(
                                bloc: _audioPlayerBloc,
                                audioUrl: data.audioUrl!,
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
