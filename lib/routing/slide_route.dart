import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget child;
  final RouteSettings routeSettings;
  static final tween =
      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
  SlideRoute({required this.child, required this.routeSettings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: tween.animate(animation),
            child: RotationTransition(
              turns: animation,
              child: child,
            ),
          ),
          transitionDuration: const Duration(seconds: 3),
          reverseTransitionDuration: const Duration(seconds: 3),
          settings: routeSettings,
        );
}
