import 'package:booklyapp/feature/home/presentation/view/widgets/body_featured_book_success.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/shimmer_featured_books_widget/build_shimmer_featured_books_list.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoadingState) {
          return const BuildShimmerFeaturedBooksList();
        }
        if (state is FeaturedBooksSuccessState) {
          return bodyFeaturedBooksSuccessState(context: context);
        }
        return const SizedBox();
      },
      listener: (context, state) {},
    );
  }
}
