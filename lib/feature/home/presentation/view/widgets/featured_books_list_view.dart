 import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.only(left: 0.05.w)
                  : index == 9
                      ? EdgeInsets.only(right: 0.07.w)
                      : EdgeInsets.zero,
              child: const CustomListViewItem(),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 0.04.w,
              ),
          itemCount: 10),
    );
  }
}
