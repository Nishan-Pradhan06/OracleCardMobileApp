import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/users/home/screen/daily_guidance_screen.dart';
import 'package:oracle_card_app/features/users/home/screen/oracle_card_grid_screen.dart';
import 'package:oracle_card_app/features/users/home/screen/your_oracle_card.dart';
import 'package:oracle_card_app/features/users/journal/screen/create_joruney_entires_screen.dart';
import 'package:oracle_card_app/features/users/journal/screen/journal_details_screen.dart';
import 'package:oracle_card_app/features/users/library/screen/guidance_archive_screen.dart';
import 'package:oracle_card_app/features/users/library/screen/guidance_details_screen.dart';
import 'package:oracle_card_app/features/users/library/screen/meditations_screen.dart';
import 'package:oracle_card_app/features/users/notifications/screens/notifications_screen.dart';
import 'package:oracle_card_app/features/users/profile/screen/billing_details.dart';
import 'package:oracle_card_app/features/users/profile/screen/buy_premium_screen.dart';
import 'package:oracle_card_app/features/users/sessions/screen/sessions_details_screen.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../features/shared/bottom_nav_bar/user_bottom_nav_bar.dart';
import '../features/users/sessions/screen/join_session_screen.dart';

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
    path: AppRoutesName.dailyGuidanceScreenRoute.path,
    name: AppRoutesName.dailyGuidanceScreenRoute,
    builder: (context, state) => DailyGuidanceScreen(),
  ),
  GoRoute(
    path: AppRoutesName.notificationScreenAppRoute.path,
    name: AppRoutesName.notificationScreenAppRoute,
    builder: (context, state) => NotificationsScreen(),
  ),
  GoRoute(
    path: AppRoutesName.createJourneyEntriesScreen.path,
    name: AppRoutesName.createJourneyEntriesScreen,
    builder: (context, state) => CreateJoruneyEntiresScreen(),
  ),
  GoRoute(
    path: AppRoutesName.yourOracleCardScreenRoute.path,
    name: AppRoutesName.yourOracleCardScreenRoute,
    builder: (context, state) => YourOracleCard(),
  ),
  GoRoute(
    path: AppRoutesName.oracleCardGridScreenRoute.path,
    name: AppRoutesName.oracleCardGridScreenRoute,
    builder: (context, state) => OracleCardGridScreen(),
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
  GoRoute(
    path: AppRoutesName.guidanceArchiveScreenRoute.path,
    name: AppRoutesName.guidanceArchiveScreenRoute,
    builder: (context, state) => GuidanceArchiveScreen(),
  ),
  GoRoute(
    path: AppRoutesName.guidanceArchiveDetailScreenRoute.path,
    name: AppRoutesName.guidanceArchiveDetailScreenRoute,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;

      return GuidanceDetailsScreen(
        title: extra['title'],
        dateTime: extra['dateTime'],
        description: extra['description'],
      );
    },
  ),
  GoRoute(
    path: AppRoutesName.buyPremiumScreenScreenRoute.path,
    name: AppRoutesName.buyPremiumScreenScreenRoute,
    builder: (context, state) => BuyPremiumScreen(),
  ),
  GoRoute(
    path: AppRoutesName.sessionsDetailsScreenScreenRoute.path,
    name: AppRoutesName.sessionsDetailsScreenScreenRoute,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;

      return SessionsDetailsScreen(
        title: extra['title'],
        dateTime: extra['dateTime'],
      );
    },
  ),
  GoRoute(
    path: AppRoutesName.joinSessionScreenAppRoutes.path,
    name: AppRoutesName.joinSessionScreenAppRoutes,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;

      return JoinSessionScreen(title: extra['title']);
    },
  ),

  // GoRoute(
  //   path: AppRoutesName.allOrders.path,
  //   name: AppRoutesName.allOrders,
  //   builder: (context, state) => BlocProvider(
  //     create: (_) =>
  //         AllOrderBloc(repo: sl<OrderRepository>())
  //           ..add(const AllOrderEvent.getAllOrder()),
  //     child: const OrdersScreen(),
  //   ),
  // ),
];
