import 'package:booklyapp/feature/search/presentation/view/widgets/search_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  static const id='/SearchView';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchBody(),
    );
  }
}
