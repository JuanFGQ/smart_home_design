import 'package:flutter/material.dart';

class MyCustomAnimatedRoute extends PageRouteBuilder {
  final Widget enterWidget;

  final Alignment transitionPosition;

  MyCustomAnimatedRoute(
      {required this.transitionPosition, required this.enterWidget})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionDuration: const Duration(milliseconds: 650),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.fastLinearToSlowEaseIn,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
                alignment: transitionPosition, scale: animation, child: child);
          },
        );
}
