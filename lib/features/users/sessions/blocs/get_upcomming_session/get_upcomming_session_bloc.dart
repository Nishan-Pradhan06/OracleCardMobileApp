import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/sessions/models/session_model.dart';
import 'package:oracle_card_app/features/users/sessions/repository/session_repository.dart';

part 'get_upcomming_session_event.dart';
part 'get_upcomming_session_state.dart';
part 'get_upcomming_session_bloc.freezed.dart';

class GetUpcommingSessionBloc
    extends Bloc<GetUpcommingSessionEvent, GetUpcommingSessionState> {
  final SessionRepository _sessionRepository;
  GetUpcommingSessionBloc({required SessionRepository repo})
    : _sessionRepository = repo,
      super(GetUpcommingSessionState.initial()) {
    on<_GetUpCommingSession>(_onGetUpCommingSession);
  }

  Future<void> _onGetUpCommingSession(
    _GetUpCommingSession event,
    Emitter<GetUpcommingSessionState> emit,
  ) async {
    emit(GetUpcommingSessionState.loading());
    await Future.delayed(Duration(seconds: 3));

    final result = await _sessionRepository.getUpcommingSession();

    result.fold(
      (failure) => emit(GetUpcommingSessionState.failure(failure)),
      (data) => emit(GetUpcommingSessionState.loaded(data)),
    );
  }
}
