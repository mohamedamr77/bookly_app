import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class AuthorOfTheBook extends StatelessWidget {
  const AuthorOfTheBook({super.key});

  @override
  Widget build(BuildContext context) {
    return GText(
      color: AppColor.grayColor,
      content: "Rudyard Kipling",
      fontSize: 0.04.w,
      fontFamily: "MontserratSemiBold",
    );
  }
}
