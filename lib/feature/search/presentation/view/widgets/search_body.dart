import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/custom_text.dart';
import '../../../../../core/shared_widget/custom_text_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        0.03.ph,
        CustomTextField(
          focusBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueAccent,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColor.whiteColor.withOpacity(0.4),
          )),
          hintText: 'search',
          suffixIcon: Icon(
            Icons.search,
            color: AppColor.whiteColor,
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 0.06.w,vertical: 0.02.h),
          child: const CustomText(text: "Search result :",),
        ),
        const SearchResultListView(),
      ],
    );
  }
}
