import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/shimmer_featured_books_widget/shimmer_featured_book_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../book_details/presentation/view/book_details_view.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetailsScreen();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:  CachedNetworkImage(
          fit: BoxFit.fill,
          width: 0.4.w,
          height: 0.2.h,
          imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
          const ShimmerFeaturedBookItem(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  void navigateToDetailsScreen() {
    NavigationManager.push(BookDetailsView.id);
  }
}
/*
Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 0.02.w, bottom: 0.01.h),
              child: CircleAvatar(
                radius: 0.06.w,
                backgroundColor: AppColor.grayColor.withOpacity(0.2),
                child: const Icon(Icons.play_arrow),
              ),
            ),
          )
 */