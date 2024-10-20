import 'package:booklyapp/core/error/faliure.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/helper/api_service.dart';

class SearchImplement implements SearchRepo {
  final ApiService apiService;
  SearchImplement(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String category}) async {
    try {
      var response = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance");
      debugPrint(response.toString());
      List<dynamic> booksFromApi = response["items"];
      List<BookModel> booksList = [];
      for (int i = 0; i < booksFromApi.length; i++) {
        booksList.add(BookModel.fromJson(booksFromApi[i]));
      }

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
}
