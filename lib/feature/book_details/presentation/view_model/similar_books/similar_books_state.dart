import '../../../../home/data/model/book_model.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitialState extends SimilarBooksState {}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> similarBooks;
  SimilarBooksSuccessState({required this.similarBooks});
}

class SimilarBooksFaliureState extends SimilarBooksState {
  final String errorMessage;
  SimilarBooksFaliureState({required this.errorMessage});
}
