import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmerFeaturedBooksList extends StatelessWidget {
  const BuildShimmerFeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.28.h,
      child: Shimmer.fromColors(
        enabled: BlocProvider.of<FeaturedBooksCubit>(context).loading,
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[400]!,
        direction: ShimmerDirection.ltr, // Left to right shimmer
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.only(left: 0.05.w)
                  : index == 9
                      ? EdgeInsets.only(right: 0.07.w)
                      : EdgeInsets.zero,
              child: Container(
                width: 0.4.w,
                height: 0.2.h,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 0.04.w,
          ),
          itemCount: 10, // Simulate 10 loading skeletons
        ),
      ),
    );
  }
}
