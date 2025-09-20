import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/features/auth/screen/login_screen.dart';
import 'package:oracle_card_app/features/auth/screen/signup_screen.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../features/shared/bottom_nav_bar/user_bottom_nav_bar.dart';
import '../features/shared/splash_screen/splash_screen.dart';

List<GoRoute> sharedAppRoutes = [
  GoRoute(
    path: AppRoutesName.splashScreenRoute.path,
    name: AppRoutesName.splashScreenRoute,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: AppRoutesName.loginScreenRoute.path,
    name: AppRoutesName.loginScreenRoute,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: AppRoutesName.signUpScreenRoute.path,
    name: AppRoutesName.signUpScreenRoute,
    builder: (context, state) => SignUpScreen(),
  ),
  GoRoute(
    path: AppRoutesName.userBottomNavBarRoute.path,
    name: AppRoutesName.userBottomNavBarRoute,
    builder: (context, state) => UserBottomNavBarScreen(),
  ),
];
