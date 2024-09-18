import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 0.4.w,
        height: 0.2.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage(AppImages.testImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 0.02.w, bottom: 0.01.h),
            child: CircleAvatar(
              radius: 0.06.w,
              backgroundColor: AppColor.grayColor.withOpacity(0.2),
              child: const Icon(Icons.play_arrow),
            ),
          ),
        ));
  }
}
