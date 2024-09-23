import 'package:booklyapp/core/helper/api_service.dart';
import 'package:booklyapp/feature/book_details/data/repo/book_details_implement.dart';
import 'package:booklyapp/feature/book_details/presentation/view/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/similar_books/similar_books_cubit.dart';

class BookDetailsView extends StatelessWidget {
  static const id = '/BookDetailsView';

  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocProvider(
        create: (context) => SimilarBooksCubit(BookDetailsImplement(ApiService()))..fetchSimilarBooks(category: "egypt"),
        child: const Scaffold(
          body: BookDetailsBody(),
        ),
      ),
    );
  }
}
