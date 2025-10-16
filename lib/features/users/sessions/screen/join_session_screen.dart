import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_chip.dart';

class JoinSessionScreen extends StatelessWidget {
  final String title;
  const JoinSessionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Join Session',
        titleAlignment: TitleAlignment.left,
        actions: [CustomChip()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: CustomPadding(
              child: CustomContainer(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                      ),
                    ),

                    Text(
                      'Session start in',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        // fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
