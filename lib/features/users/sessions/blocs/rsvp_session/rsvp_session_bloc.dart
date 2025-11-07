import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';

import '../../repository/session_repository.dart';

part 'rsvp_session_event.dart';
part 'rsvp_session_state.dart';
part 'rsvp_session_bloc.freezed.dart';

class RsvpSessionBloc extends Bloc<RsvpSessionEvent, RsvpSessionState> {
  final SessionRepository _sessionRepository;

  RsvpSessionBloc({required SessionRepository repo})
    : _sessionRepository = repo,
      super(RsvpSessionState.initial()) {
    on<_RsvpSessionE>(_onRsvpSession);
  }

  Future<void> _onRsvpSession(
    _RsvpSessionE event,
    Emitter<RsvpSessionState> emit,
  ) async {
    emit(RsvpSessionState.loading());
    await Future.delayed(Duration(seconds: 3));

    final result = await _sessionRepository.reserveSession(id: event.id);

    result.fold(
      (failure) => emit(RsvpSessionState.failure(failure)),
      (data) => emit(RsvpSessionState.loaded(data)),
    );
  }
}
