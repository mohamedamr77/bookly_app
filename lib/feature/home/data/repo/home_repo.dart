import 'package:booklyapp/core/error/faliure.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
   Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
   Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
}