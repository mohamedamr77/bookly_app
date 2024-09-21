import 'package:booklyapp/core/helper/api_service.dart';
import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/feature/home/data/repo/home_implement.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:booklyapp/feature/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:booklyapp/feature/splash/presentation/view/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'core/utils/const_variables.dart';

void main() {
  setupGetIt();
  debugPrint("${HomeImplement(ApiService(dio: Dio())).fetchNewestBooks()}");
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) =>
          FeaturedBooksCubit(
              getIt<HomeImplement>()
           ),
    ),
    BlocProvider(
      create: (context) => NewestBooksCubit(
        getIt<HomeImplement>()
      ),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        wd = constraints.maxWidth;
        ht = constraints.maxHeight;
        return MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColor.primaryColor,
          ),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationManager.navigationKey,
          routes: AppRouter.routes,
          initialRoute: SplashView.id,
        );
      },
    );
  }
}
