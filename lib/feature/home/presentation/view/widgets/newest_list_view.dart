import 'package:booklyapp/core/error/print_faliure.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view_model/newest_books/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../view_model/newest_books/newest_books_cubit.dart';
import 'newest_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {

  @override
  void initState(){
    super.initState();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
}

@override
  Widget build(BuildContext context) {
    var cubit=   BlocProvider.of<NewestBooksCubit>(context);
    return BlocConsumer<NewestBooksCubit,NewestBooksState>(
        builder: (context, state) {
          List<BookModel> books= cubit.newestBooksList;
          PrintFailure.errorMessage(message: books.length.toString());
         return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    BestSellerListViewItem(bookModel: books[index],),
                    SizedBox(
                      height: 0.01.h,
                    ),
                  ],
                );
              },
              childCount: books.length,
            ),
          );
        },

        listener: (context, state) {

        },
    );
  }
}
