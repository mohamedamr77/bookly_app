import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/faliure.dart';
import '../../../data/model/book_model.dart';
import '../../../data/repo/home_repo.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitialState());
  List<BookModel> newestBooksList = [];
  final HomeRepo homeRepo;
  bool loading = false;
  int startIndex=0;
  fetchNewestBooks({required List<BookModel> savedBookList}) async {
    loading = true;
    emit(NewestBooksLoadingState());
    Either<Failure, List<BookModel>> result = await homeRepo.fetchNewestBooks(startIndex: startIndex);
    result.fold((faliure) {
      loading = false;
      emit(NewestBooksFaliureState(errorMessage: faliure.errorMessage));
    }, (success) {
      loading = false;
      newestBooksList = success;

      newestBooksList = newestBooksList.map((bookItem) {
        if (savedBookList.any((savedBook) => savedBook.id == bookItem.id)) {
          bookItem.saveBook = true; // Assuming you have a `isNewsMarked` field
        }
        return bookItem;
      }).toList();
      emit(NewestBooksSuccessState());
    });
  }
}
