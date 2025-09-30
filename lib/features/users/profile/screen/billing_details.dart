import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/credit_card_masked_widget.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../home/widgets/notification_widget.dart';

class BillingDetailsScreen extends StatelessWidget {
  const BillingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
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
                manageSubscription(context),
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

                      PaymentDetails(),
                      PaymentDetails(),
                      PaymentDetails(),
                      PaymentDetails(),
                      PaymentDetails(),
                      PaymentDetails(),
                    ],
                  ),
                ),
              ],
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: 6,
      children: [
        Text(
          'Jun 15, 2023',
          style: TextTheme.of(context).bodyLarge?.copyWith(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Subscription',
              style: TextTheme.of(context).bodyLarge,
            ),
            Text(
              '\$9.99',
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
