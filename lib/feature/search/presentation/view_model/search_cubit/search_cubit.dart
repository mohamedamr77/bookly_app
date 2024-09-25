import 'package:booklyapp/feature/search/data/repo/search_repo.dart';
import 'package:booklyapp/feature/search/presentation/view_model/search_cubit/search_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/model/book_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());


  final SearchRepo searchRepo;
   List<BookModel> resultSearchList=[];

  bool loading = false;

  fetchSearchResult({required String category}) async {
    loading = true;
    var result = await searchRepo.fetchSearchResult(category: category);
    emit(SearchLoadingState());
    result.fold((error) {
      debugPrint(error.errorMessage);
      loading = false;
      emit(SearchFaliureState(errorMessage: error.errorMessage));
      print(error.errorMessage);
    }, (right) {
      loading = false;
      resultSearchList=right;
      print("list $resultSearchList}");
      emit(SearchSuccessState());
    });
  }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';
import 'package:news_api_cycle_8/features/home/data/repos/home_Repo.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(
      {
        required this.homeRepo
      }
      ) : super(GetSearchInitialState());


  final HomeRepo  homeRepo;



  List<NewModel> searchNews = [] ;

  Future<void>     getSearch(
      {
      required  String q
      }
      )  async{
    print("start get top headline");
    emit(GetSearchLoadingState());
    var result  = await homeRepo.searchForNews(
    q: q,
    );
    result.fold( ( left) {
      print("result is: ${left.message}   ");

      emit(GetSearchFailureState(
          errorMessage: left.message
      ));

    },(right) {
      searchNews = right;

      emit(GetSearchSuccessState());

    } );

  }






}
 */