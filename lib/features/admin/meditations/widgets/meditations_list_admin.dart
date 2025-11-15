import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_container.dart';

class AdminMeditationsCard extends StatelessWidget {
  final String title;
  final String visibility;
  final String dateTime;
  final String? durations;
  const AdminMeditationsCard({
    super.key,
    required this.title,
    required this.visibility,
    required this.dateTime,
    this.durations,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.only(bottom: 10),
      useIntrinsicHeight: true,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextTheme.of(context).headlineLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
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
                    visibility,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: Color(0xFF8B5CF6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/schedule.svg'),
                  SizedBox(width: 4),
                  Text(
                    dateTime,
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: Color(0xFF6B7280)),
                  ),
                ],
              ),
              if (durations != null)
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.timer, size: 16, color: Color(0xFF6B7280)),
                    SizedBox(width: 4),
                    Text(
                      durations!,
                      style: TextTheme.of(
                        context,
                      ).bodyLarge?.copyWith(color: Color(0xFF6B7280)),
                    ),
                  ],
                )
              else
                SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
