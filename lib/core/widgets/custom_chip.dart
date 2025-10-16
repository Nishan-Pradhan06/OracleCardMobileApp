import 'package:flutter/material.dart';

/// Enum for chip types
enum ChipType { free, premium }

class CustomChip extends StatelessWidget {
  final ChipType planType;

  const CustomChip({super.key, this.planType = ChipType.free});

  @override
  Widget build(BuildContext context) {
    // Determine chip type based on the user's plan

    // Colors based on type
    final Gradient? gradient = planType == ChipType.premium
        ? const LinearGradient(
            colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : null;

    final Color backgroundColor = planType == ChipType.free
        ? const Color(0xFFF0F0F0)
        : Colors.transparent;

    final Color textColor = planType == ChipType.premium
        ? Colors.white
        : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          if (planType == ChipType.premium)
            BoxShadow(
              color:
                  (planType == ChipType.premium
                          ? const Color(0xFFFF7E5F)
                          : Colors.black)
                      .withValues(alpha: 0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Text(
        planType.name.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
