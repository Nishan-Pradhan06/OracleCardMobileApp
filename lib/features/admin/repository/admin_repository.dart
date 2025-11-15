import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/model/admin_daily_guidance_model.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/model/get_daily_guidance_admin_model.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/create_card_model.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/deck_model.dart';
import 'package:oracle_card_app/features/admin/meditations/model/get_admin_meditations_model.dart';
import 'package:oracle_card_app/features/admin/sessions/models/create_sessions_model.dart';

import '../daily_guidance/model/guidance_metrics_model.dart';
import '../meditations/model/create_meditations_model.dart';
import '../user_and_billing/model/get_user_model.dart';

abstract interface class AdminRepository {
  //##-----------------HOME-----SCREEN-------------------##

  //##-------------------CREATE DECK-------------------------##
  FutureEither<String> createDeck({required DeckCardModel deckCardModel});
  //##-------------------CREATE Card-------------------------##
  FutureEither<String> createCard({required CreateCardModel createCardM});
  //##-------------------GET DECK-------------------------##
  FutureEither<List<AdminDeckModel>> getAdminDeck();

  //##-----------------MEDITATIONS-----SCREEN-------------------##

  //##-------------------CREATE MEDITATIONS-------------------------##
  FutureEither<String> createMeditations({
    required CreateMeditationsModel createMeditations,
  });
  //##-------------------GET MEDITATIONS-------------------------##
  FutureEither<List<GetAdminMeditationModel>> getMeditations();

  //######################--DAILY GUIDANCE--###########################
  //##-------------------CREATE DAILY GUIDANCE-------------------------##
  FutureEither<String> createDailyGuidance({
    required AdminDailyGuidanceModel adminDailyGuidance,
  });
  //##-------------------GET DAILY GUIDANCE-------------------------##
  FutureEither<List<GetDailyGuidanceAdminModel>> getDailyGuidance();
  //##-------------------GET DAILY GUIDANCE METRICS-------------------------##
  FutureEither<GuidanceMetrics> getDailyGuidanceMetrics({
    required String dailyGuidanceId,
  });

  //##-------------------CREATE SESSIONS-------------------------##
  FutureEither<String> createSessions({
    required CreateSessionModel createSessionM,
  });
  //##-------------------GET USERS-------------------------##
  FutureEither<List<DataListModel>> getUsers();
  //##-------------------GRANT PROMO-------------------------##
  FutureEither<String> grantPromoCode({
    required String promoCode,
    required String userId,
  });
}

class AdminRepositoryImp implements AdminRepository {
  final ApiService _apiService;

  AdminRepositoryImp({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------CREATE DECK-------------------------##

  @override
  FutureEither<String> createDeck({
    required DeckCardModel deckCardModel,
  }) async {
    final response = await _apiService.post<Map>(
      'admin/decks',
      data: {...deckCardModel.toMap()},
    );

    return response.fold((failure) => Left(failure), (data) {
      return Right("Deck Create Successful !!!");
    });
  }

  //##-------------------GET DECK-------------------------##
  @override
  FutureEither<List<AdminDeckModel>> getAdminDeck() async {
    final respone = await _apiService.get('admin/decks');

    return respone.fold((failure) => Left(failure), (data) {
      final deckList = data['data'] as List<dynamic>;
      final decks = deckList
          .map((deck) => AdminDeckModel.fromMap(deck as Map<String, dynamic>))
          .toList();
      return Right(decks);
    });
  }

  //##-------------------CREATE MEDITATIONS-------------------------##
  @override
  FutureEither<String> createMeditations({
    required CreateMeditationsModel createMeditations,
  }) async {
    FormData formData = FormData.fromMap({
      ...createMeditations.toMap(),
      'audio': await MultipartFile.fromFile(
        createMeditations.audioFile.path,
        filename: createMeditations.audioFile.path.split('/').last,
      ),
    });

    final response = await _apiService.post<Map>(
      'admin/meditations',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    return response.fold(
      (failure) => Left(failure),
      (data) => const Right("Meditation Created Successfully!"),
    );
  }

  //##-------------------CREATE DAILY GUIDANCE-------------------------##
  @override
  FutureEither<String> createDailyGuidance({
    required AdminDailyGuidanceModel adminDailyGuidance,
  }) async {
    FormData formData = FormData.fromMap({
      ...adminDailyGuidance.toMap(),
      'audio': await MultipartFile.fromFile(
        adminDailyGuidance.audioUrl.path,
        filename: adminDailyGuidance.audioUrl.path.split('/').last,
      ),
    });

    final response = await _apiService.post<Map>(
      'admin/guidance',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    return response.fold(
      (failure) => Left(failure),
      (data) => const Right("Daily Guidance Created Successfully!"),
    );
  }

  //##-------------------CREATE SESSIONS-------------------------##

  @override
  FutureEither<String> createSessions({
    required CreateSessionModel createSessionM,
  }) async {
    final response = await _apiService.post<Map>(
      'admin/sessions',
      data: {...createSessionM.toMap()},
    );

    return response.fold((failure) => Left(failure), (data) {
      return Right("Sessions Create Successful !!!");
    });
  }

  @override
  FutureEither<List<DataListModel>> getUsers() async {
    final response = await _apiService.get('admin/users');

    return response.fold((failure) => Left(failure), (data) {
      final usersList = data['data'] as List<dynamic>;

      final users = usersList
          .map((user) => DataListModel.fromJson(user as Map<String, dynamic>))
          .toList();

      return Right(users);
    });
  }

  @override
  FutureEither<String> grantPromoCode({
    required String promoCode,
    required String userId,
  }) async {
    final response = await _apiService.post<Map>(
      '/admin/users/$userId/grant-promo',
      data: {"code": promoCode},
    );

    return response.fold((failure) => Left(failure), (data) {
      return Right("Promo Code Grant Successful !!!");
    });
  }

  //##-------------------CREATE CARDS-------------------------##

  @override
  FutureEither<String> createCard({
    required CreateCardModel createCardM,
  }) async {
    FormData formData = FormData.fromMap({
      ...createCardM.toMap(),
      'audio': await MultipartFile.fromFile(
        createCardM.image.path,
        filename: createCardM.image.path.split('/').last,
      ),
    });

    final response = await _apiService.post<Map>(
      'admin/cards',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    return response.fold(
      (failure) => Left(failure),
      (data) => const Right("Cards Created Successfully!"),
    );
  }

  //##-------------------GET MEDITATIONS-------------------------##
  @override
  FutureEither<List<GetAdminMeditationModel>> getMeditations() async {
    final response = await _apiService.get('admin/meditations');

    return response.fold((failure) => Left(failure), (data) {
      final list = data['data'] as List<dynamic>;

      final meditations = list
          .map(
            (e) => GetAdminMeditationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();

      return Right(meditations);
    });
  }

  @override
  FutureEither<List<GetDailyGuidanceAdminModel>> getDailyGuidance() async {
    final response = await _apiService.get('admin/guidance');

    return response.fold((failure) => Left(failure), (data) {
      final list = data['data'] as List<dynamic>;

      final dailyGuidance = list
          .map(
            (e) =>
                GetDailyGuidanceAdminModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();

      return Right(dailyGuidance);
    });
  }

  @override
  FutureEither<GuidanceMetrics> getDailyGuidanceMetrics({
    required String dailyGuidanceId,
  }) async {
    final response = await _apiService.get(
      'admin/guidance/$dailyGuidanceId/metrics',
    );

    return response.fold((failure) => Left(failure), (data) {
      final metricsData = data['data'];

      final metrics = GuidanceMetrics.fromJson(metricsData);

      return Right(metrics);
    });
  }

}
