import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/notifications/models/notification_model.dart';
import 'package:oracle_card_app/features/users/notifications/repository/notification_repository.dart';

part 'get_notifications_event.dart';
part 'get_notifications_state.dart';
part 'get_notifications_bloc.freezed.dart';

class GetNotificationsBloc
    extends Bloc<GetNotificationsEvent, GetNotificationsState> {
  final NotificationRepository _notificationRepository;
  GetNotificationsBloc({required NotificationRepository repo})
    : _notificationRepository = repo,
      super(GetNotificationsState.initial()) {
    on<_GetNotificationInbox>(_onGetNotificationsInbox);
  }

  Future<void> _onGetNotificationsInbox(
    _GetNotificationInbox event,
    Emitter<GetNotificationsState> emit,
  ) async {
    emit(GetNotificationsState.loading());

    final result = await _notificationRepository.notificationInbox();

    result.fold(
      (failure) => emit(GetNotificationsState.failure(failure)),
      (notificationData) =>
          emit(GetNotificationsState.loaded(notificationData)),
    );
  }
}
