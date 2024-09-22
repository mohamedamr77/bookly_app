import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'build_shimmer_item.dart';

class BuildShimmerList extends StatelessWidget {
  const BuildShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[600]!,
            highlightColor: Colors.grey[400]!,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.01.h, horizontal: 0.05.w),
              child: const BuildShimmerItem(),
            ),
          );
        },
        childCount: 10, // Simulated shimmer items count
      ),
    );
  }
}
