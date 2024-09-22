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
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {

        if (state is NewestBooksLoadingState) {
          return _buildShimmerList();
        }

        if (state is NewestBooksSuccessState) {
          return _buildBooksList(context);
        }

        return _buildFaliureState();
      },
      listener: (context, state) {},
    );
  }

  /// Builds a shimmer effect list for loading state
  Widget _buildShimmerList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[600]!,
            highlightColor: Colors.grey[400]!,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.01.h, horizontal: 0.05.w),
              child: _buildShimmerItem(),
            ),
          );
        },
        childCount: 10, // Simulated shimmer items count
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Row(
      children: [
        Container(
          width: 0.23.w,
          height: 0.18.h,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(width: 0.05.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShimmerLine(height: 0.02.h),
              SizedBox(height: 0.03.h),
              _buildShimmerLine(height: 0.02.h, width: 0.3.w),
              SizedBox(height: 0.03.h),
              _buildShimmerDetails(),
            ],
          ),
        ),
      ],
    );
  }

  /// Creates a single shimmer line
  Widget _buildShimmerLine({double height = 0.02, double? width}) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// Builds shimmer details with multiple lines
  Widget _buildShimmerDetails() {
    return Row(
      children: [
        _buildShimmerLine(width: 0.2.w),
        const Spacer(),
        _buildShimmerLine(width: 0.12.w),
        SizedBox(width: 0.02.w),
        _buildShimmerLine(width: 0.12.w),
        SizedBox(width: 0.02.w),
      ],
    );
  }

  /// Builds the list of books once loaded successfully
  Widget _buildBooksList(BuildContext context) {
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
  Widget _buildFaliureState() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text("No books available"),
      ),
    );
  }
}
