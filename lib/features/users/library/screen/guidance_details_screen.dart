import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';

class GuidanceDetailsScreen extends StatelessWidget {
  const GuidanceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Guidance Archive',
        actions: [CustomChip(label: 'Premium', type: ChipType.premium)],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(child: CustomPadding(child: Column())),
        ),
      ),
    );
  }
}
