import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/home/models/daily_guidance_model.dart';
import 'package:oracle_card_app/features/users/library/models/guidance_archive_model.dart';

abstract interface class GuidanceRepository {
  FutureEither<DailyGuidanceModel> getDailyGuidance();

  FutureEither<GuidanceArchiveModel> getGuidanceArchive();
}

class GuidanceRepositoryImpl implements GuidanceRepository {
  final ApiService _apiService;

  GuidanceRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  FutureEither<DailyGuidanceModel> getDailyGuidance() async {
    final response = await _apiService.get('guidance/today');

    return response.fold((failure) => Left(failure), (data) {
      final guidanceData = data['data'];
      final guidance = DailyGuidanceModel.fromMap(guidanceData);
      return Right(guidance);
    });
  }

  @override
  FutureEither<GuidanceArchiveModel> getGuidanceArchive() async {
    final response = await _apiService.get('guidance');

    return response.fold((failure) => Left(failure), (data) {
      final guidanceArchiveData = data['data'];
      final guidanceArch = GuidanceArchiveModel.fromJson(guidanceArchiveData);

      return Right(guidanceArch);
    });
  }
}
