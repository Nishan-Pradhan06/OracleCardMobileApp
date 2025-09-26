import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../router/app_routes_names.dart';
import '../widgets/prompt_card_widget.dart';

class CreateJoruneyEntiresScreen extends StatelessWidget {
  const CreateJoruneyEntiresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Entry',
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
                children: [
                  PromptCard(
                    title: 'Today\'s Prompt',
                    prompt: 'What blessings are you grateful for today?',
                  ),
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: CustomTextField(
                      hint: 'Start writing your reflection\nhere...',
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                      noBorder: true,
                      hintStyle: TextTheme.of(
                        context,
                      ).titleLarge?.copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          leadingIcon: SvgPicture.asset(
                            'assets/icons/time.svg',
                          ),
                          backgroundColor: Color(0xFFF0F0F0),
                          textColor: Colors.black,
                          text: 'Save\nTemporarily',
                          fontSize: 22,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          fontSize: 22,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          leadingIcon: SvgPicture.asset(
                            'assets/icons/king.svg',
                          ),
                          text: 'Upgrade to\nSave',
                          onPressed: () {
                            context.pushNamed(
                              AppRoutesName.billingDetailsScreen,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Free plan: notes auto-delete after 24h',
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Colors.grey),
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
