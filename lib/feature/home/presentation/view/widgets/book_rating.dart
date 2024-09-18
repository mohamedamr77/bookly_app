import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_color.dart';

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