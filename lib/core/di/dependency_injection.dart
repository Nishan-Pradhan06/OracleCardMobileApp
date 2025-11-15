import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/create_daily_guidance/create_daily_guidance_bloc.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/get_daily_guidance/get_daily_guidance_admin_bloc.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/bloc/create_deck/deck_bloc.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/bloc/get_admin_deck/get_admin_deck_bloc.dart';
import 'package:oracle_card_app/features/admin/meditations/bloc/create_meditations/create_meditations_bloc.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';
import 'package:oracle_card_app/features/auth/blocs/sign_out/sign_out_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_up/user_sign_up_bloc.dart';
import 'package:oracle_card_app/features/auth/repository/auth_repository.dart';
import 'package:oracle_card_app/features/device_register_push_notification/bloc/device_register/device_register_bloc.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/get_payment_history/get_payment_history_bloc.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/redeem_promo_code/redeem_promo_code_bloc.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/repository/payment_repository.dart';
import 'package:oracle_card_app/features/users/home/bloc/audio_player/audio_player_bloc.dart';
import 'package:oracle_card_app/features/users/home/bloc/get_daily_guidance/get_daily_guidance_bloc.dart';
import 'package:oracle_card_app/features/users/home/bloc/get_oracle_pull_status_bloc/get_oracle_pull_status_bloc.dart';
import 'package:oracle_card_app/features/users/home/repository/guidance_repository.dart';
import 'package:oracle_card_app/features/users/home/repository/oracle_card_repository.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_journal_by_id/get_journal_by_id_bloc.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_journal_entires_list/get_journal_entires_list_bloc.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_today_prompt/get_today_prompt_bloc.dart';
import 'package:oracle_card_app/features/users/journal/bloc/post_journal/post_journal_bloc.dart';
import 'package:oracle_card_app/features/users/journal/repository/journal_repository.dart';
import 'package:oracle_card_app/features/users/library/bloc/get_guidance_archive/get_guidance_archive_bloc.dart';
import 'package:oracle_card_app/features/users/library/bloc/get_meditations/get_meditations_bloc.dart';
import 'package:oracle_card_app/features/users/library/repository/meditations_repository.dart';
import 'package:oracle_card_app/features/users/notifications/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:oracle_card_app/features/users/notifications/repository/notification_repository.dart';
import 'package:oracle_card_app/features/users/profile/bloc/user_profile_bloc.dart';
import 'package:oracle_card_app/features/users/profile/repository/user_profile_repository.dart';
import 'package:oracle_card_app/features/users/sessions/blocs/get_upcomming_session/get_upcomming_session_bloc.dart';
import 'package:oracle_card_app/features/users/sessions/blocs/rsvp_session/rsvp_session_bloc.dart';
import 'package:oracle_card_app/features/users/sessions/repository/session_repository.dart';
import 'package:retry/retry.dart';

import '../../features/admin/meditations/bloc/get_meditations_admin/get_meditations_admin_bloc.dart';
import '../../features/device_register_push_notification/repository/device_register_repository.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  //###---------------GLOBAL BLOC--------------###

  //###---------------BLOC---------------------###
  sl.registerLazySingleton(() => UserSignInBloc(repo: sl()));
  sl.registerLazySingleton(() => UserSignUpBloc(repo: sl()));
  sl.registerLazySingleton(() => SignOutBloc(repo: sl()));
  sl.registerLazySingleton(() => UserProfileBloc(repo: sl()));
  sl.registerLazySingleton(() => GetNotificationsBloc(repo: sl()));
  sl.registerLazySingleton(() => GetTodayPromptBloc(repo: sl()));
  sl.registerLazySingleton(() => GetDailyGuidanceBloc(repo: sl()));
  sl.registerLazySingleton(() => GetOraclePullStatusBloc(repo: sl()));
  sl.registerLazySingleton(() => GetJournalEntiresListBloc(repo: sl()));
  sl.registerLazySingleton(() => GetMeditationsBloc(repo: sl()));
  sl.registerLazySingleton(() => GetUpcommingSessionBloc(repo: sl()));
  sl.registerLazySingleton(() => GetPaymentHistoryBloc(repo: sl()));
  sl.registerLazySingleton(() => RedeemPromoCodeBloc(repo: sl()));
  sl.registerLazySingleton(() => GetJournalByIdBloc(repo: sl()));
  sl.registerLazySingleton(() => PostJournalBloc(repo: sl()));
  sl.registerLazySingleton(() => GetGuidanceArchiveBloc(repo: sl()));
  sl.registerLazySingleton(() => RsvpSessionBloc(repo: sl()));
  sl.registerLazySingleton(() => CreateMeditationsBloc(repo: sl()));
  sl.registerLazySingleton(() => DeviceRegisterBloc(repo: sl()));
  sl.registerFactory(() => AudioPlayerBloc());

  //###---------------ADMIN BLOC---------------------###
  sl.registerLazySingleton(() => DeckBloc(repo: sl()));
  sl.registerLazySingleton(() => GetAdminDeckBloc(repo: sl()));
  sl.registerLazySingleton(() => CreateDailyGuidanceBloc(repo: sl()));
  sl.registerLazySingleton(() => GetMeditationsAdminBloc(repo: sl()));
  sl.registerLazySingleton(() => GetDailyGuidanceAdminBloc(repo: sl()));

  //###---------------CUBIT--------------------###

  //###---------------REPOSITORY---------------###
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<JournalRepository>(
    () => JournalRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<GuidanceRepository>(
    () => GuidanceRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<OracleCardRepository>(
    () => OracleCardRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<MeditationsRepository>(
    () => MeditationsRepositoryImp(apiService: sl()),
  );
  sl.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(apiService: sl()),
  );
  sl.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImp(apiService: sl()),
  );
  sl.registerLazySingleton<DeviceRegisterForPushNotificationRepository>(
    () => DeviceRegisterForPushNotificationRepositoryImpl(apiService: sl()),
  );

  //###---------------EXTERNAL REPOSITORY SERVICES---------------###

  sl.registerLazySingleton<ApiService>(
    () => ApiService(sl<Dio>(), sl<RetryOptions>()),
  );
  sl.registerLazySingleton<RetryOptions>(
    () => const RetryOptions(maxAttempts: 3),
  );
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
}
