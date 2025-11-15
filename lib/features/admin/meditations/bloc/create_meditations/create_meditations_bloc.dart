import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/meditations/model/create_meditations_model.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

part 'create_meditations_event.dart';
part 'create_meditations_state.dart';
part 'create_meditations_bloc.freezed.dart';

class CreateMeditationsBloc
    extends Bloc<CreateMeditationsEvent, CreateMeditationsState> {
  final AdminRepository _adminRepository;
  CreateMeditationsBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(CreateMeditationsState.initial()) {
    on<_CreateMeditationE>(_onCreateMeditations);
  }

  Future<void> _onCreateMeditations(
    _CreateMeditationE event,
    Emitter<CreateMeditationsState> emit,
  ) async {
    emit(CreateMeditationsState.loading());
    final result = await _adminRepository.createMeditations(
      createMeditations: event.createMeditationM,
    );

    result.fold(
      (failure) => emit(CreateMeditationsState.failure(failure)),
      (data) => emit(CreateMeditationsState.loaded(data)),
    );
  }
}
