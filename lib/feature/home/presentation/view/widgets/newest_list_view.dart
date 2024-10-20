import 'package:booklyapp/core/error/print_faliure.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/shimmer_newest_books_widget/build_shimmer_list.dart';
import 'package:booklyapp/feature/home/presentation/view_model/newest_books/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../saved_books/presentation/view_model/saved_books_controller/saved_books_cubit.dart';
import '../../view_model/newest_books/newest_books_cubit.dart';
import 'newest_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
      savedBookList: BlocProvider.of<SavedBooksCubit>(context).savedBooksList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoadingState) {
          return const BuildShimmerList();
        }

        if (state is NewestBooksSuccessState) {
          return _buildBooksNewestList(context);
        }

        if (state is NewestBooksFaliureState) {
          return _buildFaliureState(errorMessage: state.errorMessage);
        }
        return const SizedBox
            .shrink(); // Placeholder until the state is updated
      },
      listener: (context, state) {},
    );
  }

  /// Builds the list of books once loaded successfully
  Widget _buildBooksNewestList(BuildContext context) {
    var cubit = BlocProvider.of<NewestBooksCubit>(context);
    List<BookModel> books = cubit.newestBooksList;
    PrintFailure.errorMessage(message: books.length.toString());

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              BestSellerListViewItem(bookModel: books[index]),
              SizedBox(height: 0.01.h), // Space between items
            ],
          );
        },
        childCount: books.length,
      ),
    );
  }

  /// Displays an empty state if no books are available
  Widget _buildFaliureState({required String? errorMessage}) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(errorMessage!),
      ),
    );
  }
}
