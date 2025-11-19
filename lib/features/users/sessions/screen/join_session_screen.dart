import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';

class JoinSessionScreen extends StatelessWidget {
  const JoinSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Join Session',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: CustomPadding(
            child: Center(
              child: CustomContainer(
                useIntrinsicHeight: true,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Angel Connection Circle',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      'Session start in',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        // fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '05:42',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Color(0xFF6b48ff),
                      ),
                    ),
                    Text(
                      'Minutes',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      height: 60,
                      leadingIcon: Icon(
                        Icons.video_call,
                        color: Colors.white,
                        size: 15,
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      text: 'Join Session',
                      onPressed: () {},
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
