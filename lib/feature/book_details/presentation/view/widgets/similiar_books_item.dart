import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class SimilarBooksItem extends StatelessWidget {
  const SimilarBooksItem({super.key, required this.index, required this.bookModel});
  final int index;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: index == 0
            ? EdgeInsets.only(left: 0.05.w)
            : index == 9
            ? EdgeInsets.only(right: 0.07.w)
            : EdgeInsets.zero,
        child: Image(
          image:  NetworkImage( bookModel.volumeInfo!.imageLinks!.thumbnail??"",),
          width: 0.26.w,
          height: 0.1.h,
        ));
  }
}
