import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_today_prompt/get_today_prompt_bloc.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
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
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetTodayPromptBloc>().add(GetTodayPromptEvent.getTodayPrompt());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  BlocBuilder<GetTodayPromptBloc, GetTodayPromptState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(height: 100),
                        loading: () => const SizedBox(
                          height: 100,
                          child: ShimmerLoaderWidget(),
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
                        loaded: (getTodayPromptData) {
                          return PromptCard(
                            title: 'Today\'s Prompt',
                            prompt: getTodayPromptData.prompt.text,
                          );
                        },
                      );
                    },
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
                        child: UserPlanTypeWidget(
                          freePlan: CustomButton(
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
                          paidPlan: CustomButton(
                            leadingIcon: SvgPicture.asset(
                              'assets/icons/save.svg',
                            ),
                            textColor: Colors.white,
                            text: 'Save',
                            fontSize: 22,

                            onPressed: () {},
                          ),
                        ),
                      ),
                      Expanded(
                        child: UserPlanTypeWidget(
                          freePlan: CustomButton(
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
                          paidPlan: CustomButton(
                            fontSize: 22,
                            backgroundColor: Color(0xFFF0F0F0),
                            leadingIcon: SvgPicture.asset(
                              'assets/icons/delete.svg',
                            ),
                            text: 'Delete',
                            textColor: Color(0xFFff7e5f),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  UserPlanTypeWidget(
                    freePlan: Text(
                      'Free plan: notes auto-delete after 24h',
                      style: TextTheme.of(
                        context,
                      ).bodyLarge?.copyWith(color: Colors.grey),
                    ),
                    paidPlan: SizedBox.shrink(),
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
