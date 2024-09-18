import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.05.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.04.w),
            child: Image(
              image: const AssetImage(AppImages.bookTestImage),
              width: 0.23.w,
              height: 0.18.h,
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
                  content: AppText.nameBookHarryPotter,
                  fontSize: 0.05.w,
                  fontFamily: "GTSectraFineRegular",
                  fontWeight: FontWeight.normal,
                ),
                0.01.ph,
                GText(
                  color: AppColor.grayColor,
                  content: "J.K. Rowling",
                  fontSize: 0.035.w,
                  fontFamily: "MontserratSemiBold",
                ),
                0.01.ph,
                Row(
                  children: [
                    Expanded(
                      child: GText(
                        color: AppColor.whiteColor,
                        content: "19.99 €",
                        fontSize: 0.05.w,
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                    const BookRating(),
                    0.04.pw,
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColor.goldColor,
        ),
        0.01.pw,
        GText(
          color: AppColor.whiteColor,
          content: "4.8",
          fontSize: 0.045.w,
          fontFamily: "MontserratSemiBold",
          maxLines: 2,
        ),
        0.02.pw,
        GText(
          color: AppColor.grayColor,
          content: "(2390)",
          fontSize: 0.04.w,
          fontFamily: "MontserratSemiBold",
        ),
      ],
    );
  }
}
