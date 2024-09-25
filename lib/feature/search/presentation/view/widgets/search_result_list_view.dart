import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:booklyapp/feature/search/presentation/view_model/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view/widgets/newest_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
   var cubit= BlocProvider.of<SearchCubit>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                 return  BestSellerListViewItem(bookModel: cubit.resultSearchList[index],);
              },
              separatorBuilder: (context, index) {
                return 0.02.ph;
              },
              itemCount: cubit.resultSearchList.length,
          ),
        );
      },
    );
  }
}
