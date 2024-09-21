import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class ListViewLikeBooks extends StatelessWidget {
  const ListViewLikeBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.2.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: index == 0
                  ? EdgeInsets.only(left: 0.05.w)
                  : index == 9
                      ? EdgeInsets.only(right: 0.07.w)
                      : EdgeInsets.zero,
              child: Image(
                image: const AssetImage(
                  AppImages.testBook2Image,
                ),
                width: 0.26.w,
                height: 0.1.h,
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 0.03.w,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
