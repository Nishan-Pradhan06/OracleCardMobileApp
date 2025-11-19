import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/repository/payment_repository.dart';

import '../../models/payment_plan_model.dart';

part 'get_billing_plans_event.dart';
part 'get_billing_plans_state.dart';
part 'get_billing_plans_bloc.freezed.dart';

class GetBillingPlansBloc
    extends Bloc<GetBillingPlansEvent, GetBillingPlansState> {
  final PaymentRepository _paymentRepository;
  GetBillingPlansBloc({required PaymentRepository repo})
    : _paymentRepository = repo,
      super(GetBillingPlansState.initial()) {
    on<_GetBillingPlanE>(_onGetBillingPlan);
  }

  Future<void> _onGetBillingPlan(
    _GetBillingPlanE event,
    Emitter<GetBillingPlansState> emit,
  ) async {
    emit(GetBillingPlansState.loading());

    final result = await _paymentRepository.getBillingPlan();

    result.fold(
      (failure) => emit(GetBillingPlansState.failure(failure)),
      (billingPlans) => emit(GetBillingPlansState.loaded(billingPlans)),
    );
  }
}
