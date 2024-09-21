import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GText(
      color: AppColor.whiteColor,
      content: text,
      fontSize: 0.05.w,
      fontFamily: "MontserratSemiBold",
    );
  }
}
