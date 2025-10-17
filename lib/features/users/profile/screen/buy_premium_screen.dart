import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../home/widgets/notification_widget.dart';

class BuyPremiumScreen extends StatelessWidget {
  const BuyPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    'Billing',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      spacing: 10,
                      children: [
                        SvgPicture.asset('assets/icons/king_circle.svg'),
                        Text(
                          'Upgrade to Premium',
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Text(
                          'Unlock all features including unlimited card pulls, full audio guidance, and permanent journal entries.',
                          textAlign: TextAlign.center,
                          style: TextTheme.of(
                            context,
                          ).bodyLarge?.copyWith(color: Colors.grey),
                        ),
                        CustomButton(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),

                          text: 'Upgrade to Premium',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          'Promo Code',
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hint: 'Enter promo code',
                                hintStyle: TextTheme.of(
                                  context,
                                ).bodyLarge?.copyWith(color: Colors.grey),
                              ),
                            ),
                            CustomButton(
                              width: 100,
                              text: 'Apply',
                              onPressed: () {},
                            ),
                          ],
                        ),

                        Text(
                          'Promo codes will be applied when you upgrade to Premium',
                          textAlign: TextAlign.center,
                          style: TextTheme.of(
                            context,
                          ).bodyMedium?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Premium Features',
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        FeatureListTile(
                          featureTitle: 'Unlimited daily card pulls',
                        ),
                        FeatureListTile(
                          featureTitle: 'Full audio guidance library',
                        ),
                        FeatureListTile(
                          featureTitle: 'Permanent journal entries',
                        ),
                        FeatureListTile(
                          featureTitle: 'Access to all meditations',
                        ),
                        FeatureListTile(featureTitle: 'Ad-free experience'),
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

class FeatureListTile extends StatelessWidget {
  final String featureTitle;
  const FeatureListTile({super.key, required this.featureTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        SvgPicture.asset('assets/icons/circle_mark.svg'),
        Text(featureTitle, style: TextTheme.of(context).bodyLarge),
      ],
    );
  }
}
