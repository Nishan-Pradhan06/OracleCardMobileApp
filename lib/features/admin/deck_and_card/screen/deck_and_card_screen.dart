import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../dashboard/widgets/card_widget.dart';
import '../../dashboard/widgets/custom_btn_ad.dart';

class DeckAndCardScreen extends StatelessWidget {
  const DeckAndCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Deck & Cards'),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Decks',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Color(0xFF6B48FF),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomBtnAdmin(btnText: 'Create Deck', onPressed: () {}),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (index) {
                      return AdminCardWidget(
                        cardTitle: 'Angel Tarot',
                        cardSubtitle: '78 cards for spiritual guidance',
                      );
                    }),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Cards',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Color(0xFF6B48FF),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomBtnAdmin(btnText: 'Create Cards', onPressed: () {}),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (index) {
                      return AdminCardWidget(
                        cardTitle: 'Angel Tarot',
                        cardSubtitle: '78 cards for spiritual guidance',
                      );
                    }),
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
