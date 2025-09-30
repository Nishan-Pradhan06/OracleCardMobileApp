import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oracle_card_app/core/config/env_config.dart';
import 'package:oracle_card_app/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  EnvConfig.initialize(Environment.development);

  runApp(const OracelCard());
}

class OracelCard extends StatelessWidget {
  const OracelCard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Oracle Card',
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
      theme: ThemeData(fontFamily: 'Inter'),
      // theme: AppTheme.light(),
      // darkTheme: AppTheme.dark(),
      // themeMode: ThemeMode.system,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
