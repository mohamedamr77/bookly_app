import 'package:booklyapp/core/helper/api_service.dart';
import 'package:booklyapp/feature/search/data/repo/search_implement.dart';
import 'package:booklyapp/feature/search/presentation/view/widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  static const id = '/SearchView';

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchImplement(ApiService())),
      child: const Scaffold(
        body: SafeArea(child: SearchBody()),
      ),
    );
  }
}
