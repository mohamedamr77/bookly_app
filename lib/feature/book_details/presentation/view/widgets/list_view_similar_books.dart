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
      builder: (BuildContext context, SimilarBooksState state) {
        if (state is SimilarBooksFaliureState) {
          return const Text('Failed to load similar books');
        }
        if (state is SimilarBooksSuccessState) {
          return itemSimilarBooksSuccess(state: state);
        }
        return shimmerSimilarBooksLoading();
      },
    );
  }

  Widget shimmerSimilarBooksLoading() {
    return SizedBox(
      height: 0.2.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[600]!,
            highlightColor: Colors.grey[400]!,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.01.h),
              child: Container(
                width: 0.23.w,
                height: 0.18.h,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return 0.03.pw;
        },
        itemCount: 10,
      ),
    );
  }

  Widget itemSimilarBooksSuccess({required state}) {
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
}
