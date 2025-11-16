import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_container.dart';

class SessionsCardWidget extends StatelessWidget {
  final String dateText;
  final String title;
  final String description;
  final bool isButtonEnabled;
  // final VoidCallback? rsvpButton;
  final VoidCallback? onTap;
  final bool? isLoading;

  const SessionsCardWidget({
    super.key,
    required this.dateText,
    required this.title,
    required this.description,
    this.isButtonEnabled = true,
    // this.rsvpButton,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: 10),
      useIntrinsicHeight: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 4,
            children: [
              const Icon(Icons.calendar_month, size: 18),
              Text(dateText),
            ],
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            description,
            style: TextTheme.of(
              context,
            ).bodyLarge?.copyWith(fontSize: 20, color: Colors.grey[700]),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              height: 36,
              width: 90,
              leadingIcon: Icon(
                isButtonEnabled ? Icons.check : Icons.lock,
                color: Colors.white,
                size: 15,
              ),
              text: 'RSVP',
              isLoading: isLoading!,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              isDisabled: !isButtonEnabled,
              // onPressed: isButtonEnabled ? rsvpButton ?? () {} : () {},
            ),
          ),
        ],
      ),
    );
  }
}
