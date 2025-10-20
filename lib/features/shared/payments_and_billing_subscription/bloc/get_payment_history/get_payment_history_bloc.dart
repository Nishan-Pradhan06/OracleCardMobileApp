import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/repository/payment_repository.dart';

import '../../models/payment_history_model.dart';

part 'get_payment_history_event.dart';
part 'get_payment_history_state.dart';
part 'get_payment_history_bloc.freezed.dart';

class GetPaymentHistoryBloc
    extends Bloc<GetPaymentHistoryEvent, GetPaymentHistoryState> {
  final PaymentRepository _paymentRepository;
  GetPaymentHistoryBloc({required PaymentRepository repo})
    : _paymentRepository = repo,
      super(GetPaymentHistoryState.initial()) {
    on<_GetPaymentHistoryE>(_onGetPaymentHistory);
  }

  Future<void> _onGetPaymentHistory(
    _GetPaymentHistoryE event,
    Emitter<GetPaymentHistoryState> emit,
  ) async {
    emit(GetPaymentHistoryState.loading());
    await Future.delayed(Duration(seconds: 3));

    final result = await _paymentRepository.getPaymentHistory();

    result.fold(
      (failure) => emit(GetPaymentHistoryState.failure(failure)),
      (data) => emit(GetPaymentHistoryState.loaded(data)),
    );
  }
}
