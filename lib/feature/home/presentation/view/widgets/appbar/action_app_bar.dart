import 'package:booklyapp/core/utils/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/navigation/navigation_manager.dart';
import '../../../../../search/presentation/view/search_view.dart';

class ActionAppBar extends StatefulWidget {
  const ActionAppBar({super.key});

  @override
  State<ActionAppBar> createState() => _ActionAppBarState();
}

class _ActionAppBarState extends State<ActionAppBar> {

  bool reverse = false;
  @override
  Widget build(BuildContext context) {
    return      TweenAnimationBuilder(
      tween:
      reverse ?
      Tween<double>(begin: 0.8, end: 1) :
      Tween<double>(begin: 1, end: 0.8)
      ,
      duration: const Duration(seconds: 1),
      onEnd: (){
        setState(() {
          reverse = !reverse;
        });
      },

      builder: (BuildContext context,  value, Widget? child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: IconButton(
          onPressed: () {
            NavigationManager.push(SearchView.id);
          },
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 0.07.w,
          )),
    );
  }
}