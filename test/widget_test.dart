// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:oracle_card_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const OracelCard());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


  // Simulated data: 0 = no activity, 1 = low, 2 = medium, 3 = high
  // final Random random = Random();
  // List<List<int>> generateWeeklyData() {
  //   return List.generate(7, (week) {
  //     return List.generate(30, (day) => random.nextInt(4)); // 30 days per week
  //   });
  // }
    // List<List<int>> data = generateWeeklyData();


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
// }
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

// import 'package:flutter/material.dart';
// import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
// import 'package:oracle_card_app/core/widgets/custom_background.dart';
// import 'package:oracle_card_app/core/widgets/custom_padding.dart';
// import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
// import 'package:oracle_card_app/core/widgets/heading_widget.dart';
// import 'package:oracle_card_app/core/widgets/upgrade_premium_button_widget.dart';

// import '../../../../core/widgets/custom_chip.dart';
// import '../../home/widgets/notification_widget.dart';
// import '../widgets/session_card_widget.dart';

// class SessionScreen extends StatelessWidget {
//   const SessionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Sessions',
//         titleAlignment: TitleAlignment.left,
//         actions: [
//           NotificationIcon(hasNotification: true),
//  UserPlanTypeWidget()//         ],
//       ),
//       body: CustomBackground(
//         child: CustomRefreshIndicator(
//           onRefresh: () async {},
//           child: SingleChildScrollView(
//             physics: AlwaysScrollableScrollPhysics(),
//             child: CustomPadding(
//               child: Column(
//                 spacing: 10,
//                 children: [
//                   HeadingWidget(
//                     title: 'Group Sessions',
//                     subtitle:
//                         'Join live guided sessions with our spiritual community.',
//                   ),

//                   SessionsCardWidget(
//                     dateText: 'Jun 15, 6:00 PM',
//                     title: 'Angel Connection Circle',
//                     description:
//                         'Connect with your angels and receive messages in this guided group meditation session.',
//                     isButtonEnabled: true,
//                     onPressed: () {},
//                   ),
//                   SessionsCardWidget(
//                     dateText: 'Jun 18, 7:30 PM',
//                     title: 'Tarot Insights Workshop',
//                     description:
//                         'Learn to interpret tarot cards and gain deeper insights into your life path.',
//                     isButtonEnabled: false,
//                     onPressed: () {},
//                   ),
//                   SessionsCardWidget(
//                     dateText: 'Jun 22, 9:00 PM',
//                     title: 'Full Moon Meditation',
//                     description:
//                         'Harness the energy of the full moon for manifestation and release.',
//                     isButtonEnabled: false,
//                     onPressed: () {},
//                   ),
//                   UpgradePremiumButtonWidget(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
