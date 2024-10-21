abstract class NewestBooksState {}

class NewestBooksInitialState extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksFaliureState extends NewestBooksState {
  final String errorMessage;
  NewestBooksFaliureState({required this.errorMessage});
}

class NewestBooksSuccessState extends NewestBooksState {}
class NewestBooksPaginationLoadingState extends NewestBooksState {}
class NewestBooksPaginationFaliureState extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationFaliureState({required this.errorMessage});

}

