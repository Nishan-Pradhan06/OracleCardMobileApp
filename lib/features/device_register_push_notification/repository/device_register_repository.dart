import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';

import '../model/device_model.dart';

abstract interface class DeviceRegisterForPushNotificationRepository {
  FutureEither<String> deviceRegister({
    required DeviceRegisterModel deviceRegisterModel,
  });
}

class DeviceRegisterForPushNotificationRepositoryImpl
    implements DeviceRegisterForPushNotificationRepository {
  final ApiService _apiService;

  DeviceRegisterForPushNotificationRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  @override
  FutureEither<String> deviceRegister({
    required DeviceRegisterModel deviceRegisterModel,
  }) async {
    final response = await _apiService.post<Map>(
      'device/register',
      data: {...deviceRegisterModel.toMap()},
    );

    return response.fold((failure) => Left(failure), (data) {
      final deviceData = data['data'];

      return Right(deviceData);
    });
  }
}
