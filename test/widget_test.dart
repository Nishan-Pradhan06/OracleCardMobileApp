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


// import 'package:flutter/material.dart';
// import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/models/payment_plan_model.dart';

// class PricingPlansScreen extends StatefulWidget {
//   const PricingPlansScreen({Key? key}) : super(key: key);

//   @override
//   State<PricingPlansScreen> createState() => _PricingPlansScreenState();
// }

// class _PricingPlansScreenState extends State<PricingPlansScreen> {
//   bool isYearly = false;

//   final List<PaymentPlanModel> plans = [
//     PaymentPlanModel(
//       id: 4,
//       name: "Monthly",
//       interval: "MONTH",
//       priceCents: 999,
//       currency: "USD",
//       freeTrialDays: 7,
//       isActive: true,
//     ),
//     PaymentPlanModel(
//       id: 5,
//       name: "Yearly",
//       interval: "YEAR",
//       priceCents: 7999,
//       currency: "USD",
//       freeTrialDays: 14,
//       isActive: true,
//     ),
//   ];

//   final List<String> features = [
//     "Unlimited access to all features",
//     "Priority customer support",
//     "Advanced analytics dashboard",
//     "Team collaboration tools",
//     "API access included",
//     "Regular feature updates",
//   ];

//   int getSavingsPercent() {
//     final monthly = plans.firstWhere((p) => p.interval == 'MONTH');
//     final yearly = plans.firstWhere((p) => p.interval == 'YEAR');
//     final savings =
//         ((monthly.priceCents - (yearly.priceCents / 12)) /
//         monthly.priceCents *
//         100);
//     return savings.round();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),

//               // Header
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.indigo[50],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.auto_awesome, size: 16, color: Colors.indigo),
//                     SizedBox(width: 6),
//                     Text(
//                       'Simple, transparent pricing',
//                       style: TextStyle(
//                         color: Colors.indigo,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Text(
//                 'Choose Your Plan',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),

//               const SizedBox(height: 12),

//               Text(
//                 'Start with a free trial, then pick the\nplan that works best for you',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[600],
//                   height: 1.5,
//                 ),
//               ),

//               const SizedBox(height: 32),

//               // Billing Toggle
//               Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     _buildToggleButton('Monthly', !isYearly),
//                     _buildToggleButton('Yearly', isYearly),
//                   ],
//                 ),
//               ),

//               if (isYearly) ...[
//                 const SizedBox(height: 8),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.green[50],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     'Save ${getSavingsPercent()}%',
//                     style: const TextStyle(
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ),
//               ],

//               const SizedBox(height: 32),

//               // Plan Cards
//               ...plans.map((plan) {
//                 final isSelected =
//                     (isYearly && plan.interval == 'YEAR') ||
//                     (!isYearly && plan.interval == 'MONTH');
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 16),
//                   child: _buildPlanCard(plan, isSelected),
//                 );
//               }).toList(),

//               const SizedBox(height: 20),

//               Text(
//                 'All plans include a free trial. No credit card required.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildToggleButton(String text, bool isSelected) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isYearly = text == 'Yearly';
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.white : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: isSelected
//               ? [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ]
//               : [],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
//             color: isSelected ? Colors.black87 : Colors.grey[600],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPlanCard(PaymentPlanModel plan, bool isSelected) {
//     final isYearlyPlan = plan.interval == 'YEAR';

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: isSelected ? Colors.indigo : Colors.grey[200]!,
//           width: isSelected ? 2 : 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           if (isYearlyPlan)
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Colors.indigo, Colors.purple],
//                 ),
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: const Text(
//                 'Best Value',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 13,
//                 ),
//               ),
//             ),

//           Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   plan.name,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       '\$',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     Text(
//                       plan.monthlyPrice.toStringAsFixed(2),
//                       style: const TextStyle(
//                         fontSize: 48,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                         height: 1,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         '/month',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                       ),
//                     ),
//                   ],
//                 ),

//                 if (isYearlyPlan) ...[
//                   const SizedBox(height: 8),
//                   Text(
//                     '\$${plan.price.toStringAsFixed(2)} billed annually',
//                     style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                   ),
//                 ],

//                 const SizedBox(height: 16),

//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.indigo[50],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     '🎉 ${plan.freeTrialDays}-day free trial included',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: Colors.indigo,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: isSelected
//                           ? Colors.indigo
//                           : Colors.grey[300],
//                       foregroundColor: isSelected
//                           ? Colors.white
//                           : Colors.grey[700],
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: isSelected ? 2 : 0,
//                     ),
//                     child: const Text(
//                       'Start Free Trial',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 24),

//                 Text(
//                   'WHAT\'S INCLUDED:',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[700],
//                     letterSpacing: 0.5,
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 ...features
//                     .map(
//                       (feature) => Padding(
//                         padding: const EdgeInsets.only(bottom: 12),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 20,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 color: Colors.indigo[50],
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.check,
//                                 size: 14,
//                                 color: Colors.indigo,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 feature,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.grey[700],
//                                   height: 1.4,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }