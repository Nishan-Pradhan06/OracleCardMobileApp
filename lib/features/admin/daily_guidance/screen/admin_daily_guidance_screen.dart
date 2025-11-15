import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/utils/date_time_utils.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/get_daily_guidance/get_daily_guidance_admin_bloc.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';

import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../dashboard/widgets/custom_btn_ad.dart';

class AdminDailyGuidanceScreen extends StatelessWidget {
  const AdminDailyGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(
        title: 'Daily Guidance',
        automaticallyImplyLeading: true,
      ),

      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetDailyGuidanceAdminBloc>().add(
              GetDailyGuidanceAdminEvent.getDailyGuidanceAdmin(),
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  CustomBtnAdmin(
                    btnText: 'Create Guidance',
                    onPressed: () {
                      context.pushNamed(
                        AppRoutesName.adminCreateDailyGuidanceDialogRoute,
                      );
                    },
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  BlocBuilder<
                    GetDailyGuidanceAdminBloc,
                    GetDailyGuidanceAdminState
                  >(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(height: 100),
                        loading: () => ShimmerLoaderWidget(
                          isList: true,
                          height: 60,
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
                          final reversedData = data.reversed.toList();
                          return Column(
                            children: List.generate(reversedData.length, (
                              index,
                            ) {
                              final dailyGuidanceL = reversedData[index];
                              final formattedDate =
                                  DateTimeUtils.formatReadableDate(
                                    dailyGuidanceL.createdAt,
                                  );
                              return DailyGuidanceListAdmin(
                                title: dailyGuidanceL.title,
                                dateTime: formattedDate,
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

class DailyGuidanceListAdmin extends StatelessWidget {
  final String title;
  final String dateTime;
  const DailyGuidanceListAdmin({
    super.key,
    required this.title,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.only(bottom: 10),
      useIntrinsicHeight: true,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextTheme.of(context).headlineLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 20,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: Text(
                    'Live',
                    style: TextTheme.of(context).bodySmall?.copyWith(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/schedule.svg'),
                  SizedBox(width: 4),
                  Text(
                    dateTime,
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Color(0xFF6B7280)),
                  ),
                ],
              ),
              InkWell(
                splashColor: Color(0xFF8B5CF6),
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Color(0xFF8B5CF6)),
                  ),
                  child: Center(
                    child: Text(
                      'View Meterics',
                      style: TextTheme.of(context).bodySmall?.copyWith(
                        color: Color(0xFF8B5CF6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
