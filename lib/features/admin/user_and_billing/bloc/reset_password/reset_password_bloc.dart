import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';
part 'reset_password_bloc.freezed.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AdminRepository _adminRepository;
  ResetPasswordBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(ResetPasswordState.initial()) {
    on<_ResetPasswordE>(_onResetPassword);
  }

  Future<void> _onResetPassword(
    _ResetPasswordE event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordState.loading());
    final result = await _adminRepository.resetPassword(userId: event.userId);

    result.fold(
      (failure) => emit(ResetPasswordState.failure(failure)),
      (data) => emit(ResetPasswordState.loaded(data)),
    );
  }
}
