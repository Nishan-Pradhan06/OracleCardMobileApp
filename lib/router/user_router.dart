import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
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
];
