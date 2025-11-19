import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/get_billing_plans/get_billing_plans_bloc.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/get_payment_history/get_payment_history_bloc.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/date_time_utils.dart';
import '../../../../core/widgets/credit_card_masked_widget.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../../users/home/widgets/notification_widget.dart';
import '../widgets/pricing_widget.dart';

class BillingDetailsScreen extends StatelessWidget {
  const BillingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetPaymentHistoryBloc>().add(
              GetPaymentHistoryEvent.getPaymentHistory(),
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    'Billing',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  UserPlanTypeWidget(
                    freePlan: BlocBuilder<GetBillingPlansBloc, GetBillingPlansState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const SizedBox(height: 100),
                          loading: () => const SizedBox(
                            height: 45,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: ShimmerLoaderWidget(
                                height: 45,
                                baseColor: Color(0xFF6790ff),
                                highlightColor: Color(0xFF4da0ff),
                              ),
                            ),
                          ),
                          failure: (failure) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: ShimmerLoaderWidget(
                              height: 45,
                              baseColor: Color(0xFF6790ff),
                              highlightColor: Color(0xFF4da0ff),
                            ),
                          ),
                          loaded: (data) {
                            return Column(
                              children: List.generate(data.length, (index) {
                                final plans = data[index];

                                return PricingCard(
                                  index: data.length,
                                  selectedIndex: 0,
                                  planName: plans.name,
                                  price:
                                      "\$${(plans.priceCents / 100).toStringAsFixed(2)}",
                                  interval: plans.interval,
                                  trialDays:
                                      "${plans.freeTrialDays} days free trial",
                                  showPopularBadge: plans.name == 'Yearly'
                                      ? true
                                      : false,
                                  onTap: () {},
                                );
                              }),
                            );
                          },
                        );
                      },
                    ),
                    paidPlan: manageSubscription(context),
                  ),

                  paymentMethod(context),
                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment History',
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        BlocBuilder<
                          GetPaymentHistoryBloc,
                          GetPaymentHistoryState
                        >(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const SizedBox(height: 100),
                              loading: () => Column(
                                children: List.generate(3, (index) {
                                  return Shimmer(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.grey.shade100,
                                        Colors.grey.shade300,
                                      ],
                                      begin: Alignment(-1.0, -0.3),
                                      end: Alignment(1.0, 0.3),
                                    ),
                                    child: Container(
                                      height: 40,
                                      width: double.infinity,
                                      color: Colors.grey,
                                      margin: const EdgeInsets.only(bottom: 10),
                                    ),
                                  );
                                }),
                              ),
                              failure: (failure) => SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Error: ${failure.message}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              loaded: (paymentHistoryD) {
                                return Column(
                                  children: List.generate(
                                    paymentHistoryD.items.length,
                                    (index) {
                                      final data = paymentHistoryD.items[index];
                                      final date =
                                          DateTimeUtils.formatReadableDate(
                                            data.createdAt.toIso8601String(),
                                          );
                                      return PaymentDetails(
                                        date: date,
                                        description: data.status,
                                        amount: data.amountCents.toString(),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomContainer paymentMethod(BuildContext context) {
    return CustomContainer(
      useIntrinsicHeight: true,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Payment Method',
            style: TextTheme.of(
              context,
            ).titleLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/card.svg'),
              Expanded(child: CreditCardMasked(cardNumber: '12345678943534')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Expires', style: TextTheme.of(context).bodyMedium),
              Text(
                '12/2025',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomButton(
            backgroundColor: Color(0xFFF0F0F0),
            textColor: Color(0xFF6B48FF),
            text: 'Update Payment Method',
            height: MediaQuery.sizeOf(context).height * 0.05,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  CustomContainer manageSubscription(BuildContext context) {
    return CustomContainer(
      useIntrinsicHeight: true,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Manage Subscription',
            style: TextTheme.of(
              context,
            ).titleLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Current Plan', style: TextTheme.of(context).bodyMedium),
              Text(
                'Premium',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Billing Date',
                style: TextTheme.of(context).bodyMedium,
              ),
              Text(
                'July 15,2025',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: TextTheme.of(context).bodyMedium),
              Text(
                '\$9.99/month',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: CustomButton(
              backgroundColor: Color(0xFFF0F0F0),
              textColor: Color(0xFFFF7E5F),
              text: 'Cancel Subscription',
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width / 2,
              onPressed: () {
                context.pushNamed(AppRoutesName.buyPremiumScreenScreenRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  final String date;
  final String description;
  final String amount;
  const PaymentDetails({
    super.key,
    required this.date,
    required this.description,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: 6,
      children: [
        Text(
          date,
          style: TextTheme.of(context).bodyLarge?.copyWith(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(description, style: TextTheme.of(context).bodyLarge),
            Text(
              '\$$amount',
              style: TextTheme.of(
                context,
              ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
