import 'package:booklyapp/core/utils/app_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/row_of_price.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/custom_text.dart';
import 'appbar_book_details.dart';
import 'author_of_the_book.dart';
import 'custom_image_book_details.dart';
import 'list_view_similar_books.dart';
import 'name_book.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppbarBookDetails(),
          0.02.ph,
          CustomImageBookDetails(
            image: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
          0.03.ph,
          NameBook(
            nameBook: bookModel.volumeInfo!.title,
          ),
          0.02.ph,
          AuthorOfTheBook(
            author: bookModel.volumeInfo?.authors != null &&
                    bookModel.volumeInfo!.authors!.isNotEmpty
                ? bookModel.volumeInfo!.authors![0]
                : "Unknown Author",
          ),
          0.02.ph,
          BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            averageRating: bookModel.volumeInfo?.averageRating != null
                ? bookModel.volumeInfo!.averageRating!.toString().trim()
                : "N/A", // Default value when averageRating is null
            ratingsCount: bookModel.volumeInfo?.ratingsCount != null
                ? bookModel.volumeInfo!.ratingsCount!.toString().trim()
                : "0", // Default value when ratingsCount is null
          ),
          0.02.ph,
          RowOfPrice(
            bookModel: bookModel,
          ),
          0.04.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.06.w),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: AppText.youCanAlsoLike,
              ),
            ),
          ),
          0.02.ph,
          ListViewLikeBooks(
            bookModel: bookModel,
          ),
          0.02.ph,
        ],
      ),
    );
  }
}
