import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final bool isGradient;
  final double? height;
  final double? width;
  final Color backgroundColor;

  const CustomContainer({
    super.key,
    required this.child,
    this.isGradient = false,
    this.height,
    this.width,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: height ?? MediaQuery.sizeOf(context).height / 4.5,
      width: width ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: isGradient
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6B48FF), Color(0xFF40C4FF)],
              )
            : null,
        color: isGradient ? null : backgroundColor,
      ),
      child: child,
    );
  }
}
