import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/admin/dashboard/screen/dashboard_screen.dart';
import 'app_routes_names.dart';

List<GoRoute> adminAppRoutes = [
  GoRoute(
    path: AppRoutesName.adminDashboardRoute.path,
    name: AppRoutesName.adminDashboardRoute,
    builder: (context, state) => AdminDasboardScreen(),
  ),
];
