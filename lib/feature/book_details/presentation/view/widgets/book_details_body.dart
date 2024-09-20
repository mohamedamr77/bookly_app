import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/row_of_price.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'appbar_book_details.dart';
import 'custom_image_book_details.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppbarBookDetails(),
        0.02.ph,
        const CustomImageBookDetails(),
        0.06.ph,
        GText(
          color: AppColor.whiteColor,
          content: "The Jungle Book",
          fontSize: 0.07.w,
          fontFamily: "GTSectraFineRegular",
        ),
        0.02.ph,
        GText(
          color: AppColor.grayColor,
          content: "Rudyard Kipling",
          fontSize: 0.04.w,
          fontFamily: "MontserratSemiBold",
        ),
        0.02.ph,
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        0.02.ph,
        const RowOfPrice(),
      ],
    );
  }
}
