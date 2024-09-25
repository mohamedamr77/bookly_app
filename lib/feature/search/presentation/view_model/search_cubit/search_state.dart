import '../../../../home/data/model/book_model.dart';

abstract class SearchState{}
class SearchInitialState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchFaliureState extends SearchState{
  final String errorMessage;
  SearchFaliureState({required this.errorMessage});
}
class SearchSuccessState extends SearchState{

}
