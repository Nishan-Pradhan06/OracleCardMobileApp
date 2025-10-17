import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';

class YourOracleCard extends StatelessWidget {
  const YourOracleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Oracle Card',
        titleAlignment: TitleAlignment.left,
        actions: [UserPlanTypeWidget()],
      ),

      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 20,
                children: [
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(
                          height: 350,
                          child: Image.asset(
                            'assets/images/backgrounf.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'The Star',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'This is a time of hope and renewal.Trust that the universe is guiding youtoward your highest good. Yourdreams are within reach, and newopportunities are on the horizon. Havefaith in yourself and your journey.',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontSize: 18,
                                color: Color(0xFF333333).withValues(alpha: 0.7),
                              ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomButton(
                          backgroundColor: Color(0xFFF0F0F0),
                          textColor: Colors.black,
                          leadingIcon: SvgPicture.asset(
                            'assets/icons/book.svg',
                          ),
                          text: 'Reflect',
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          textColor: Colors.black,
                          backgroundColor: Color(0xFFF0F0F0),
                          leadingIcon: SvgPicture.asset(
                            'assets/icons/share.svg',
                          ),
                          text: 'Reflect',
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          leadingIcon: SvgPicture.asset('assets/icons/fav.svg'),
                          text: 'Favorite',
                          onPressed: () {},
                        ),
                      ),
                    ],
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
