import 'package:booklyapp/core/navigation/navigation_manager.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_cubit.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/shared_widget/custom_appbar.dart';
import '../../../../../core/utils/app_color.dart';

class AppbarBookDetails extends StatelessWidget {
  const AppbarBookDetails({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBooksCubit, SavedBooksState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 0.07.w, right: 0.07.w, top: 0.01.h),
          child: CustomAppbar(
            leading: IconButton(
              onPressed: () {
                NavigationManager.goBack();
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                color: AppColor.whiteColor,
                size: 0.08.w,
              ),
            ),
            action: IconButton(
                onPressed: () {
                  BlocProvider.of<SavedBooksCubit>(context).changeSavedBookIcon(bookModel: bookModel);
                  debugPrint( BlocProvider.of<SavedBooksCubit>(context).savedBooksList.length.toString());
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 0.08.w,
                )),
          ),
        );
      },
    );
  }
}