import 'package:booklyapp/core/shared_widget/custom_appbar.dart';
import 'package:booklyapp/core/utils/app_images.dart';
import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 0.07.w, right: 0.07.w),
        child: Column(
          children: [
            CustomAppbar(
              leading: Image(
                image: const AssetImage(
                  AppImages.logo,
                ),
                width: 0.27.w,
                height: 0.1.h,
              ),
              action: IconButton(onPressed: (){},
                  icon: Icon( FontAwesomeIcons.magnifyingGlass,
                  size: 0.07.w,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
