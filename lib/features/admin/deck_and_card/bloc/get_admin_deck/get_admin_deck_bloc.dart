import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/deck_model.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

part 'get_admin_deck_event.dart';
part 'get_admin_deck_state.dart';
part 'get_admin_deck_bloc.freezed.dart';

class GetAdminDeckBloc extends Bloc<GetAdminDeckEvent, GetAdminDeckState> {
  final AdminRepository _adminRepository;
  GetAdminDeckBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(GetAdminDeckState.initial()) {
    on<_GetAdminDeckE>(_onGetAdminDeckList);
  }

  Future<void> _onGetAdminDeckList(
    _GetAdminDeckE event,
    Emitter<GetAdminDeckState> emit,
  ) async {
    emit(GetAdminDeckState.loading());
    final result = await _adminRepository.getAdminDeck();

    result.fold(
      (failure) => emit(GetAdminDeckState.failure(failure)),
      (data) => emit(GetAdminDeckState.loaded(data)),
    );
  }
}
