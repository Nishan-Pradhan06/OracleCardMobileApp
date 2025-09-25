import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../router/app_routes_names.dart';

class JournalDetailsScreen extends StatelessWidget {
  const JournalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Entry Details',
        titleAlignment: TitleAlignment.left,
        actions: [CustomChip(label: 'Premium', type: ChipType.premium)],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          'Today, 10:30 AM',
                          style: TextTheme.of(context).bodyLarge,
                        ),

                        PickupOrderCard(),
                        Text(
                          'I pulled The Star card today and felt an immediate sense of hope and renewal. The message resonated deeply with me as I\'ve been going through a period of uncertainty in my career.\n\nThe card reminded me to trust in the universe\'s plan and have faith that everything is unfolding as it should. I\'m grateful for the small signs I\'ve been receiving that I\'m on the right path.\n\nToday, I\'m especially thankful for:\n- The supportive friends who listened to my concerns\n- The beautiful sunrise that greeted me this morning\n- The unexpected opportunity that came my way\n\nI\'m learning to embrace the journey rather than focusing solely on the destination.',
                          style: TextTheme.of(
                            context,
                          ).bodyLarge?.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      spacing: 20,
                      children: [
                        SvgPicture.asset('assets/icons/circle_lock.svg'),
                        Text(
                          'Unlock Full Access',
                          style: TextTheme.of(
                            context,
                          ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Upgrade to Premium to view and edit your journal entries permanently',
                          textAlign: TextAlign.center,
                          style: TextTheme.of(context).bodyLarge,
                        ),
                        CustomButton(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          leadingIcon: SvgPicture.asset(
                            'assets/icons/king.svg',
                          ),
                          text: 'Upgrade Now',
                          onPressed: () {
                            context.pushNamed(
                              AppRoutesName.billingDetailsScreen,
                            );
                          },
                        ),
                      ],
                    ),
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

class PickupOrderCard extends StatelessWidget {
  const PickupOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          // Orange bar
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFF6B48FF),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // Card
          CustomContainer(
            backgroundColor: Colors.red,
            // backgroundColor: Color(0xFF6B48FF).withValues(alpha: 0.5),
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
