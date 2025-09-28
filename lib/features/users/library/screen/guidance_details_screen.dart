import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';

class GuidanceDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String dateTime;
  const GuidanceDetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Guidance Details',
        titleAlignment: TitleAlignment.left,
        actions: [CustomChip(label: 'Premium', type: ChipType.premium)],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: CustomContainer(
                useIntrinsicHeight: true,
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dateTime, style: TextTheme.of(context).bodyMedium),
                    Text(
                      title,
                      style: TextTheme.of(context).titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextTheme.of(context).bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
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
