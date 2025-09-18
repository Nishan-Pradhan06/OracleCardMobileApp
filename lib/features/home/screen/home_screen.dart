import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_chip.dart';
import '../../../core/widgets/custom_padding.dart';
import '../widgets/custom_card_button.dart';
import '../widgets/custom_container.dart';
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
        child: CustomPadding(
          child: Column(
            spacing: 20,
            children: [
              CustomContainer(
                isGradient: true,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Text(
                        'Today\'s Oracle',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Tap to reveal your message',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      CustomCardButton(
                        leading: SvgPicture.asset(
                          'assets/svg/shuffle.svg',
                          height: 15,
                          width: 15,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        action: Text(
                          '0/1',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                        text: "Random Pull",
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CustomContainer(
                height: MediaQuery.sizeOf(context).height / 3.6,
                padding: EdgeInsetsGeometry.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  // bottom: 10,
                ),
                isGradient: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Daily Guidance',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Your angels are watching over you today. Trust your intuition and follow your heart.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        color: Color(0xFF333333).withValues(alpha: 0.7),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Column(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
