import 'package:booklyapp/feature/home/presentation/view/widgets/home_body.dart';
import 'package:booklyapp/feature/home/presentation/view_model/internet_home/internet_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/internet_home/internet_home_cubit.dart';

class HomeView extends StatefulWidget {
  static const id = '/HomeView';

  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Call the internet connectivity check in initState
    BlocProvider.of<InternetHomeCubit>(context).connectWithInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetHomeCubit, InternetHomeState>(
        builder: (context, state) {
          if (state is InternetHomeFaliureState) {
            return const Center(
              child: Text('Failed to load data. Please check your internet connection.'),
            );
          }
          if (state is InternetHomeSuccessState) {
            return const HomeBody();
          }
          return const Center(
            child: CircularProgressIndicator(), // Show loading while checking internet
          );
        },
      ),
    );
  }
}

