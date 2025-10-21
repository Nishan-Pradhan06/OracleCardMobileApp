import 'package:flutter/material.dart';

class CustomBtnAdmin extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;

  const CustomBtnAdmin({
    super.key,
    required this.btnText,
    this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF6B48FF),
        shape: RoundedRectangleBorder(borderRadius: borderRadius!),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Icon(Icons.add, color: Color(0xFF6B48FF)),
          Text(
            btnText,
            style: TextTheme.of(context).bodyLarge?.copyWith(
              fontSize: 14,
              color: Color(0xFF6B48FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
