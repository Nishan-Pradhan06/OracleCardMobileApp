import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/heading_widget.dart';
import '../../home/widgets/notification_widget.dart';
import '../widgets/library_card_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Library',
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(), CustomChip()],

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
                  HeadingWidget(
                    title: "Spiritual Library",
                    subtitle:
                        "Explore meditations and guidance to support your spiritual journey.",
                  ),

                  LibraryCardWidget(
                    svgUrl: 'assets/svg/meditations_icon.svg',
                    title: 'Meditations',
                    description:
                        'Guided meditations to calm your mind and connect with your inner wisdom',
                    onTap: () {
                      context.pushNamed(AppRoutesName.meditationsScreenRoute);
                    },
                  ),
                  LibraryCardWidget(
                    svgUrl: 'assets/svg/guidance.svg',
                    title: 'Guidance Archive',
                    description:
                        'Access past daily guidance messages and angelic wisdom',
                    onTap: () {
                      context.pushNamed(
                        AppRoutesName.guidanceArchiveScreenRoute,
                      );
                      log('this is aa');
                    },
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
