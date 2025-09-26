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
import '../widgets/prompt_card_widget.dart';

class JournalDetailsScreen extends StatelessWidget {
  final String title;
  final String prompt;
  final String date;
  final String description;
  final String? day;
  const JournalDetailsScreen({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.prompt,
    this.day,
  });

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
                        Text(date, style: TextTheme.of(context).bodyLarge),

                        PromptCard(title: '$day Prompt', prompt: prompt),
                        Text(
                          description,
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
