import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: const AssetImage(AppImages.logo),
        width: 0.6.w,
        height: 0.2.h,
      ),
    );
  }
}
