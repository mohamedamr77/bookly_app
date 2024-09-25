import 'package:booklyapp/core/shared_function/launch_url.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/price_of_book.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class RowOfPrice extends StatelessWidget {
  const RowOfPrice({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PriceOFBook(
          text: "free",
          onTap: () {},
          color: const Color(0xffE5EBF1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.04.w),
            bottomLeft: Radius.circular(0.04.w),
          ),
          colorText: AppColor.blackColor,
        ),
        PriceOFBook(
            text: getText(bookModel: bookModel),
            onTap: () {
              launchCustomUrl(
                  url: bookModel.volumeInfo!.previewLink!, context: context);
            },
            color: const Color(0xffEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0.04.w),
              bottomRight: Radius.circular(0.04.w),
            ),
            colorText: AppColor.whiteColor),
      ],
    );
  }

  String getText({required BookModel bookModel}) {
    if (bookModel.volumeInfo!.previewLink == null) {
      return "Not available";
    } else {
      return "preview";
    }
  }
}
