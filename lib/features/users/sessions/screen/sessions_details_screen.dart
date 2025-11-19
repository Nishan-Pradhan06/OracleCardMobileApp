import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../../../router/app_routes_names.dart';
import '../../home/widgets/notification_widget.dart';

class SessionsDetailsScreen extends StatelessWidget {
  // final String title;
  // final String dateTime;
  const SessionsDetailsScreen({
    super.key,
    // required this.title,
    // required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sessions Details',
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: CustomContainer(
                useIntrinsicHeight: true,
                height: MediaQuery.sizeOf(context).height / 1.2,
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      spacing: 10,
                      children: [
                        Text(
                          'Angel Connection Circle',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                        ),
                        CustomContainer(
                          useIntrinsicHeight: true,
                          borderRadius: BorderRadius.circular(12),
                          backgroundColor: Color(
                            0xFF6B48FF,
                          ).withValues(alpha: .2),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/date_cal.svg',
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'June 15, 2024',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                        ),
                                        Text(
                                          '6:00 PM - 7:30 PM(EST)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Join us for a powerful group session where we\'ll connect with angelic energies and receive messages of guidance and support. This session will include a guided meditation, energy clearing, and an opportunity to ask questions and receive personal insights. Whether you\'re new to angel communication or have been working with angels for years, this circle will provide a sacred space for connection and growth. Come with an open heart and mind, and be ready to receive the blessings that await you.',
                          style: TextTheme.of(context).bodyLarge?.copyWith(
                            fontSize: 20,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),

                    CustomContainer(
                      backgroundColor: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      useIntrinsicHeight: true,
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.video_call),
                              SizedBox(width: 10),
                              Text(
                                'Zoom Meeting',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            'https://zoom.us/j/123456789',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  // decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      leadingIcon: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                      text: 'RSVP to This Session',
                    ),

                    CustomButton(
                      leadingIcon: Icon(
                        Icons.video_call,
                        color: Colors.white,
                        size: 15,
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      text: 'Join Session',
                      onPressed: () {
                        context.pushNamed(
                          AppRoutesName.joinSessionScreenAppRoutes,
                          extra: {'title': 'Angel Connection Circle'},
                        );
                      },
                    ),
                    CustomButton(
                      backgroundColor: Colors.grey[300],
                      leadingIcon: Icon(Icons.check, size: 15),
                      text: 'Cancel RSVP',
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
