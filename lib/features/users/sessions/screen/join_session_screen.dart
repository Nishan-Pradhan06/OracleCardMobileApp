import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';

class JoinSessionScreen extends StatelessWidget {
  const JoinSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Join Session',
        titleAlignment: TitleAlignment.left,
        actions: [CustomChip(label: 'Premium', type: ChipType.premium)],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: Center(child: CustomContainer(child: Column(


              ))),
              
            ),
          ),
        ),
      ),
    );
  }
}
