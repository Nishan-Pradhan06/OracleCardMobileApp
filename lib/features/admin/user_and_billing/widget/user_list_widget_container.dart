import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_container.dart';

class UserListWidgetContainer extends StatelessWidget {
  final String userName;
  final String email;
  final String status;
  final String subStatus;
  final String nextBilling;
  final String pullCount;
  final String journalCount;
  final void Function()? onPressedGrantPromo;
  final void Function()? onPressedResetPassword;
  const UserListWidgetContainer({
    super.key,
    required this.userName,
    required this.email,
    required this.status,
    required this.subStatus,
    required this.nextBilling,
    required this.pullCount,
    required this.journalCount,
    this.onPressedGrantPromo,
    this.onPressedResetPassword,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      useIntrinsicHeight: true,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextTheme.of(context).headlineLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Colors.grey, fontSize: 17),
                  ),
                ],
              ),
              Container(
                height: 25,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF8B5CF6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: Color(0xFF8B5CF6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Text(
            'Subscription status',
            style: TextTheme.of(
              context,
            ).bodyLarge?.copyWith(color: Colors.grey[600]),
          ),

          Container(
            height: 25,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xFF10B981).withValues(alpha: 0.2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                subStatus,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: Color(0xFF10B981),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Next Billing',
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
              Text(
                nextBilling,
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Row(
            spacing: 30,
            children: [
              Row(
                spacing: 4,
                children: [
                  SvgPicture.asset('assets/icons/style.svg'),
                  Text(
                    'Pull: $pullCount',
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  SvgPicture.asset('assets/icons/book.svg'),
                  Text(
                    'Journals: $journalCount',
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),

          CustomOutlineButton(
            backgroundColor: Color(0xFFf7f5fc),
            leadingIcon: SvgPicture.asset('assets/icons/card_giftcard.svg'),
            text: 'Grant Promo',
            onPressed: onPressedGrantPromo,
          ),
          CustomOutlineButton(
            backgroundColor: Color(0xFFf7f5fc),
            leadingIcon: SvgPicture.asset('assets/icons/password.svg'),
            text: 'Reset Password',
            onPressed: onPressedResetPassword,
          ),
        ],
      ),
    );
  }
}
