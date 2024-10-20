import 'package:booklyapp/core/utils/app_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_widget/custom_text.dart';
import 'newest_list_view.dart';
import 'featured_books_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
              savedBookList:
                  BlocProvider.of<SavedBooksCubit>(context).savedBooksList,
            );
          },
        );
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: 0.02.ph,
          ),
          const SliverToBoxAdapter(child: FeaturedBooksListView()),
          SliverToBoxAdapter(
            child: 0.04.ph,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 0.05.w),
              child: const CustomText(
                text: AppText.bestSeller,
              ),
            ),
          ),
          const BestSellerListView(),
        ],
      ),
    ));
  }
}
