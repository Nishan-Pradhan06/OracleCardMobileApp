import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/repository/payment_repository.dart';

part 'redeem_promo_code_event.dart';
part 'redeem_promo_code_state.dart';
part 'redeem_promo_code_bloc.freezed.dart';

class RedeemPromoCodeBloc
    extends Bloc<RedeemPromoCodeEvent, RedeemPromoCodeState> {
  final PaymentRepository _paymentRepository;
  RedeemPromoCodeBloc({required PaymentRepository repo})
    : _paymentRepository = repo,
      super(RedeemPromoCodeState.initial()) {
    on<_RedeemPromoCodeE>(_onRedeemPromoCode);
  }
  Future<void> _onRedeemPromoCode(
    _RedeemPromoCodeE event,
    Emitter<RedeemPromoCodeState> emit,
  ) async {
    emit(RedeemPromoCodeState.loading());

    final result = await _paymentRepository.applyRedeemCode(
      redeemCode: event.redeemPromoCode,
    );

    result.fold(
      (failure) => emit(RedeemPromoCodeState.failure(failure)),
      (data) => emit(RedeemPromoCodeState.loaded(data)),
    );
  }
}
