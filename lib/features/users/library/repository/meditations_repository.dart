import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';

import '../models/meditation_model.dart';

abstract interface class MeditationsRepository {
  FutureEither<MeditationModel> getMeditations();
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
}
