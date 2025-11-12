import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

part 'grant_promo_code_event.dart';
part 'grant_promo_code_state.dart';
part 'grant_promo_code_bloc.freezed.dart';

class GrantPromoCodeBloc
    extends Bloc<GrantPromoCodeEvent, GrantPromoCodeState> {
  final AdminRepository _adminRepository;
  GrantPromoCodeBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(GrantPromoCodeState.initial()) {
    on<_GrantPromoCodeE>(_onGrantPromoCode);
  }

  Future<void> _onGrantPromoCode(
    _GrantPromoCodeE event,

    Emitter<GrantPromoCodeState> emit,
  ) async {
    emit(GrantPromoCodeState.loading());
    final result = await _adminRepository.grantPromoCode(
      promoCode: event.promoCode,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(GrantPromoCodeState.failure(failure)),
      (data) => emit(GrantPromoCodeState.loaded(data)),
    );
  }
}
