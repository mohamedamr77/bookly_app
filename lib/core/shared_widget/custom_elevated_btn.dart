import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  final Color btnColor;
  final double width;
  final double height;
  final BorderSide? borderSide;

  const CustomElevatedButton(
      {super.key,
      required this.onPress,
      required this.child,
      required this.btnColor,
      required this.width,
      required this.height,
      this.borderSide});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.03.w),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      onPressed: onPress,
      child: child,
    );
  }
}
