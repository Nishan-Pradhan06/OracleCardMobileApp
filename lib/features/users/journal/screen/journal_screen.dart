import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';
import '../models/entries_list_model.dart';
import '../widgets/entires_card_widget.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Journal',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: CustomPadding(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Entires',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            // fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '2 entires',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: entries.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return EntriesCardWidget(
                      title: entry.title,
                      dateTime: entry.dateTime,
                      description: entry.description,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF6B48FF), // #6B48FF
              Color(0xFF40C4FF), // #40C4FF
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Action here
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SvgPicture.asset('assets/icons/add.svg'),
        ),
      ),
    );
  }
}
