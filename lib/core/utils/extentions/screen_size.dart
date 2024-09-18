import 'package:flutter/material.dart';

import '../const_variables.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: this * ht,
      );
  SizedBox get pw => SizedBox(
        width: this * wd,
      );
}

extension ScreenSize on num {
  double get w => this * wd;
  double get h => this * ht;
}
