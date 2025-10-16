import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/heading_widget.dart';
import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';
import '../models/session_model.dart';
import '../widgets/session_card_widget.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  // ✅ Example list of sessions
  List<Session> get sessions => const [
    Session(
      dateTime: 'Jun 15, 6:00 PM',
      title: 'Angel Connection Circle',
      description:
          'Connect with your angels and receive messages in this guided group meditation session.',
      isButtonEnabled: true,
    ),
    Session(
      dateTime: 'Jun 18, 7:30 PM',
      title: 'Tarot Insights Workshop',
      description:
          'Learn to interpret tarot cards and gain deeper insights into your life path.',
      isButtonEnabled: true,
    ),
    Session(
      dateTime: 'Jun 22, 9:00 PM',
      title: 'Full Moon Meditation',
      description:
          'Harness the energy of the full moon for manifestation and release.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sessions',
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(), CustomChip()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            // add refresh logic if needed
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

                  // ✅ Dynamically build cards from the model
                  ...sessions.map(
                    (session) => SessionsCardWidget(
                      dateText: session.dateTime,
                      title: session.title,
                      description: session.description,
                      isButtonEnabled: session.isButtonEnabled,
                      onPressed: () {
                        context.pushNamed(
                          AppRoutesName.sessionsDetailsScreenScreenRoute,
                          extra: {
                            'title': session.title,
                            'dateTime': session.dateTime,
                          },
                        );
                      },
                    ),
                  ),

                  const UpgradePremiumButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
