import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_container.dart';

class PromptCard extends StatelessWidget {
  final String title;
  final String description;
  final Color sideColor;
  final Color backgroundColor;
  const PromptCard({
    super.key,
    required this.title,
    required this.description,
    this.sideColor = const Color(0xFF6B48FF),
    this.backgroundColor = const Color(0xFFF1EDFF),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          // Orange bar
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFF6B48FF),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // Card
          CustomContainer(
            useIntrinsicHeight: true,
            backgroundColor: Color(0xFFf1edff),
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(16),
            borderRadius: BorderRadius.circular(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    color: Color(0xFF6B48FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    // color: Color(0xFF6B48FF),
                    // fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
