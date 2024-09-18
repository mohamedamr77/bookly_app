import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/const_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        wd = constraints.maxWidth;
        ht = constraints.maxHeight;
        return GetMaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColor.primaryColor,

          ),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
