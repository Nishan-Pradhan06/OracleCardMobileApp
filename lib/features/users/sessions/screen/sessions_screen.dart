import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/heading_widget.dart';
import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';
import 'package:oracle_card_app/features/users/sessions/blocs/get_upcomming_session/get_upcomming_session_bloc.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../home/widgets/notification_widget.dart';
import '../widgets/session_card_widget.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sessions',
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetUpcommingSessionBloc>().add(
              GetUpcommingSessionEvent.getUpCommingSession(),
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  const HeadingWidget(
                    title: 'Group Sessions',
                    subtitle:
                        'Join live guided sessions with our spiritual community.',
                  ),

                  BlocBuilder<
                    GetUpcommingSessionBloc,
                    GetUpcommingSessionState
                  >(
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
                        loaded: (upCommingSessionData) {
                          return ListView.builder(
                            itemCount: upCommingSessionData.items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final session = upCommingSessionData.items[index];

                              return SessionsCardWidget(
                                dateText: session.startTime.toIso8601String(),
                                title: session.title,
                                description: session.description,
                                isButtonEnabled: session.rsvp,
                                onPressed: () {
                                  // context.pushNamed(
                                  //   // AppRoutesName.sessionsDetailsScreenScreenRoute,
                                  //   // extra: {
                                  //   //   'title': session.title,
                                  //   //   'dateTime': session.dateTime,
                                  //   // },
                                  // );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),

                  const UserPlanTypeWidget(
                    freePlan: UpgradePremiumButtonWidget(),
                    paidPlan: SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
