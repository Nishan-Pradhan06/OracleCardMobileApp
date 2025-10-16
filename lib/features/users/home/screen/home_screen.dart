import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/helpers/user_session_helper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/upgrade_premium_button_widget.dart';
import '../models/home_container_model.dart';
import '../widgets/custom_card_button.dart';
import '../../../../core/widgets/custom_container.dart';
import '../widgets/home_container.dart';
import '../widgets/notification_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final freePlan = UserPlanType().isFree;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Oracle Card App',
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(hasNotification: true), CustomChip()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),

            child: CustomPadding(
              child: Column(
                spacing: 20,
                children: [
                  CustomContainer(
                    isGradient: true,
                    showSvgOverlay: true,
                    useIntrinsicHeight: true,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          Text(
                            'Today\'s Oracle',
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Tap to reveal your message',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.white, fontSize: 18),
                          ),
                          CustomCardButton(
                            leading: SvgPicture.asset(
                              'assets/svg/shuffle.svg',
                              height: 15,
                              width: 15,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            action: Text(
                              '0/1',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.white),
                            ),
                            text: "Random Pull",
                            onPressed: () {
                              // Handle button press
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomContainer(
                    height: MediaQuery.sizeOf(context).height / 3.8,
                    useIntrinsicHeight: true,
                    padding: EdgeInsetsGeometry.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    isGradient: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          'Daily Guidance',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Your angels are watching over you today. Trust your intuition and follow your heart.',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontSize: 20,
                                color: Color(0xFF333333).withValues(alpha: 0.7),
                              ),
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFF5F5F5),
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFCCCCCC),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: LinearProgressIndicator(
                                  color: Color(0xFF6B48FF),
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Color(0xFFE0E0E0),
                                  value: 10,
                                ),
                              ),
                              Text('0:00'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),

                    shrinkWrap: true,
                    itemCount: homeItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final item = homeItems[index];
                      return HomeContainer(
                        svgUrl: item.svgUrl,
                        title: item.title,
                        description: item.description,
                      );
                    },
                  ),
                  freePlan ? UpgradePremiumButtonWidget() : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
