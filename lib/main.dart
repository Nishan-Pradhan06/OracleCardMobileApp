import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oracle_card_app/core/config/env_config.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/create_daily_guidance/create_daily_guidance_bloc.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/get_daily_guidance/get_daily_guidance_admin_bloc.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/bloc/create_deck/deck_bloc.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/bloc/get_admin_deck/get_admin_deck_bloc.dart';
import 'package:oracle_card_app/features/admin/meditations/bloc/create_meditations/create_meditations_bloc.dart';
import 'package:oracle_card_app/features/admin/meditations/bloc/get_meditations_admin/get_meditations_admin_bloc.dart';
import 'package:oracle_card_app/features/admin/sessions/bloc/bloc/create_sessions_bloc.dart';
import 'package:oracle_card_app/features/admin/user_and_billing/bloc/get_user/get_user_bloc.dart';
import 'package:oracle_card_app/features/admin/user_and_billing/bloc/grant_promo_code/grant_promo_code_bloc.dart';
import 'package:oracle_card_app/features/admin/user_and_billing/bloc/reset_password/reset_password_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/sign_out/sign_out_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_up/user_sign_up_bloc.dart';
import 'package:oracle_card_app/features/device_register_push_notification/bloc/device_register/device_register_bloc.dart';
import 'package:oracle_card_app/features/device_register_push_notification/services/push_notification_services.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/get_payment_history/get_payment_history_bloc.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/redeem_promo_code/redeem_promo_code_bloc.dart';
import 'package:oracle_card_app/features/users/home/bloc/audio_player/audio_player_bloc.dart';
import 'package:oracle_card_app/features/users/home/bloc/get_daily_guidance/get_daily_guidance_bloc.dart';
import 'package:oracle_card_app/features/users/home/bloc/get_oracle_pull_status_bloc/get_oracle_pull_status_bloc.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_journal_entires_list/get_journal_entires_list_bloc.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_today_prompt/get_today_prompt_bloc.dart';
import 'package:oracle_card_app/features/users/journal/bloc/post_journal/post_journal_bloc.dart';
import 'package:oracle_card_app/features/users/library/bloc/get_guidance_archive/get_guidance_archive_bloc.dart';
import 'package:oracle_card_app/features/users/library/bloc/get_meditations/get_meditations_bloc.dart';
import 'package:oracle_card_app/features/users/notifications/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:oracle_card_app/features/users/profile/bloc/user_profile_bloc.dart';
import 'package:oracle_card_app/features/users/sessions/blocs/get_upcomming_session/get_upcomming_session_bloc.dart';
import 'package:oracle_card_app/features/users/sessions/blocs/rsvp_session/rsvp_session_bloc.dart';
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

  //Firebase
  await Firebase.initializeApp();

  await PushNotificationService().init();

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
        BlocProvider(create: (context) => sl<SignOutBloc>()),
        BlocProvider(create: (context) => sl<UserProfileBloc>()),
        BlocProvider(create: (context) => sl<GetJournalEntiresListBloc>()),
        BlocProvider(
          create: (context) =>
              sl<GetNotificationsBloc>()
                ..add(GetNotificationsEvent.getNotificationInbox()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetTodayPromptBloc>()
                ..add(GetTodayPromptEvent.getTodayPrompt()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetDailyGuidanceBloc>()
                ..add(GetDailyGuidanceEvent.getDailyGuidance()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetMeditationsBloc>()
                ..add(GetMeditationsEvent.getMeditations()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetOraclePullStatusBloc>()
                ..add(GetOraclePullStatusEvent.getOracleCardPullStatus()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetUpcommingSessionBloc>()
                ..add(GetUpcommingSessionEvent.getUpCommingSession()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetPaymentHistoryBloc>()
                ..add(GetPaymentHistoryEvent.getPaymentHistory()),
        ),
        BlocProvider(create: (context) => sl<RedeemPromoCodeBloc>()),
        BlocProvider(create: (context) => sl<AudioPlayerBloc>()),
        BlocProvider(create: (context) => sl<PostJournalBloc>()),

        BlocProvider(create: (context) => sl<DeckBloc>()),
        BlocProvider(create: (context) => sl<CreateMeditationsBloc>()),
        BlocProvider(create: (context) => sl<RsvpSessionBloc>()),
        BlocProvider(create: (context) => sl<DeviceRegisterBloc>()),
        BlocProvider(create: (context) => sl<CreateDailyGuidanceBloc>()),
        BlocProvider(create: (context) => sl<GrantPromoCodeBloc>()),
        BlocProvider(create: (context) => sl<ResetPasswordBloc>()),
        BlocProvider(create: (context) => sl<CreateSessionsBloc>()),
        BlocProvider(
          create: (context) =>
              sl<GetMeditationsAdminBloc>()
                ..add(GetMeditationsAdminEvent.getAdminMeditations()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetAdminDeckBloc>()..add(GetAdminDeckEvent.getAdminDeck()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetDailyGuidanceAdminBloc>()
                ..add(GetDailyGuidanceAdminEvent.getDailyGuidanceAdmin()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetGuidanceArchiveBloc>()
                ..add(GetGuidanceArchiveEvent.getGuidanceArchive()),
        ),
        BlocProvider(
          create: (context) => sl<GetUserBloc>()..add(GetUserEvent.getUser()),
        ),
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
