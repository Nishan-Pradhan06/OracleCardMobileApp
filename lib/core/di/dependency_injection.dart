import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/auth/blocs/sign_out/sign_out_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_up/user_sign_up_bloc.dart';
import 'package:oracle_card_app/features/auth/repository/auth_repository.dart';
import 'package:oracle_card_app/features/users/journal/bloc/get_today_prompt/get_today_prompt_bloc.dart';
import 'package:oracle_card_app/features/users/journal/repository/journal_repository.dart';
import 'package:oracle_card_app/features/users/notifications/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:oracle_card_app/features/users/notifications/repository/notification_repository.dart';
import 'package:oracle_card_app/features/users/profile/bloc/user_profile_bloc.dart';
import 'package:oracle_card_app/features/users/profile/repository/user_profile_repository.dart';
import 'package:retry/retry.dart';

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
