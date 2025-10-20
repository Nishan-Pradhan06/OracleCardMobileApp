import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/custom_toast.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';
import 'package:oracle_card_app/features/shared/payments_and_billing_subscription/bloc/redeem_promo_code/redeem_promo_code_bloc.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../home/widgets/notification_widget.dart';
import '../widgets/feature_list_tile.dart';

class BuyPremiumScreen extends StatefulWidget {
  const BuyPremiumScreen({super.key});

  @override
  State<BuyPremiumScreen> createState() => _BuyPremiumScreenState();
}

class _BuyPremiumScreenState extends State<BuyPremiumScreen> {
  final _formKey = GlobalKey<FormState>();
  final _promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
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
                    freePlan: CustomContainer(
                      useIntrinsicHeight: true,
                      child: Column(
                        spacing: 10,
                        children: [
                          SvgPicture.asset('assets/icons/king_circle.svg'),
                          Text(
                            'Upgrade to Premium',
                            style: TextTheme.of(context).titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            'Unlock all features including unlimited card pulls, full audio guidance, and permanent journal entries.',
                            textAlign: TextAlign.center,
                            style: TextTheme.of(
                              context,
                            ).bodyLarge?.copyWith(color: Colors.grey),
                          ),
                          CustomButton(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),

                            text: 'Upgrade to Premium',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    paidPlan: SizedBox.shrink(),
                  ),

                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          'Promo Code',
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        Form(
                          key: _formKey,
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hint: 'Enter promo code',
                                  controller: _promoCodeController,
                                  hintStyle: TextTheme.of(
                                    context,
                                  ).bodyLarge?.copyWith(color: Colors.grey),
                                ),
                              ),
                              BlocConsumer<
                                RedeemPromoCodeBloc,
                                RedeemPromoCodeState
                              >(
                                listener: (context, state) {
                                  state.whenOrNull(
                                    loaded: (data) {
                                      CustomToast.showSuccess(
                                        "Promo code applied successfully",
                                      );
                                    },
                                    failure: (failure) =>
                                        CustomToast.showError(failure.message),
                                  );
                                },
                                builder: (context, state) {
                                  final bool isLoading = state.maybeWhen(
                                    loading: () => true,
                                    orElse: () => false,
                                  );
                                  return CustomButton(
                                    width: 100,
                                    text: 'Apply',
                                    isDisabled: isLoading,
                                    isLoading: isLoading,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        sl<RedeemPromoCodeBloc>().add(
                                          RedeemPromoCodeEvent.redeemPromoCode(
                                            redeemPromoCode:
                                                _promoCodeController.text,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        Text(
                          'Promo codes will be applied when you upgrade to Premium',
                          textAlign: TextAlign.center,
                          style: TextTheme.of(
                            context,
                          ).bodyMedium?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  CustomContainer(
                    useIntrinsicHeight: true,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Premium Features',
                          style: TextTheme.of(context).titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        FeatureListTile(
                          featureTitle: 'Unlimited daily card pulls',
                        ),
                        FeatureListTile(
                          featureTitle: 'Full audio guidance library',
                        ),
                        FeatureListTile(
                          featureTitle: 'Permanent journal entries',
                        ),
                        FeatureListTile(
                          featureTitle: 'Access to all meditations',
                        ),
                        FeatureListTile(featureTitle: 'Ad-free experience'),
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
}
