import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../features/shared/splash_screen/splash_screen.dart';

List<GoRoute> sharedAppRoutes = [
  GoRoute(
    path: AppRoutesName.splashScreen.path,
    name: AppRoutesName.splashScreen,
    builder: (context, state) => SplashScreen(),
  ),
];
