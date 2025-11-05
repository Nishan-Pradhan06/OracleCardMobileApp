import 'package:oracle_card_app/core/network/api_services.dart';

abstract interface class AdminRepository {}

class AdminRepositoryImp implements AdminRepository {
  final ApiService _apiService;

  AdminRepositoryImp({required ApiService apiService})
    : _apiService = apiService;
}
