import 'dart:math';
import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // Simulated data: 0 = no activity, 1 = low, 2 = medium, 3 = high
  // final Random random = Random();
  // List<List<int>> generateWeeklyData() {
  //   return List.generate(7, (week) {
  //     return List.generate(30, (day) => random.nextInt(4)); // 30 days per week
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // List<List<int>> data = generateWeeklyData();

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: CustomRefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
            },
            child: Column(
              
            )
          ),
        ),
      ),
    );
  }

  // Color getColor(int value) {
  //   switch (value) {
  //     case 0:
  //       return Colors.grey[200]!;
  //     case 1:
  //       return Colors.green[200]!;
  //     case 2:
  //       return Colors.green[400]!;
  //     case 3:
  //       return Colors.green[800]!;
  //     default:
  //       return Colors.grey;
  //   }
  // }
}
// SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: List.generate(data.length, (weekIndex) {
//                 return Column(
//                   children: List.generate(data[weekIndex].length, (dayIndex) {
//                     return Container(
//                       margin: EdgeInsets.all(2),
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: getColor(data[weekIndex][dayIndex]),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     );
//                   }),
//                 );
//               }),
//             ),
//           ),