import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFeaturedBookItem extends StatelessWidget {
  const ShimmerFeaturedBookItem({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0.28.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[400]!,
        direction: ShimmerDirection.ltr, // Left to right shimmer
        child: Container(
          width: 0.4.w,
          height: 0.2.h,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
