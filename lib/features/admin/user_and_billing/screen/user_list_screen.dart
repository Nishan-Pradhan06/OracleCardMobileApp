import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/admin/user_and_billing/bloc/get_user/get_user_bloc.dart';

import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../widget/user_list_widget_container.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(
        title: 'User & Billing',
        automaticallyImplyLeading: true,
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: BlocBuilder<GetUserBloc, GetUserState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(height: 100),
                    loading: () => ShimmerLoaderWidget(
                      isList: false,
                      height: 100,
                      count: 4,
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
                        children: List.generate(data.items.length, (index) {
                          final userList = data.items[index];

                          return UserListWidgetContainer(
                            userName: userList.name ?? '',
                            email: userList.email,
                            plan: userList.plan,
                            subStatus: userList.subscription.status,
                            nextBilling: userList.subscription.nextBillingDate
                                .toString(),
                            pullCount: userList.activity.pulls.toString(),
                            journalCount: userList.activity.journals.toString(),
                          );
                        }),
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
