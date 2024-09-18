import 'package:booklyapp/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
         Image(
           image: AssetImage(AppImages.logo),

         ),
      ],
    );
  }
}
