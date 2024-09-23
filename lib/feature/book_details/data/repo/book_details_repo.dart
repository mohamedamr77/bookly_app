import 'package:booklyapp/core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import '../../../home/data/model/book_model.dart';

abstract class BookDetailsRepo{
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}