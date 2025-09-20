import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class DeckAndCardScreen extends StatelessWidget {
  const DeckAndCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Deck & Cards'),
      body: CustomBackground(
        child: SingleChildScrollView(
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
                    CustomButton(
                      height: 40,
                      borderRadius: BorderRadius.circular(24),
                      text: 'Create Deck',
                      textColor: Color(0xFF6B48FF),
                      backgroundColor: Color(0xFFFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 5,
                          spreadRadius: 0.2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      fontSize: 14,
                      onPressed: () {},
                      leadingIcon: Icon(Icons.add, color: Color(0xFF6B48FF)),
                    ),
                  ],
                ),

                CustomContainer(
                  useIntrinsicHeight: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Angel Tarot',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            '78 cards for spiritual guidance',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          CustomIconButton(
                            icon: Icons.edit,
                            onTap: () {},
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                          CustomIconButton(
                            icon: Icons.delete,
                            onTap: () {},
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ],
                  ),
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
                    CustomButton(
                      height: 40,
                      borderRadius: BorderRadius.circular(24),
                      text: 'Create Cards',
                      textColor: Color(0xFF6B48FF),
                      backgroundColor: Color(0xFFFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 5,
                          spreadRadius: 0.2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      fontSize: 14,
                      onPressed: () {},
                      leadingIcon: Icon(Icons.add, color: Color(0xFF6B48FF)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
