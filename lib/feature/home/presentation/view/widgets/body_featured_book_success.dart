import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/book_model.dart';
import '../../view_model/featured_books/featured_books_cubit.dart';

Widget bodyFeaturedBooksSuccessState({required BuildContext context}) {
  List<BookModel> books =
      BlocProvider.of<FeaturedBooksCubit>(context).featuredBooksList;
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
}
