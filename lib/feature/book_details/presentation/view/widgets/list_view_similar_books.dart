import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/similiar_books_item.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../view_model/similar_books/similar_books_cubit.dart';
import '../../view_model/similar_books/similar_books_state.dart';

class ListViewLikeBooks extends StatelessWidget {
  const ListViewLikeBooks({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: 0.2.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SimilarBooksItem(
                  index: index,
                  bookModel: state.similarBooks[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 0.03.w,
                );
              },
              itemCount: state.similarBooks.length,
            ),
          );
        }

        return const SizedBox();
      },
    );

  }
}
