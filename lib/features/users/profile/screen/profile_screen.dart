import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
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
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ProfileAvatar(
                  imagePath:
                      'https://avatars.githubusercontent.com/u/105001135?v=4',
                  userName: 'John Doe',
                  onCameraTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
