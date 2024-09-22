import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/shimmer_featured_books_widget/shimmer_featured_book_item.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FeaturedBooksCubit>(context);
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        List<BookModel> books = cubit.featuredBooksList;

        // Show skeleton loading when in the loading state
        if (state is FeaturedBooksLoadingState) {
          return SizedBox(
            height: 0.28.h,
            child: Shimmer.fromColors(
              enabled: cubit.loading,
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
                    child: const ShimmerFeaturedBookItem(),
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

        // Show the actual list when data is fetched successfully
        return SizedBox(
          height: 0.28.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(left: 0.05.w)
                    : index == books.length - 1
                        ? EdgeInsets.only(right: 0.07.w)
                        : EdgeInsets.zero,
                child: CustomListViewItem(bookModel: books[index]),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 0.04.w,
            ),
            itemCount: books.length,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
