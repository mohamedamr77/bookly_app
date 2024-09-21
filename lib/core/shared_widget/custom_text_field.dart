import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.border,
    this.enabledBorder,
    this.focusBorder,
    this.suffixIcon,
    required this.hintText,
    this.fillColor,
    this.prefix,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.onSaved,
  });

  final String hintText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final int minLine;
  final int maxLine;
  final void Function(String)? onChanged;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool obscureText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w),
      child: SizedBox(
        height: 0.09.h,
        child: TextFormField(
          onSaved: onSaved,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: "*",
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          // textAlign: context.locale.languageCode == 'ar'
          //     ? TextAlign.right
          //     : TextAlign.left,
          maxLines: maxLine,
          minLines: minLine,
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: TextStyle(
            color: Theme.of(context).textTheme.displayLarge!.color!,
            fontSize: 0.04.w,
            fontWeight: FontWeight.w400,
            fontFamily: "MontserratSemiBold",
          ),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 0.05.h, left: 0.05.w, right: 0.05.w),
            fillColor: fillColor,
            hintText: hintText,
            // hintStyle: TextStyle(
            //     fontFamily: SharedFunctions.determineFontFamily(hintText),
            //     color: Theme.of(context).textTheme.displaySmall!.color!,
            //     fontSize: 0.035.w),
            border: const OutlineInputBorder(),
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            focusedBorder: focusBorder,
            enabledBorder: enabledBorder,
          ),
        ),
      ),
    );
  }
}
