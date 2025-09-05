import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/common/extension/extension.dart';
import 'app_routes_names.dart';
import 'shared_routes.dart';
import 'user_router.dart';

final appRoute = GoRouter(
  initialLocation: AppRoutesName.splashScreen.path,
  routes: [...sharedAppRoutes, ...userAppRoutes],
);
