import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart' show CustomContainer;
import 'package:shimmer/shimmer.dart';

class DailyGuidanceSkeleton extends StatelessWidget {
  const DailyGuidanceSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CustomContainer(
        height: MediaQuery.sizeOf(context).height / 3.8,
        useIntrinsicHeight: true,
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        isGradient: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            // Title skeleton
            Container(
              height: 24,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            // Description skeleton (2–3 lines)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: List.generate(
                3,
                (index) => Container(
                  height: 16,
                  width: index == 2 ? 200 : double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),

            // Audio player skeleton
            Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300,
              ),
              child: Row(
                spacing: 10,
                children: [
                  // Circle button
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  // Progress bar skeleton
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // Time text skeleton
                  Container(
                    height: 16,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
