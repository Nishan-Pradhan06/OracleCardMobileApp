import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';

class SessionsDetailsScreen extends StatelessWidget {
  final String title;
  final String dateTime;
  const SessionsDetailsScreen({
    super.key,
    required this.title,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sessions Details',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: CustomContainer(
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
                          title,
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
                          ).withValues(alpha: .16),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  dateTime,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                ),
                                Text(
                                  '6:00 PM - 7:30 PM(EST)',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    CustomContainer(
                      onTap: () {
                        context.pushNamed(
                          AppRoutesName.joinSessionScreenAppRoutes,
                          extra: {'title': title},
                        );
                      },
                      useIntrinsicHeight: true,
                      borderRadius: BorderRadius.circular(12),
                      backgroundColor: Color(0xFFF5F5F5),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Zoom Metting',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                            ),
                            Text(
                              '6:00 PM - 7:30 PM(EST)',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                            ),
                          ],
                        ),
                      ),
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
