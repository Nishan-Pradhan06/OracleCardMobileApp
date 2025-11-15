import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

import '../../model/get_admin_meditations_model.dart';

part 'get_meditations_admin_event.dart';
part 'get_meditations_admin_state.dart';
part 'get_meditations_admin_bloc.freezed.dart';

class GetMeditationsAdminBloc
    extends Bloc<GetMeditationsAdminEvent, GetMeditationsAdminState> {
  final AdminRepository _adminRepository;
  GetMeditationsAdminBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(GetMeditationsAdminState.initial()) {
    on<_GetAdminMeditationsE>(_onGetMeditationsList);
  }

  Future<void> _onGetMeditationsList(
    _GetAdminMeditationsE event,
    Emitter<GetMeditationsAdminState> emit,
  ) async {
    emit(GetMeditationsAdminState.loading());

    final result = await _adminRepository.getMeditations();

    result.fold(
      (failure) => emit(GetMeditationsAdminState.failure(failure)),
      (data) => emit(GetMeditationsAdminState.loaded(data)),
    );
  }
}
