import 'package:booklyapp/core/utils/app_images.dart';
import 'package:booklyapp/core/utils/app_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/splash/presentation/view/widgets/slider_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logo_splach.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{

  late AnimationController animationController;

  late Animation<Offset> slidingAnimation;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds:900));
    slidingAnimation =
        Tween<Offset>(begin:  const Offset(0, 10), end:    Offset(0, -1)).
        animate(animationController);
        animationController.forward();
  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        const LogoSplash(),
        SlidingText(slidingAnimation: slidingAnimation,)
      ],
    );
  }
}


