import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/auth/screen/login_screen.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../features/shared/bottom_nav_bar/user_bottom_nav_bar.dart';
import '../features/shared/splash_screen/splash_screen.dart';

List<GoRoute> sharedAppRoutes = [
  GoRoute(
    path: AppRoutesName.splashScreen.path,
    name: AppRoutesName.splashScreen,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: AppRoutesName.loginScreen.path,
    name: AppRoutesName.loginScreen,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: AppRoutesName.bottomNavBar.path,
    name: AppRoutesName.bottomNavBar,
    builder: (context, state) => BottomNavBarScreen(),
  ),
];
