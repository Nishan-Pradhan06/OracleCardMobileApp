part of 'get_notifications_bloc.dart';

@freezed
abstract class GetNotificationsEvent with _$GetNotificationsEvent {
  const factory GetNotificationsEvent.getNotificationInbox() = _GetNotificationInbox;
}