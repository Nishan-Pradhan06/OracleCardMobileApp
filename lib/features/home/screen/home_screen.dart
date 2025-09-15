import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_background.dart';
import '../../../core/widgets/custom_chip.dart';
import '../widgets/notification_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Oracle Card App',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Spiritual Library",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Explore meditations and guidance to support your spiritual journey.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),

              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        SvgPicture.asset('assets/svg/meditations_icon.svg'),
                        Text(
                          "Meditations",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Guided meditations to calm your mind and connect with your inner wisdom',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  log('print');
                },
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
