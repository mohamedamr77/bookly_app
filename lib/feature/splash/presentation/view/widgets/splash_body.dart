import 'package:booklyapp/core/utils/app_images.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Center(
           child: Image(
             image: const AssetImage(AppImages.logo),
            width: 0.6.w,
             height: 0.2.h,
           ),
         ),
      ],
    );
  }
}
