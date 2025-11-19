part of 'read_notification_bloc.dart';

@freezed
abstract class ReadNotificationEvent with _$ReadNotificationEvent {
  const factory ReadNotificationEvent.readNotification({
    required int notificationId,
  }) = _ReadNotificationE;
}
