import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../core/animations/loading_animation.dart';
import '../../../core/services/cache_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await CacheServices.instance.getAuthToken();
    final role = await CacheServices.instance.getUserRole();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      // User is already logged in → go to respective bottom bar
      if (role == 'ADMIN') {
        context.goNamed(AppRoutesName.adminDashboardRoute);
      } else {
        context.goNamed(AppRoutesName.userBottomNavBarRoute);
      }
    } else {
      // No token → show login screen
      context.goNamed(AppRoutesName.loginScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Color(0xffE6E1FF), Color(0xffFFFFFF)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/svg/splash_logo.svg', height: 200),
              LoadingText(),
            ],
          ),
        ),
      ),
    );
  }
}
