import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import 'build_shimmer_details_row_line.dart';
import 'build_shimmer_line.dart';

class BuildShimmerItem extends StatelessWidget {
  const BuildShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 0.23.w,
          height: 0.18.h,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(width: 0.05.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildShimmerLine(height: 0.02.h),
              SizedBox(height: 0.03.h),
              BuildShimmerLine(height: 0.02.h, width: 0.3.w),
              SizedBox(height: 0.03.h),
              const BuildShimmerDetailsRowLine()
            ],
          ),
        ),
      ],
    );
  }
}
