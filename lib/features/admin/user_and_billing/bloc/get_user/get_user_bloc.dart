import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';

import '../../../repository/admin_repository.dart';
import '../../model/get_user_model.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';
part 'get_user_bloc.freezed.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final AdminRepository _adminRepository;
  GetUserBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(GetUserState.initial()) {
    on<_GetUserE>(_onGetUserList);
  }

  Future<void> _onGetUserList(
    _GetUserE event,

    Emitter<GetUserState> emit,
  ) async {
    emit(GetUserState.loading());
    final result = await _adminRepository.getUsers();

    result.fold(
      (failure) => emit(GetUserState.failure(failure)),
      (data) => emit(GetUserState.loaded(data)),
    );
  }
}
