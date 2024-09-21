abstract class FeaturedBooksState {}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksFaliureState extends FeaturedBooksState {
  final String errorMessage;
  FeaturedBooksFaliureState({required this.errorMessage});
}

class FeaturedBooksSuccessState extends FeaturedBooksState {}
