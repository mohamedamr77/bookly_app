import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageBookDetails extends StatelessWidget {
  const CustomImageBookDetails({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.04.w),
      child: CachedNetworkImage(
        width: 0.45.w,
        height: 0.3.h,
        fit: BoxFit.fill,
        imageUrl: image ?? "", // Fallback to empty string if null
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Shimmer.fromColors(
          baseColor: Colors.grey[600]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            width: 0.45.w,
            height: 0.3.h,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
            const Icon(Icons.error), // Shows error icon if imageUrl is invalid
      ),
    );
  }
}
