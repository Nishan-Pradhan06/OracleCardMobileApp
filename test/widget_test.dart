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