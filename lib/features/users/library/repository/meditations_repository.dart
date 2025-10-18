import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/library/models/meditation_by_id_model.dart';

import '../models/meditation_model.dart';

abstract interface class MeditationsRepository {
  FutureEither<MeditationModel> getMeditations();

  FutureEither<MeditationDataModel> getMeditationsById({
    required int meditationId,
  });
}

class MeditationsRepositoryImp implements MeditationsRepository {
  final ApiService _apiService;

  MeditationsRepositoryImp({required ApiService apiService})
    : _apiService = apiService;
  //##-------------------GET MEDITATIONS-------------------------##
  @override
  FutureEither<MeditationModel> getMeditations() async {
    final response = await _apiService.get<Map>('meditations');

    return response.fold((failure) => Left(failure), (meditationData) {
      final dataJson = meditationData['data'];
      final meditationModel = MeditationModel.fromJson(dataJson);
      return Right(meditationModel);
    });
  }

  //##-------------------GET MEDITATIONS BY ID-------------------------##
  @override
  FutureEither<MeditationDataModel> getMeditationsById({
    required int meditationId,
  }) async {
    final response = await _apiService.get<Map>('meditations/$meditationId');

    return response.fold((failure) => Left((failure)), (data) {
      final dataJson = data['data'];

      final meditationById = MeditationDataModel.fromJson(dataJson);

      return Right(meditationById);
    });
  }
}
