import 'package:flutter/material.dart';

class NavigationManager {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static BuildContext? currentContext = navigationKey.currentContext;

  static replace(String page, {var arguments}) async {
    navigationKey.currentState
        ?.pushReplacementNamed(page, arguments: arguments);
  }

  static replaceAll(String page, {var arguments}) async {
    navigationKey.currentState?.popUntil((route) => route.isFirst);
    navigationKey.currentState
        ?.pushReplacementNamed(page, arguments: arguments);
  }

  static push(String page, {var arguments}) async {
    navigationKey.currentState?.pushNamed(page, arguments: arguments);
  }

  static goBack() {
    navigationKey.currentState?.pop();
  }
}
