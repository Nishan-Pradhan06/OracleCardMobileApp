import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';

class SessionsDetailsScreen extends StatelessWidget {
  const SessionsDetailsScreen({super.key});

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
      body: SingleChildScrollView(),
    );
  }
}
