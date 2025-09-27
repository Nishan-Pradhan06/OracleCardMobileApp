import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/users/journal/screen/create_joruney_entires_screen.dart';
import 'package:oracle_card_app/features/users/journal/screen/journal_details_screen.dart';
import 'package:oracle_card_app/features/users/library/screen/meditations_screen.dart';
import 'package:oracle_card_app/features/users/profile/screen/billing_details.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../features/shared/bottom_nav_bar/user_bottom_nav_bar.dart';

List<GoRoute> userAppRoutes = [
  GoRoute(
    path: AppRoutesName.userBottomNavBarRoute.path,
    name: AppRoutesName.userBottomNavBarRoute,
    builder: (context, state) => UserBottomNavBarScreen(),
  ),
  GoRoute(
    path: AppRoutesName.billingDetailsScreen.path,
    name: AppRoutesName.billingDetailsScreen,
    builder: (context, state) => BillingDetailsScreen(),
  ),
  GoRoute(
    path: AppRoutesName.createJourneyEntriesScreen.path,
    name: AppRoutesName.createJourneyEntriesScreen,
    builder: (context, state) => CreateJoruneyEntiresScreen(),
  ),
  GoRoute(
    path: AppRoutesName.journeyEntriesDetailsScreen.path,
    name: AppRoutesName.journeyEntriesDetailsScreen,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return JournalDetailsScreen(
        title: extra['title'],
        date: extra['dateTime'],
        prompt: extra['prompt'],
        description: extra['description'],
        day: extra['day'],
      );
    },
  ),
  GoRoute(
    path: AppRoutesName.meditationsScreenRoute.path,
    name: AppRoutesName.meditationsScreenRoute,
    builder: (context, state) => MeditationsScreen(),
  ),
];
