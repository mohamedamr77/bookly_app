import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class CustomImageBookDetails extends StatelessWidget {
  const CustomImageBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 0.45.w,
      height: 0.32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(AppImages.lionRed),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
