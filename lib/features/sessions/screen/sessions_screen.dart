import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/heading_widget.dart';
import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';

import '../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sessions',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: CustomPadding(
            child: Column(
              spacing: 10,
              children: [
                HeadingWidget(
                  title: 'Group Sessions',
                  subtitle:
                      'Join live guided sessions with our spiritual community.',
                ),
                UpgradePremiumButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
