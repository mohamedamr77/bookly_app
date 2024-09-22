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
  bool loading=false;
  fetchNewestBooks() async {
    loading=true;
    emit(NewestBooksLoadingState());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchFeaturedBooks();
    result.fold((faliure) {
      loading=false;
      emit(NewestBooksFaliureState(errorMessage: faliure.errorMessage));
    }, (success) {
      loading=false;
      newestBooksList = success;
      emit(NewestBooksSuccessState());
    });
  }
}
