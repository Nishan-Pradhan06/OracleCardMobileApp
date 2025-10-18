import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';
import 'package:oracle_card_app/features/users/library/bloc/get_meditations/get_meditations_bloc.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../widgets/meditation_card.dart';

class MeditationsScreen extends StatelessWidget {
  const MeditationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Meditations',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: BlocBuilder<GetMeditationsBloc, GetMeditationsState>(
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
                    loaded: (meditationsData) {
                      return Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            itemCount: meditationsData.items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final entry = meditationsData.items[index];
                              // String day = getDayFromDateTime(
                              //   entry.createdAt.toString(),
                              // );

                              return MeditatoinsCardWidget(
                                title: entry.title,
                                timer: entry.durationSec.toString(),
                                svgUrl: 'assets/icons/meditation_icon_1.svg',
                                isLock: entry.visibility == 'PREMIUM'
                                    ? true
                                    : false,
                                onTap: () {
                                  log('unlock');
                                },
                              );
                            },
                          ),

                          UserPlanTypeWidget(
                            freePlan: UpgradePremiumButtonWidget(),
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
