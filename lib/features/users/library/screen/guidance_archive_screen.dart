import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/utils/date_time_utils.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/users/library/bloc/get_guidance_archive/get_guidance_archive_bloc.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../../../router/app_routes_names.dart';
import '../widgets/guidance_card_widget.dart';

class GuidanceArchiveScreen extends StatelessWidget {
  const GuidanceArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Guidance Archive',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetGuidanceArchiveBloc>().add(
              GetGuidanceArchiveEvent.getGuidanceArchive(),
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child:
                  BlocBuilder<GetGuidanceArchiveBloc, GetGuidanceArchiveState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(height: 100),
                        loading: () => ShimmerLoaderWidget(
                          isList: true,
                          count: 5,
                          spacing: 10,
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
                          return ListView.builder(
                            itemCount: data.items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final guidanceArchiveList = data.items[index];
                              final formmatedDate =
                                  DateTimeUtils.formatShortDate(
                                    guidanceArchiveList.scheduledAt.toString(),
                                  );

                              return GuidanceCardWidget(
                                title: guidanceArchiveList.title,
                                description: guidanceArchiveList.message,
                                dateTime: formmatedDate,
                                isLock: !guidanceArchiveList.hasAudio,
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutesName
                                        .guidanceArchiveDetailScreenRoute,
                                    extra: {
                                      'title': guidanceArchiveList.title,
                                      'dateTime': formmatedDate,
                                      'description':
                                          guidanceArchiveList.message,
                                    },
                                  );
                                },
                              );
                            },
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
