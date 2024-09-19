import 'package:booklyapp/core/navigation/navigation_manager.dart';
import 'package:booklyapp/feature/home/presentation/view/home_view.dart';
import 'package:booklyapp/feature/splash/presentation/view/widgets/slider_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logo_splach.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    closeController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LogoSplash(),
        SlidingText(
          slidingAnimation: slidingAnimation,
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: const Offset(0, -1))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        NavigationManager.push(HomeView.id);
      },
    );
  }

  void closeController() {
    animationController.dispose();
  }
}
