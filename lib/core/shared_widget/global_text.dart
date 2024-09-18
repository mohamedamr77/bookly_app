import 'package:flutter/material.dart';

class GText extends StatelessWidget {
  final Color color;
  final String content;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? enableArabicFont;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final String? fontFamily;
  const GText({
    super.key,
    required this.color,
    required this.content,
    required this.fontSize,
    this.textDirection,
    this.fontWeight,
    this.textAlign,
    this.enableArabicFont = true,
    this.maxLines,
    this.overflow,
    this.textDecoration,
    this.decorationColor,
    this.decorationThickness,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        overflow: overflow,
        decoration: textDecoration,
        color: color,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        // fontFamily: SharedFunctions.determineFontFamily(content),
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
