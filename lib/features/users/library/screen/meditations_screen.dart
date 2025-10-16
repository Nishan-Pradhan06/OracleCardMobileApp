import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../widgets/meditation_card.dart';

class MeditationsScreen extends StatelessWidget {
  const MeditationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Meditations',
        titleAlignment: TitleAlignment.left,
        actions: [CustomChip()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MeditatoinsCardWidget(
                    title: 'Morning Centering',
                    timer: '10 min',
                    svgUrl: 'assets/icons/meditation_icon_1.svg',
                    isLock: false,
                    onTap: () {
                      log('unlock');
                    },
                  ),
                  MeditatoinsCardWidget(
                    title: 'Morning Centering',
                    timer: '10 min',
                    svgUrl: 'assets/icons/meditation_icon_2.svg',
                    isLock: true,
                    onTap: () {
                      log('lock');
                    },
                  ),
                  MeditatoinsCardWidget(
                    title: 'Morning Centering',
                    timer: '10 min',
                    svgUrl: 'assets/icons/meditation_icon_3.svg',
                    isLock: true,
                  ),
                  MeditatoinsCardWidget(
                    title: 'Morning Centering',
                    timer: '10 min',
                    svgUrl: 'assets/icons/meditation_icon_4.svg',
                    isLock: true,
                  ),

                  UpgradePremiumButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
