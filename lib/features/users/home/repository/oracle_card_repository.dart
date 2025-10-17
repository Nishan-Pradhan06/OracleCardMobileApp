import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/home/models/orcale_card_pull_status_model.dart';

abstract interface class OracleCardRepository {
  FutureEither<OrcaleCardPullStatusModel> getCardPullStatus();
}

class OracleCardRepositoryImpl implements OracleCardRepository {
  final ApiService _apiService;

  OracleCardRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<OrcaleCardPullStatusModel> getCardPullStatus() async {
    final response = await _apiService.get('oracle/pull/today');

    return response.fold((failure) => Left(failure), (data) {
      final pullData = data['data'];

      final model = OrcaleCardPullStatusModel.fromMap(pullData);

      return Right(model);
    });
  }
}
