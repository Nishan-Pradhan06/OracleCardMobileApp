import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';

import '../../../repository/admin_repository.dart';
import '../../models/create_sessions_model.dart';

part 'create_sessions_event.dart';
part 'create_sessions_state.dart';
part 'create_sessions_bloc.freezed.dart';

class CreateSessionsBloc
    extends Bloc<CreateSessionsEvent, CreateSessionsState> {
  final AdminRepository _adminRepository;

  CreateSessionsBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(CreateSessionsState.initial()) {
    on<_CreateSessionE>(_onCreateSessions);
  }

  Future<void> _onCreateSessions(
    _CreateSessionE event,
    Emitter<CreateSessionsState> emit,
  ) async {
    emit(CreateSessionsState.loading());
    final result = await _adminRepository.createSessions(
      createSessionM: event.createSessonM,
    );

    result.fold(
      (failure) => emit(CreateSessionsState.failure(failure)),
      (data) => emit(CreateSessionsState.loaded(data)),
    );
  }
}
