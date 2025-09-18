import 'package:flutter/material.dart';

class CustomCardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final Widget? leading; // optional leading widget
  final Widget? action; // optional trailing widget

  const CustomCardButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 12,
    this.borderWidth = 1.5,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.leading,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

            side: BorderSide(
              color: const Color(
                0xFFFFFFFF,
              ).withValues(alpha: 0.1), // 10% opacity
              width: borderWidth,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 8)],
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xFFFFFFFF).withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (action != null) ...[const SizedBox(width: 8), action!],
            ],
          ),
        ),
      ),
    );
  }
}
