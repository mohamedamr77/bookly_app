import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/app_text.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import 'appbar_home.dart';
import 'best_seller_list_view.dart';
import 'featured_books_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: AppbarHome()),
        SliverToBoxAdapter(child:  0.02.ph,),
        const SliverToBoxAdapter(child: FeaturedBooksListView()),
        SliverToBoxAdapter(child:  0.04.ph,),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 0.05.w),
            child: GText(
              color: AppColor.whiteColor,
              content: AppText.bestSeller,
              fontSize: 0.05.w,
              fontFamily: "MontserratSemiBold",
            ),
          ),
        ),
        const BestSellerListView(),
      ],
      )
    );
  }
}
