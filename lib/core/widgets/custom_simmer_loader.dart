import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderWidget extends StatelessWidget {
  /// Whether to show a list shimmer
  final bool isList;

  /// Whether to show a grid shimmer
  final bool isGrid;

  /// Number of shimmer items to show (for list or grid)
  final int count;

  /// Number of grid columns if grid is enabled
  final int gridCount;

  /// Custom height and width
  final double? height;
  final double? width;

  /// Space between items
  final double spacing;

  /// Border radius for shimmer boxes
  final double borderRadius;

  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerLoaderWidget({
    super.key,
    this.isList = false,
    this.isGrid = false,
    this.count = 3,
    this.gridCount = 2,
    this.height,
    this.width,
    this.spacing = 12,
    this.borderRadius = 12,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.sizeOf(context).width;

    // Default shimmer item
    Widget shimmerBox() {
      return Container(
        width: width ?? double.infinity,
        height: height ?? 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      );
    }

    // Actual shimmer builder
    final shimmerChild = isGrid
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: count,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: 1,
            ),
            itemBuilder: (_, __) => shimmerBox(),
          )
        : isList
        ? ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: count,
            separatorBuilder: (_, __) => SizedBox(height: spacing),
            itemBuilder: (_, __) => shimmerBox(),
          )
        : shimmerBox(); // default individual shimmer

    // Shimmer effect
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      child: shimmerChild,
    );
  }
}
