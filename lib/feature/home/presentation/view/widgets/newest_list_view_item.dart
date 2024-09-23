import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../book_details/presentation/view/book_details_view.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.05.w),
      child: GestureDetector(
        onTap: () {
          navigateToDetailsScreen();
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.04.w),
              child: CachedNetworkImage(
                width: 0.23.w,
                height: 0.18.h,
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    '', // Fallback to empty string if null
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Shimmer.fromColors(
                  baseColor: Colors.grey[600]!,
                  highlightColor: Colors.grey[400]!,
                  child: Container(
                    width: 0.23.w,
                    height: 0.18.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                    Icons.error), // Shows error icon if imageUrl is invalid
              ),
            ),
            0.05.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GText(
                    color: AppColor.whiteColor,
                    // content: AppText.nameBookHarryPotter,
                    content: bookModel.volumeInfo!.title!.trim(),
                    fontSize: 0.05.w,
                    fontFamily: "GTSectraFineRegular",
                    fontWeight: FontWeight.normal,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  0.01.ph,
                  GText(
                    color: AppColor.grayColor,
                    content: bookModel.volumeInfo?.authors != null &&
                            bookModel.volumeInfo!.authors!.isNotEmpty
                        ? bookModel.volumeInfo!.authors![0]
                        : "Unknown Author",
                    fontSize: 0.035.w,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "MontserratSemiBold",
                  ),
                  0.01.ph,
                  Row(
                    children: [
                      Expanded(
                        child: GText(
                          color: AppColor.whiteColor,
                          content: "Free",
                          fontSize: 0.05.w,
                          fontFamily: "MontserratSemiBold",
                        ),
                      ),
                      BookRating(
                        averageRating: bookModel.volumeInfo?.averageRating !=
                                null
                            ? bookModel.volumeInfo!.averageRating!
                                .toString()
                                .trim()
                            : "N/A", // Default value when averageRating is null
                        ratingsCount: bookModel.volumeInfo?.ratingsCount != null
                            ? bookModel.volumeInfo!.ratingsCount!
                                .toString()
                                .trim()
                            : "0", // Default value when ratingsCount is null
                      ),
                      0.04.pw,
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetailsScreen() {
    NavigationManager.push(
      BookDetailsView.id,
      arguments: bookModel,
    );
  }
}
