import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/view/widgets/shimmer_featured_books_widget/shimmer_featured_book_item_blace_holder.dart';

class SimilarBooksItem extends StatelessWidget {
  const SimilarBooksItem(
      {super.key, required this.index, required this.bookModel});
  final int index;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? EdgeInsets.only(left: 0.05.w)
          : index == 9
              ? EdgeInsets.only(right: 0.07.w)
              : EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          width: 0.26.w,
          height: 0.1.h,
          imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? "",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ShimmerFeaturedBookItem(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

/*
ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
           width: 0.26.w,
          height: 0.1.h,
          imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail??"",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ShimmerFeaturedBookItem(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
 */
