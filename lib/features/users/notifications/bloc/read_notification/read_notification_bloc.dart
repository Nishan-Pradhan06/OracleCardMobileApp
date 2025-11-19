import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/notifications/repository/notification_repository.dart';

part 'read_notification_event.dart';
part 'read_notification_state.dart';
part 'read_notification_bloc.freezed.dart';

class ReadNotificationBloc
    extends Bloc<ReadNotificationEvent, ReadNotificationState> {
  final NotificationRepository _notificationRepository;
  ReadNotificationBloc({required NotificationRepository repo})
    : _notificationRepository = repo,
      super(ReadNotificationState.initial()) {
    on<_ReadNotificationE>(_onReadNotification);
  }

  Future<void> _onReadNotification(
    _ReadNotificationE event,
    Emitter<ReadNotificationState> emit,
  ) async {
    emit(ReadNotificationState.loading());

    final result = await _notificationRepository.readNotification(
      event.notificationId,
    );

    result.fold(
      (failure) => emit(ReadNotificationState.failure(failure)),
      (data) => emit(ReadNotificationState.loaded(data)),
    );
  }
}
