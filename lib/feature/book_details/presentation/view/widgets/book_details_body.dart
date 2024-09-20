import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/app_images.dart';
import 'package:booklyapp/core/utils/app_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/row_of_price.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'appbar_book_details.dart';
import 'author_of_the_book.dart';
import 'custom_image_book_details.dart';
import 'list_view_like_books.dart';
import 'name_book.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppbarBookDetails(),
          0.02.ph,
          const CustomImageBookDetails(),
          0.03.ph,
          const NameBook(),
          0.02.ph,
          const AuthorOfTheBook(),
          0.02.ph,
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          0.02.ph,
          const RowOfPrice(),
          0.04.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.06.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GText(
                  color: AppColor.whiteColor,
                  content: AppText.youCanAlsoLike,
                  fontSize: 0.045.w,
                 fontFamily: "MontserratSemiBold",
              ),
            ),
          ),
          0.02.ph,
          const ListViewLikeBooks(),
          0.02.ph,
      
        ],
      ),
    );
  }
}
