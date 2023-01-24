import 'package:flutter/material.dart';

///First of all we make the page class which overridde the createRoute method which return the
///Route MaterialPageRoute,CupertinoPageRoute,and PageRouteBuilder which create the page
///in the constructor of page class we give the page which is return the Widget and page name.
///and last important thing is that we give the value key because we can differenciate the page
///which is build in the memory
class PageClass extends Page<PageRouteBuilder> {
  final Widget page;
  final String pageNmae;
  PageClass({required this.page, required this.pageNmae})
      : super(
          key: ObjectKey(pageNmae),
          name: pageNmae,
        );

  @override
  Route<PageRouteBuilder> createRoute(BuildContext context) {
    var tween = Tween<double>(begin: 0, end: 1);
    return PageRouteBuilder(
      barrierColor: Colors.blueAccent,
      opaque: true,
      barrierDismissible: true,
      fullscreenDialog: true,
      pageBuilder: ((context, animation, secondaryAnimation) => page),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
        scale: tween.animate(animation),
        child: child,
      ),
      settings: this,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
    );
  }

  // @override
  // Route createRoute(BuildContext context) {
  //   // return PageTransition(
  //   //     child: page,
  //   //     type: PageTransitionType.scale,
  //   //     duration: Duration(seconds: 2),
  //   //     reverseDuration: Duration(seconds: 2),
  //   //     settings: this,
  //   //     alignment: Alignment.bottomRight);

  //   // return PageRouteBuilder(
  //   //   settings: this,
  //   //   pageBuilder: ((context, animation, secondaryAnimation) {
  //   //     final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
  //   //     final curveTween = CurveTween(curve: Curves.easeInOut);
  //   //     return SlideTransition(
  //   //       position: animation.drive(curveTween).drive(tween),
  //   //       child: page,
  //   //     );
  //   //   }),
  //   // );

  //   // var tween = Tween<double>(begin: 0, end: 1);
  //   // return PageRouteBuilder(
  //   //   barrierColor: Colors.blueAccent,
  //   //   opaque: true,
  //   //   barrierDismissible: true,
  //   //   fullscreenDialog: true,
  //   //   pageBuilder: ((context, animation, secondaryAnimation) => page),
  //   //   transitionsBuilder: (context, animation, secondaryAnimation, child) =>
  //   //       ScaleTransition(
  //   //     scale: tween.animate(animation),
  //   //     child: child,
  //   //   ),
  //   //   settings: this,
  //   //   transitionDuration: const Duration(seconds: 1),
  //   //   reverseTransitionDuration: const Duration(seconds: 1),
  //   // );

  //   //return MaterialPageRoute(builder: ((context) => page), settings: this);
  //   return CupertinoPageRoute(builder: ((context) => page), settings: this);
  // }
}
