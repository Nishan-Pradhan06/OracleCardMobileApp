import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_journal_by_id/get_journal_by_id_bloc.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../../../router/app_routes_names.dart';
import '../widgets/prompt_card_widget.dart';

class JournalDetailsScreen extends StatelessWidget {
  final int journalId;
  const JournalDetailsScreen({super.key, required this.journalId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Entry Details',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: BlocBuilder<GetJournalByIdBloc, GetJournalByIdState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(height: 100),
                    loading: () => ShimmerLoaderWidget(
                      isList: true,
                      count: 5,
                      spacing: 10,
                    ),
                    failure: (failure) => SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Error: ${failure.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),

                    loaded: (data) {
                      return Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            useIntrinsicHeight: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  data.createdAt.toIso8601String(),
                                  style: TextTheme.of(context).bodyLarge,
                                ),

                                PromptCard(
                                  title: 'Daily Prompt',
                                  prompt: data.prompt.text,
                                ),
                                Text(
                                  data.content,
                                  style: TextTheme.of(
                                    context,
                                  ).bodyLarge?.copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          UserPlanTypeWidget(
                            freePlan: CustomContainer(
                              useIntrinsicHeight: true,
                              child: Column(
                                spacing: 20,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/circle_lock.svg',
                                  ),
                                  Text(
                                    'Unlock Full Access',
                                    style: TextTheme.of(context).titleLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Upgrade to Premium to view and edit your journal entries permanently',
                                    textAlign: TextAlign.center,
                                    style: TextTheme.of(context).bodyLarge,
                                  ),
                                  CustomButton(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.5,
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFF7E5F),
                                        Color(0xFFFFB347),
                                      ],
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
                            paidPlan: SizedBox.shrink(),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
