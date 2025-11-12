import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/screen/admin_daily_guidance_screen.dart';
import 'package:oracle_card_app/features/admin/dashboard/screen/dashboard_screen.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/screen/deck_and_card_screen.dart';
import 'package:oracle_card_app/features/admin/meditations/screen/admin_meditations_screen.dart';
import 'package:oracle_card_app/features/admin/meditations/widgets/create_meditations_dilog.dart';
import '../core/helpers/dialog_page.dart';
import '../features/admin/deck_and_card/widget/create_deck_dilog.dart';
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
  GoRoute(
    path: AppRoutesName.adminDailyGuidanceScreenRoute.path,
    name: AppRoutesName.adminDailyGuidanceScreenRoute,
    builder: (context, state) => AdminDailyGuidanceScreen(),
  ),

  GoRoute(
    path: AppRoutesName.adminCreateDeckDialogRoute.path,
    name: AppRoutesName.adminCreateDeckDialogRoute,
    pageBuilder: (context, state) =>
        DialogPage(builder: (context) => const CreateDeckDialog()),
  ),
  GoRoute(
    path: AppRoutesName.adminCreateMeditationsDialogRoute.path,
    name: AppRoutesName.adminCreateMeditationsDialogRoute,
    pageBuilder: (context, state) =>
        DialogPage(builder: (context) => const CreateMeditationsDialog()),
  ),
];
