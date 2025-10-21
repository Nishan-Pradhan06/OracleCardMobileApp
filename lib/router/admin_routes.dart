import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/admin/dashboard/screen/dashboard_screen.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/screen/deck_and_card_screen.dart';
import 'package:oracle_card_app/features/admin/meditations/screen/admin_meditations_screen.dart';
import 'app_routes_names.dart';

List<GoRoute> adminAppRoutes = [
  GoRoute(
    path: AppRoutesName.adminDashboardRoute.path,
    name: AppRoutesName.adminDashboardRoute,
    builder: (context, state) => AdminDasboardScreen(),
  ),
  GoRoute(
    path: AppRoutesName.adminDeckAndCardsRoute.path,
    name: AppRoutesName.adminDeckAndCardsRoute,
    builder: (context, state) => DeckAndCardScreen(),
  ),
  GoRoute(
    path: AppRoutesName.adminMeditationsScreenRoute.path,
    name: AppRoutesName.adminMeditationsScreenRoute,
    builder: (context, state) => AdminMeditationsScreen(),
  ),
];
