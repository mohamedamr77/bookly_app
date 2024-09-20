import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/price_of_book.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class RowOfPrice extends StatefulWidget {
  const RowOfPrice({super.key});

  @override
  State<RowOfPrice> createState() => _RowOfPriceState();
}

class _RowOfPriceState extends State<RowOfPrice> {
  bool bookIsFree = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PriceOFBook(
          text: "19.99€",
          onTap: () {
            setState(() {
              bookIsFree = false;
            });
          },
          color:
              bookIsFree == false ? const Color(0xffEF8262) : Color(0xffE5EBF1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.04.w),
            bottomLeft: Radius.circular(0.04.w),
          ),
          colorText:bookIsFree == false
            ? AppColor.whiteColor:AppColor.blackColor ,
        ),
        PriceOFBook(
          text: "free",
          onTap: () {
            setState(() {
              bookIsFree = true;
            });
          },
          color: bookIsFree == true
              ? const Color(0xffEF8262)
              : const Color(0xffE5EBF1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.04.w),
            bottomRight: Radius.circular(0.04.w),
          ),
          colorText:bookIsFree == true
            ? AppColor.whiteColor:AppColor.blackColor ,
        ),
      ],
    );
  }
}
