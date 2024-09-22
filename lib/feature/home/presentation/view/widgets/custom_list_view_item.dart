import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../book_details/presentation/view/book_details_view.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetailsScreen();
      },
      child: Container(
          width: 0.4.w,
          height: 0.2.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:  DecorationImage(
              image: NetworkImage(bookModel.volumeInfo!.imageLinks!.thumbnail!),
              fit: BoxFit.fill,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 0.02.w, bottom: 0.01.h),
              child: CircleAvatar(
                radius: 0.06.w,
                backgroundColor: AppColor.grayColor.withOpacity(0.2),
                child: const Icon(Icons.play_arrow),
              ),
            ),
          )),
    );
  }

  void navigateToDetailsScreen() {
    NavigationManager.push(BookDetailsView.id);
  }
}
