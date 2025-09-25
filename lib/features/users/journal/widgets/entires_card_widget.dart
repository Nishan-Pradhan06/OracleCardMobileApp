import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_container.dart';

class EntriesCardWidget extends StatelessWidget {
  final String dateTime;
  final String title;
  final String description;
  final void Function()? onTap;

  const EntriesCardWidget({
    super.key,
    required this.dateTime,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPadding(
        horizontal: 0,
        vertical: 10,
        child: CustomContainer(
          height: MediaQuery.sizeOf(context).height / 6.5,
          useIntrinsicHeight: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date / Time
              Text(
                dateTime,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: const Color(0xFF000000).withValues(alpha: 0.55),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 5),

              // Title
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF6B48FF),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 5),

              // Description
              Text(
                description,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
