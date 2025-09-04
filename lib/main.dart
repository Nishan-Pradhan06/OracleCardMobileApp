import 'package:flutter/material.dart';
import 'package:oracle_card_app/router/app_router.dart';

void main() {
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
    );
  }
}
