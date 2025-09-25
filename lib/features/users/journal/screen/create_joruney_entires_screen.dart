import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';

class CreateJoruneyEntiresScreen extends StatelessWidget {
  const CreateJoruneyEntiresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Entry Details',
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
              child: Column(
                children: [
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      children: [
                        Text(
                          'I pulled The Star card today and felt an immediate sense of hope and renewal. The message resonated deeply with me as I\'ve been going through a period of uncertainty in my career.\n\nThe card reminded me to trust in the universe\'s plan and have faith that everything is unfolding as it should. I\'m grateful for the small signs I\'ve been receiving that I\'m on the right path.',
                          style: TextTheme.of(context).bodySmall,
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
