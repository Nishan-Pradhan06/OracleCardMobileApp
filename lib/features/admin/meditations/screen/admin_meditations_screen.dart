// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';

import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/admin/dashboard/widgets/custom_btn_ad.dart';
import 'package:oracle_card_app/features/admin/meditations/bloc/get_meditations_admin/get_meditations_admin_bloc.dart';

import '../../../../core/utils/date_time_utils.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../router/app_routes_names.dart';
import '../widgets/meditations_list_admin.dart';

class AdminMeditationsScreen extends StatelessWidget {
  const AdminMeditationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(
        title: 'Meditations',
        automaticallyImplyLeading: true,
      ),

      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetMeditationsAdminBloc>().add(
              GetMeditationsAdminEvent.getAdminMeditations(),
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  CustomBtnAdmin(
                    btnText: 'Add Meditation',
                    onPressed: () {
                      context.pushNamed(
                        AppRoutesName.adminCreateMeditationsDialogRoute,
                      );
                    },
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  BlocBuilder<
                    GetMeditationsAdminBloc,
                    GetMeditationsAdminState
                  >(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(height: 100),
                        loading: () => ShimmerLoaderWidget(
                          isList: true,
                          height: 80,
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
                          final reversedData = data.reversed.toList();
                          return Column(
                            children: List.generate(reversedData.length, (
                              index,
                            ) {
                              final meditationsList = reversedData[index];
                              final formattedDate =
                                  DateTimeUtils.formatReadableDate(
                                    meditationsList.media!.createdAt.toString(),
                                  );
                              return AdminMeditationsCard(
                                title: meditationsList.title,
                                visibility: meditationsList.visibility.name
                                    .toUpperCase(),
                                dateTime: formattedDate,
                                durations:
                                    meditationsList.media!.durationSec != null
                                    ? '${meditationsList.media!.durationSec} sec'
                                    : null,
                              );
                            }),
                          );
                        },
                      );
                    },
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
