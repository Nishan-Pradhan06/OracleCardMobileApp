import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final bool isGradient;
  final double? height;
  final double? width;
  final Color backgroundColor;
  final double svgSize;

  const CustomContainer({
    super.key,
    required this.child,
    this.isGradient = false,
    this.height,
    this.width,
    this.backgroundColor = Colors.white,
    this.svgSize = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10, // softness
            spreadRadius: 2, // how wide it spreads
            offset: const Offset(0, 4), // moves shadow down
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content
          Padding(padding: const EdgeInsets.all(16.0), child: child),
          if (isGradient)
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/overlay.svg',
                height: svgSize,
                width: svgSize,
              ),
            ),
        ],
      ),
    );
  }
}
