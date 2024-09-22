import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return null;

            // return const BestSellerListViewItem();
          },
          separatorBuilder: (context, index) {
            return 0.02.ph;
          },
          itemCount: 10),
    );
  }
}
