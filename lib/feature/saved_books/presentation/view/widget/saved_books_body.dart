import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view/widgets/newest_list_view_item.dart';
import '../../view_model/saved_books_controller/saved_books_cubit.dart';

class SavedBooksBody extends StatelessWidget {
  const SavedBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SavedBooksCubit>(context);
    return BlocBuilder<SavedBooksCubit, SavedBooksState>(
      builder: (context, state) {
        List<BookModel> savedBook = cubit.savedBooksList.toSet().toList();
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      BestSellerListViewItem(bookModel: savedBook[index]),
                      Positioned(
                        top: 0.05.h,
                        right: 0.01.w,
                        child: IconButton(
                            onPressed: () {
                              cubit.changeSavedBookIcon(
                                  bookModel: savedBook[index]);
                              debugPrint(
                                  cubit.savedBooksList.length.toString());
                            },
                            icon: Icon(
                              Icons.bookmark_add_rounded,
                              color: savedBook[index].saveBook
                                  ? Colors.blue
                                  : Colors.white,
                              size: 0.08.w,
                            )),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => 0.02.ph,
                itemCount: savedBook.length,
              ),
            )
          ],
        );
      },
    );
  }
}
