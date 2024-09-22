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
  void initState() {
    super.initState();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewestBooksCubit>(context);
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoadingState) {
          // Show shimmer effect when loading
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[600]!,
                  highlightColor: Colors.grey[400]!,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.01.h, horizontal: 0.05.w),
                    child: Row(
                      children: [
                        Container(
                          width: 0.23.w,
                          height: 0.18.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[600], // Simulated book card
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        0.05.pw,
                         Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 0.02.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600], // Simulated book card
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              0.03.ph,
                              Container(
                                height: 0.02.h,
                                width: 0.3.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600], // Simulated book card
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              0.03.ph,
                              Row(
                                children: [
                                  Container(
                                    height: 0.02.h,
                                    width: 0.2.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[600], // Simulated book card
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 0.02.h,
                                    width: 0.12.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[600], // Simulated book card
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  0.02.pw,
                                  Container(
                                    height: 0.02.h,
                                    width: 0.12.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[600], // Simulated book card
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  0.02.pw,
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                );
              },
              childCount: 10, // Simulate 10 loading items
            ),
          );
        }

        if (state is NewestBooksSuccessState) {
          // Show actual list of books when loaded
          List<BookModel> books = cubit.newestBooksList;
          PrintFailure.errorMessage(message: books.length.toString());
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    BestSellerListViewItem(bookModel: books[index]),
                    SizedBox(
                      height: 0.01.h, // Space between items
                    ),
                  ],
                );
              },
              childCount: books.length,
            ),
          );
        }

        // Show empty container or error message if no books loaded
        return const SliverToBoxAdapter(
          child: Center(
            child: Text("No books available"), // Placeholder for error/empty state
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
