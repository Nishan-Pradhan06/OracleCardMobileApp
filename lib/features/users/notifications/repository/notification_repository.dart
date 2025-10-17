import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';

import '../models/notification_model.dart';

abstract interface class NotificationRepository {
  FutureEither<NotificationModel> notificationInbox();
}

class NotificationRepositoryImpl implements NotificationRepository {
  final ApiService _apiService;

  NotificationRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<NotificationModel> notificationInbox() async {
    final response = await _apiService.get('notifications');

    return response.fold((failure) => Left(failure), (data) {
      final model = data['data'];
      final notification = NotificationModel.fromMap(model);
      return Right(notification);
    });
  }
}
