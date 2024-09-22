import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_color.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.averageRating,
      this.ratingsCount});
  final MainAxisAlignment? mainAxisAlignment;
  final String? averageRating;
  final String? ratingsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      children: [
        const Icon(
          Icons.star,
          color: AppColor.goldColor,
        ),
        0.01.pw,
        GText(
          color: AppColor.whiteColor,
          content: averageRating ?? "4.8 error",
          fontSize: 0.045.w,
          fontFamily: "MontserratSemiBold",
          maxLines: 2,
        ),
        0.02.pw,
        GText(
          color: AppColor.grayColor,
          content: "($ratingsCount)" ?? "",
          fontSize: 0.04.w,
          fontFamily: "MontserratSemiBold",
        ),
      ],
    );
  }
}
