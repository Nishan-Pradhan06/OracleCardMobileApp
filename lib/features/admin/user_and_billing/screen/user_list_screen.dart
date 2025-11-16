import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

import '../../../../core/widgets/admin_appbar.dart';
import '../widget/user_list_widget_container.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(
        title: 'Daily Guidance',
        automaticallyImplyLeading: true,
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: UserListWidgetContainer(
                userName: 'Alex Jhonson',
                email: 'alex.johnson@example.com',
                status: 'Premium',
                subStatus: 'Active',
                nextBilling: 'Sep 20, 2025, 08:00 AM +0545',
                pullCount: '15',
                journalCount: '5',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
