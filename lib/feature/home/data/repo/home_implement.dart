import 'package:booklyapp/core/error/faliure.dart';
import 'package:booklyapp/core/helper/api_service.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/data/repo/home_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeImplement implements HomeRepo {
  final ApiService apiService;
  HomeImplement(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var response = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=subject:art&Sorting=newest");
      List<dynamic> booksFromApi = response["items"];
      List<BookModel> booksList = [];
      for (int i = 0; i < booksFromApi.length; i++) {
        booksList.add(BookModel.fromJson(booksFromApi[i]));
      }
      debugPrint(booksList.toString());
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var response = await apiService.get(
          endpoint: "volumes?Filtering=free-ebooks&q=subject:programming");
      debugPrint(response.toString());
      List<dynamic> booksFromApi = response["items"];
      List<BookModel> booksList = [];
      for (int i = 0; i < booksFromApi.length; i++) {
        booksList.add(BookModel.fromJson(booksFromApi[i]));
      }
      debugPrint(booksList.toString());
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        debugPrint(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> connectWithInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection
      return Left(ServerFailure(errorMessage: 'No Internet connectivity'));
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      // Connected to WiFi
      return const Right(null); // Return success
    }
    else if (connectivityResult == ConnectivityResult.mobile) {
      // Connected to Mobile Data
      return const Right(null); // Return success
    }
    else if (connectivityResult == ConnectivityResult.ethernet) {
      // Connected to Ethernet
      return const Right(null); // Return success
    }
    else {
      // Handle other cases like Bluetooth, etc. if needed
      return const Right(null); // Return success for any other connection
    }
  }
}
