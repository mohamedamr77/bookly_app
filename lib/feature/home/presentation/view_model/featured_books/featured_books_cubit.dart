import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/error/print_faliure.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/data/repo/home_repo.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_state.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/faliure.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitialState());
  List<BookModel> featuredBooksList = [];
  final HomeRepo homeRepo;
  bool loading = false;
  fetchFeaturedBooks() async {
    loading = true;
    emit(FeaturedBooksLoadingState());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchFeaturedBooks();
    result.fold((faliure) {
      loading = false;
      PrintFailure.errorMessage(message: "the error featured books  $faliure ");
      emit(FeaturedBooksFaliureState(errorMessage: faliure.errorMessage));
    }, (success) {
      loading = false;
      featuredBooksList = success;
      emit(FeaturedBooksSuccessState());
    });
  }
}
