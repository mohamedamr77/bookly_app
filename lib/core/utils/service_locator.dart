import 'package:booklyapp/feature/home/data/repo/home_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../helper/api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeImplement>((HomeImplement(getIt<ApiService>())));
}
