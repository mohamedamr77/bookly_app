import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/shared_widget/custom_appbar.dart';
import '../../../../../core/utils/app_images.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.07.w, right: 0.07.w),
      child: CustomAppbar(
        leading: Image(
          image: const AssetImage(
            AppImages.logo,
          ),
          width: 0.27.w,
          height: 0.1.h,
        ),
        action: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 0.07.w,
            )),
      ),
    );
  }
}
