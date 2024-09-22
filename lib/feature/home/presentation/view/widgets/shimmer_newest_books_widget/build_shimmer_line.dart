import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class BuildShimmerLine extends StatelessWidget {
  const BuildShimmerLine({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.02.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
