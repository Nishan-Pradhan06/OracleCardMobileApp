import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../models/oracle_card_list_model.dart';
import '../widgets/home_container.dart';

class OracleCardGridScreen extends StatelessWidget {
  const OracleCardGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Oracle Cards',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),

      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: CustomPadding(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: oracleCardList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = oracleCardList[index];
                return GridContainer(
                  svgUrl: item.svgUrl,
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
