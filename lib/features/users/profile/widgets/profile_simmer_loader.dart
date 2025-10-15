import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSkeletonLoader extends StatelessWidget {
  const ProfileSkeletonLoader({super.key});

  Widget _buildShimmerContainer({
    double height = 16,
    double width = double.infinity,
    double radius = 8,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar Section
            Center(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildShimmerContainer(height: 20, width: 120),
                ],
              ),
            ),

            // Profile Info Section (Name, Email, Timezone)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.cardColor,
              ),
              child: Column(
                spacing: 10,
                children: [
                  // Name field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      _buildShimmerContainer(height: 14, width: 60),
                      _buildShimmerContainer(
                        height: 48,
                        width: double.infinity,
                      ),
                    ],
                  ),
                  // Email field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      _buildShimmerContainer(height: 14, width: 60),
                      _buildShimmerContainer(
                        height: 48,
                        width: double.infinity,
                      ),
                    ],
                  ),
                  // Timezone field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      _buildShimmerContainer(height: 14, width: 80),
                      _buildShimmerContainer(
                        height: 48,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Preferences Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.cardColor,
              ),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(height: 24, width: 140),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildShimmerContainer(height: 18, width: 160),
                      _buildShimmerContainer(height: 28, width: 50, radius: 20),
                    ],
                  ),
                ],
              ),
            ),

            // Billing Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.cardColor,
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(height: 24, width: 100),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          _buildShimmerContainer(height: 16, width: 100),
                          _buildShimmerContainer(height: 20, width: 60),
                        ],
                      ),
                      _buildShimmerContainer(
                        height: 40,
                        width: 180,
                        radius: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Sign Out Button
            _buildShimmerContainer(
              height: 48,
              width: double.infinity,
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
