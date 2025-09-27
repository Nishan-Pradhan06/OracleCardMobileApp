import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_container.dart';

class GuidanceCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String dateTime;
  final bool isLock;
  final void Function()? onTap;

  const GuidanceCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isLock = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLock ? null : onTap,
      child: CustomPadding(
        horizontal: 0,
        vertical: 10,
        child: CustomContainer(
          useIntrinsicHeight: true,
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    dateTime,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                ],
              ),
              Text(
                description,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  SvgPicture.asset(
                    isLock
                        ? 'assets/icons/audio_dark.svg'
                        : 'assets/icons/audio.svg',
                  ),
                  Text(
                    'Audio',
                    style: TextTheme.of(context).bodySmall?.copyWith(
                      color: Color(isLock ? 0xFFCCCCCC : 0xFF6B48FF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
