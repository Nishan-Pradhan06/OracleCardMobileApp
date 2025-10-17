import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/users/library/models/guidance_model.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../widgets/guidance_card_widget.dart';

class GuidanceArchiveScreen extends StatelessWidget {
  const GuidanceArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Guidance Archive',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: ListView.builder(
                itemCount: guidanceList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final list = guidanceList[index];

                  return GuidanceCardWidget(
                    title: list.title,
                    description: list.description,
                    dateTime: list.dateTime,
                    isLock: list.isLock,
                    onTap: () {
                      context.pushNamed(
                        AppRoutesName.guidanceArchiveDetailScreenRoute,
                        extra: {
                          'title': list.title,
                          'dateTime': list.dateTime,
                          'description': list.description,
                        },
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
