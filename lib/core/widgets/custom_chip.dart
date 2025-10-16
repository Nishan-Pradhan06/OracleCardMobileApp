import 'package:flutter/material.dart';
import '../helpers/user_session_helper.dart';

/// Enum for chip types
enum ChipType { free, premium }

/// A reusable custom chip that displays the current user plan (Free or Premium)
/// using global UserSession values.
class CustomChip extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomChip({super.key, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
      //TODO:

    final session = UserPlanType();
    final plan = session.plan?.toUpperCase();

    // Determine chip type based on the user's plan
    final ChipType type = plan == 'PREMIUM' ? ChipType.premium : ChipType.free;

    // Colors based on type
    final Gradient? gradient = type == ChipType.premium
        ? const LinearGradient(
            colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : null;

    final Color backgroundColor = type == ChipType.free
        ? const Color(0xFFF0F0F0)
        : Colors.transparent;

    final Color textColor = type == ChipType.premium
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: gradient == null ? backgroundColor : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color:
                    (type == ChipType.premium
                            ? const Color(0xFFFF7E5F)
                            : Colors.black)
                        .withValues(alpha: 0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Text(
          plan.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
