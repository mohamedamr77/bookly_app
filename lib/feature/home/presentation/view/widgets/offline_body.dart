import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_color.dart';
import '../../view_model/internet_home/internet_home_cubit.dart';

class OfflineBody extends StatelessWidget {
  const OfflineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_outlined, size: 0.4.w, color: AppColor.grayColor),
          0.02.ph,
          GText(
            textAlign: TextAlign.center,
            color: AppColor.grayColor,
            content: "You’re offline",
            fontSize: 0.06.w,
            fontFamily: "MontserratSemiBold",
          ),
          0.02.ph,
          CustomElevatedButton(
            onPress: () {
              BlocProvider.of<InternetHomeCubit>(context).connectWithInternet();
            },
            btnColor: AppColor.grayColor,
            width: 0.5.w,
            height: 0.07.h,
            child: GText(
              textAlign: TextAlign.center,
              color: AppColor.blackColor,
              content: "Try Again",
              fontSize: 0.05.w,
              fontFamily: "MontserratSemiBold",
            ),
          )
        ],
      ),
    );
  }
}
