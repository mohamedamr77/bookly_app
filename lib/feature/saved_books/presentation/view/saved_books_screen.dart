import 'package:booklyapp/feature/saved_books/presentation/view/saved_books_body.dart';
import 'package:flutter/material.dart';

class SavedBooksScreen extends StatelessWidget {
  static const String id ="/SavedBooksScreen";
  const SavedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SavedBooksBody(),
    );
  }
}
