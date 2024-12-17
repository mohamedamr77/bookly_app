import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_images.dart';

class TitleAppBar extends StatefulWidget {
  const TitleAppBar({super.key});

  @override
  State<TitleAppBar> createState() => _TitleAppBarState();
}

class _TitleAppBarState extends State<TitleAppBar> {

  bool reverse = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween:
      reverse ?
      Tween<double>( begin: -10 , end: 10) :
      Tween<double>( begin: 10 , end: -10),
      onEnd: () {
        setState(() {
          reverse =!reverse;
        });
      },
      duration: const Duration(seconds: 1),
      child:  Image(
        image: const AssetImage(
          AppImages.logo,
        ),
        width: 0.27.w,
        height: 0.1.h,
      ),
      builder: (BuildContext context,  value, Widget? child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },

    );
  }
}