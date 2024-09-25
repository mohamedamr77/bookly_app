import 'package:booklyapp/core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import '../../../home/data/model/book_model.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String category});
}
