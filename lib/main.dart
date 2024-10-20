import 'package:booklyapp/core/utils/app_color.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/feature/home/data/repo/home_implement.dart';
import 'package:booklyapp/feature/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:booklyapp/feature/home/presentation/view_model/internet_home/internet_home_cubit.dart';
import 'package:booklyapp/feature/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:booklyapp/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'core/utils/const_variables.dart';
import 'feature/home/data/model/Epub/Epub_model.dart';
import 'feature/home/data/model/Pdf/pdf_model.dart';
import 'feature/home/data/model/access_info/access_info_model.dart';
import 'feature/home/data/model/book_model.dart';
import 'feature/home/data/model/image_links/image_links_model.dart';
import 'feature/home/data/model/industry_identifier/industry_identifier_model.dart';
import 'feature/home/data/model/panelization_summary/panelization_summary_model.dart';
import 'feature/home/data/model/reading_modes/reading_modes_model.dart';
import 'feature/home/data/model/sale_info/sale_info_model.dart';
import 'feature/home/data/model/volume_info/volume_info_model.dart';

void main() async{
  setupGetIt();
  await Hive.initFlutter();
  Hive.registerAdapter(AccessInfoAdapter());
  Hive.registerAdapter(EpubAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  Hive.registerAdapter(IndustryIdentifierAdapter());
  Hive.registerAdapter(PanelizationSummaryAdapter());
  Hive.registerAdapter(PdfAdapter());
  Hive.registerAdapter(ReadingModesAdapter());
  Hive.registerAdapter(SaleInfoAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(BookModelAdapter());

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) =>
          FeaturedBooksCubit(getIt<HomeImplement>())..fetchFeaturedBooks(),
    ),
    BlocProvider(
      create: (context) =>
          NewestBooksCubit(getIt<HomeImplement>())..fetchNewestBooks(),
    ),
    BlocProvider(
      create: (context) => InternetHomeCubit(getIt<HomeImplement>()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        wd = constraints.maxWidth;
        ht = constraints.maxHeight;
        return MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColor.primaryColor,
          ),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationManager.navigationKey,
          routes: AppRouter.routes,
          initialRoute: SplashView.id,
        );
      },
    );
  }
}
