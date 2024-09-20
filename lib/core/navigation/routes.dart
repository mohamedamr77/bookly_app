import 'package:flutter/material.dart';

import '../../feature/book_details/presentation/view/book_details_view.dart';
import '../../feature/home/presentation/view/home_view.dart';
import '../../feature/search/presentation/view/search_view.dart';
import '../../feature/splash/presentation/view/splash_view.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    SplashView.id: (context) => const SplashView(),
    HomeView.id: (context) => const HomeView(),
    BookDetailsView.id: (context) => const BookDetailsView(),
    SearchView.id: (context) => const SearchView(),
  };
}
