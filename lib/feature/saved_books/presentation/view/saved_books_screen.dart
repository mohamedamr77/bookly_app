import 'package:booklyapp/core/navigation/navigation_manager.dart';
import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/saved_books/presentation/view/widget/saved_books_body.dart';
import 'package:flutter/material.dart';

class SavedBooksScreen extends StatelessWidget {
  static const String id = "/SavedBooksScreen";
  const SavedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                NavigationManager.goBack();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 0.08.w,
              )),
          title: GText(
            color: AppColor.whiteColor,
            content: "Saved Books",
            fontSize: 0.07.w,
            fontFamily: "GTSectraFineRegular",
          )),
      body: const SavedBooksBody(),
    );
  }
}
