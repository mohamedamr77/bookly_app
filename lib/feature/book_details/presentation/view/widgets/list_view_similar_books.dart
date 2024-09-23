import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/similiar_books_item.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../home/presentation/view/widgets/shimmer_featured_books_widget/build_shimmer_featured_books_list.dart';
import '../../view_model/similar_books/similar_books_cubit.dart';
import '../../view_model/similar_books/similar_books_state.dart';

class ListViewLikeBooks extends StatefulWidget {
  const ListViewLikeBooks({super.key});

  @override
  State<ListViewLikeBooks> createState() => _ListViewLikeBooksState();
}

class _ListViewLikeBooksState extends State<ListViewLikeBooks> {


   @override
  void initState(){
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: "sport");
}

  @override
  Widget build(BuildContext context) {
     // List<BookModel> books = BlocProvider.of<SimilarBooksCubit>(context).similarBooks;
     //      debugPrint("similar books :${books.length}");
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoadingState) {
          return  SizedBox(
            height: 0.28.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[400]!,
              direction: ShimmerDirection.ltr, // Left to right shimmer
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 0.05.w)
                        : index == 9
                        ? EdgeInsets.only(right: 0.07.w)
                        : EdgeInsets.zero,
                    child: Container(
                      width: 0.4.w,
                      height: 0.2.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 0.04.w,
                ),
                itemCount: 10, // Simulate 10 loading skeletons
              ),
            ),
          );
        }
        if (state is SimilarBooksSuccessState){
          return SizedBox(
            height: 0.2.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SimilarBooksItem(index: index, bookModel:state.similarBooks[index],);
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
