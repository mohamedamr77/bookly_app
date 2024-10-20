import 'package:booklyapp/core/shared_widget/global_text.dart';
import 'package:booklyapp/core/utils/app_images.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/home_body.dart';
import 'package:booklyapp/feature/home/presentation/view/widgets/offline_body.dart';
import 'package:booklyapp/feature/home/presentation/view_model/internet_home/internet_home_state.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/utils/app_color.dart';
import '../../../saved_books/presentation/view/saved_books_screen.dart';
import '../../../search/presentation/view/search_view.dart';
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
    BlocProvider.of<SavedBooksCubit>(context).fetchSavedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Image(
          image: const AssetImage(
            AppImages.logo,
          ),
          width: 0.27.w,
          height: 0.1.h,
        ),
        actions: [
          IconButton(
              onPressed: () {
                NavigationManager.push(SearchView.id);
              },
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 0.07.w,
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            0.04.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04.w),
              child: Card(
                color: Colors.white10,
                child: ListTile(
                  onTap: () {
                    NavigationManager.push(SavedBooksScreen.id);
                  },
                  title: GText(
                    color: AppColor.whiteColor,
                    content: 'Saved Books',
                    fontSize: 0.06.w,
                    fontFamily: "GTSectraFineRegular",
                  ),
                  leading: const Icon(Icons.menu_book),
                ),
              ),
            )
          ],
        ),
      ),
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

  void checkConnectInternet() {
    BlocProvider.of<InternetHomeCubit>(context).connectWithInternet();
  }
}
