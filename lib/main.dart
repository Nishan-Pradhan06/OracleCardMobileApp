import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oracle_card_app/core/config/env_config.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_up/user_sign_up_bloc.dart';
import 'package:oracle_card_app/features/users/profile/bloc/user_profile_bloc.dart';
import 'package:oracle_card_app/router/app_router.dart';

import 'core/di/dependency_injection.dart';
import 'core/services/cache_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  EnvConfig.initialize(Environment.production);

  log(EnvConfig.instance.apiBaseUrl);

  //dependency Injection service locator
  await setupServiceLocator();

  //Global SharedPreferences
  await CacheServices.instance.init();

  runApp(const OracelCard());
}

class OracelCard extends StatelessWidget {
  const OracelCard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserSignInBloc>()),
        BlocProvider(create: (context) => sl<UserSignUpBloc>()),
        BlocProvider(create: (context) => sl<UserProfileBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Oracle Card',
        debugShowCheckedModeBanner: false,
        routerConfig: appRoute,
        theme: ThemeData(fontFamily: 'Inter'),
        // theme: AppTheme.light(),
        // darkTheme: AppTheme.dark(),
        // themeMode: ThemeMode.system,
        // scrollBehavior: const MaterialScrollBehavior().copyWith(
        //   physics: const BouncingScrollPhysics(
        //     parent: AlwaysScrollableScrollPhysics(),
        //   ),
        // ),
      ),
    );
  }
}
