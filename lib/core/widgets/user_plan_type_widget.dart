import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/widgets/custom_chip.dart';

import '../../features/users/profile/bloc/user_profile_bloc.dart';

class UserPlanTypeWidget extends StatelessWidget {
  final Widget? freePlan;
  final Widget? paidPlan;
  const UserPlanTypeWidget({super.key, this.freePlan, this.paidPlan});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            if (data.user.plan == 'PREMIUM') {
              return paidPlan ?? CustomChip(planType: ChipType.premium);
            } else {
              return freePlan ?? CustomChip(planType: ChipType.free);
            }
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
