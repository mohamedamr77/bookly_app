import 'package:booklyapp/core/error/faliure.dart';
import 'package:booklyapp/core/helper/api_service.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeImplement implements HomeRepo{
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async{
   try {
     var response=await ApiService(dio: Dio()).get(endpoint: "volumes?Filtering=free-ebooks&q=subject:horror&Sorting=newest");
      List<dynamic> booksFromApi=response["items"];
     List<BookModel> booksList=[];
     for (int i = 0; i < booksFromApi.length; i++) {
       booksList.add(BookModel.fromJson(booksFromApi[i]));
     }
     debugPrint(booksList.toString());
     return right(booksList);
   }
   catch (e){
     if (e is DioException){
       return left(ServerFailure.fromDioException(e));
     }
     else{
       return left(ServerFailure(errorMessage: e.toString()));
     }
   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      var response=await ApiService(dio: Dio()).get(endpoint: "volumes?Filtering=free-ebooks&q=subject:horror");
      List<dynamic> booksFromApi=response["items"];
      List<BookModel> booksList=[];
      for (int i = 0; i < booksFromApi.length; i++) {
        booksList.add(BookModel.fromJson(booksFromApi[i]));
      }
      debugPrint(booksList.toString());
      return right(booksList);
    }
    catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      else{
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

}