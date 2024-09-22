import 'package:booklyapp/feature/home/presentation/view/widgets/home_body.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/offline_body.dart';
import 'package:booklyapp/feature/home/presentation/view_model/internet_home/internet_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    checkConnectInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetHomeCubit, InternetHomeState>(
        builder: (context, state) {
          return _buildStateContent(state);
        },
        listener: (context, state) {
          if (state is InternetHomeFaliureState) {
            showToastFaliure(message: state.errorMessage);
          }
        },
      ),
    );
  }

  Widget _buildStateContent(InternetHomeState state) {
    if (state is InternetHomeFaliureState) {
      return const OfflineBody();
    } else if (state is InternetHomeSuccessState) {
      return const HomeBody();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  showToastFaliure({required message}) {
    return Fluttertoast.showToast(
      msg: message,
      fontSize: 16,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webShowClose: true,
    );
  }

  void checkConnectInternet(){
    BlocProvider.of<InternetHomeCubit>(context).connectWithInternet();
  }
}
