import 'package:booklyapp/feature/home/data/repo/home_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../helper/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
      ApiService(dio: Dio())
  );
  getIt.registerSingleton<HomeImplement>(
      (HomeImplement(getIt<ApiService>())
      )
  );
}
