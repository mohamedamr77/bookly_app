import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor:  AppColor.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home:  const SplashView(),
    );
  }
}
