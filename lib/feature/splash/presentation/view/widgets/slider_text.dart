import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_text.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(AppText.readFreeBook,
              style: GoogleFonts.afacad(
                  fontSize: 0.07.w
              )
          ),
        );
      },

    );
  }
}