import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});

  Widget _buildSkeleton({
    double height = 16,
    double width = double.infinity,
    BorderRadius? radius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: radius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Name Field
            _buildSkeleton(height: 50),
            const SizedBox(height: 12),
            // Email Field
            _buildSkeleton(height: 50),
            const SizedBox(height: 12),
            // Timezone Field
            _buildSkeleton(height: 50),
            const SizedBox(height: 24),

            // Preferences Section
            _buildSkeleton(height: 24, width: 120),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSkeleton(height: 20, width: 180),
                _buildSkeleton(
                  height: 24,
                  width: 50,
                  radius: BorderRadius.circular(12),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Billing Section
            _buildSkeleton(height: 24, width: 120),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSkeleton(height: 20, width: 100),
                    const SizedBox(height: 8),
                    _buildSkeleton(height: 24, width: 60),
                  ],
                ),
                _buildSkeleton(
                  height: 48,
                  width: 160,
                  radius: BorderRadius.circular(12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
