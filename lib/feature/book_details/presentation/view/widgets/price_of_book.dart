import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/global_text.dart';

class PriceOFBook extends StatelessWidget {
  const PriceOFBook(
      {super.key,
      required this.onTap,
      required this.borderRadius,
      required this.color,
      required this.text});
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        width: 0.3.w,
        height: 0.058.h,
        child: GText(color: Colors.black, content: text, fontSize: 0.04.w),
      ),
    );
  }
}
