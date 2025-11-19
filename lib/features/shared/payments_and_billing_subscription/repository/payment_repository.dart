import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/models/payment_plan_model.dart';

import '../models/payment_history_model.dart';

abstract interface class PaymentRepository {
  FutureEither<PaymentHistoryDataModel> getPaymentHistory();
  FutureEither<List<BillingPlanModel>> getBillingPlan();

  FutureEither<String> applyRedeemCode({required String redeemCode});
}

class PaymentRepositoryImpl implements PaymentRepository {
  final ApiService _apiService;

  PaymentRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  FutureEither<PaymentHistoryDataModel> getPaymentHistory() async {
    final response = await _apiService.get('billing/payments');

    return response.fold((failure) => Left(failure), (data) {
      final paymentJson = data['data'];

      final paymentHistory = PaymentHistoryDataModel.fromJson(paymentJson);
      return Right(paymentHistory);
    });
  }

  @override
  FutureEither<String> applyRedeemCode({required String redeemCode}) async {
    final response = await _apiService.post(
      'billing/redeem',
      data: {'code': redeemCode},
    );

    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data['data'] as String),
    );
  }

  @override
  FutureEither<List<BillingPlanModel>> getBillingPlan() async {
    final response = await _apiService.get('billing/plans');

    return response.fold((failure) => Left(failure), (data) {
      final plansJson = data['data']['plans'] as List<dynamic>;

      final billingPlans = plansJson
          .map(
            (planJson) =>
                BillingPlanModel.fromJson(planJson as Map<String, dynamic>),
          )
          .toList();

      return Right(billingPlans);
    });
  }
}
