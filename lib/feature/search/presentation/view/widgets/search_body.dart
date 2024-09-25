import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/app_images.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:booklyapp/feature/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:booklyapp/feature/search/presentation/view_model/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/shared_widget/custom_text.dart';
import '../../../../../core/shared_widget/custom_text_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {

    var cubit = BlocProvider.of<SearchCubit>(context);
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
          suffixIcon: const Icon(
            Icons.search,
            color: AppColor.whiteColor,
          ),
          // controller: cubit.searchController,
          onChanged: (value) {
            cubit.fetchSearchResult(category: value);
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.w, vertical: 0.02.h),
          child: const CustomText(
            text: "Search result :",
          ),
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (cubit.resultSearchList.isEmpty){
              return   Expanded(
                child: Center(
                  child: Lottie.asset(
                    "assets/lottie/search.json",
                   height: 0.4.h,
                    width: 0.8.w
                  ),
                ),
              );
            }
            return  const SearchResultListView();
          },
        ),

      ],
    );
  }
}
