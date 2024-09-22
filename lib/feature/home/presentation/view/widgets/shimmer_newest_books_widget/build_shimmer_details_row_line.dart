import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import 'build_shimmer_line.dart';

class BuildShimmerDetailsRowLine extends StatelessWidget {
  const BuildShimmerDetailsRowLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildShimmerLine(width: 0.2.w),
        const Spacer(),
        BuildShimmerLine(width: 0.12.w),
        SizedBox(width: 0.02.w),
        BuildShimmerLine(width: 0.12.w),
        SizedBox(width: 0.02.w),
      ],
    );
  }
}
