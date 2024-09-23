import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class NameBook extends StatelessWidget {
  const NameBook({super.key, required this.nameBook});
 final String? nameBook;
  @override
  Widget build(BuildContext context) {
    return GText(
      color: AppColor.whiteColor,
      content: nameBook??"unKnown",
      fontSize: 0.07.w,
      fontFamily: "GTSectraFineRegular",
    );
  }
}
