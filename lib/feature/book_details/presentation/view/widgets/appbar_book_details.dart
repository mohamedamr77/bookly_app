import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/shared_widget/custom_appbar.dart';
import '../../../../../core/utils/app_color.dart';

class AppbarBookDetails extends StatelessWidget {
  const AppbarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.07.w, right: 0.07.w,top: 0.01.h),
      child: CustomAppbar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(FontAwesomeIcons.xmark,color: AppColor.whiteColor,
            size: 0.08.w,),
        ),
        action: IconButton(onPressed: (){}, icon: Icon(
          Icons.shopping_cart,
          size: 0.08.w,
        )
        ),
      ),
    );
  }
}
