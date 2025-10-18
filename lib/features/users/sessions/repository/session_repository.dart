import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/sessions/models/session_model.dart';

abstract interface class SessionRepository {
  FutureEither<UpcomingSessionsDataModel> getUpcommingSession();
}

class SessionRepositoryImpl implements SessionRepository {
  final ApiService _apiService;

  SessionRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<UpcomingSessionsDataModel> getUpcommingSession() async {
    final response = await _apiService.get('sessions');

    return response.fold((failure) => Left((failure)), (data) {
      final dataJson = data['data'];
      final getUpCommingSessions = UpcomingSessionsDataModel.fromJson(dataJson);
      return Right(getUpCommingSessions);
    });
  }
}
