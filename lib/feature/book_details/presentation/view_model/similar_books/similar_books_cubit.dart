import 'package:booklyapp/feature/book_details/data/repo/book_details_repo.dart';
import 'package:booklyapp/feature/book_details/presentation/view_model/similar_books/similar_books_state.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.bookDetailsRepo) : super(SimilarBooksInitialState());

  final BookDetailsRepo bookDetailsRepo;
  fetchSimilarBooks({required String category}) async {
    var result = await bookDetailsRepo.fetchSimilarBooks(category: category);
    emit(SimilarBooksLoadingState());
    result.fold((error) {
      debugPrint(error.errorMessage);
      emit(SimilarBooksFaliureState(errorMessage: error.errorMessage));
    }, (right) {
      emit(SimilarBooksSuccessState(similarBooks: right));
    });
  }
}
