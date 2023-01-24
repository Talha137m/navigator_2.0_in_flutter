import 'package:flutter/material.dart';
import 'package:navigator_two_o_in_flutter/routing/page_class.dart';
import 'package:navigator_two_o_in_flutter/screens/error_page.dart';
import 'package:navigator_two_o_in_flutter/screens/home_page.dart';
import 'package:navigator_two_o_in_flutter/screens/scecond_screen.dart';
import 'package:navigator_two_o_in_flutter/screens/third_page.dart';

//First thing in this pageBuilder class we make the static method which is return the page
//Second thing we make the static method which is checked that page the valid where we can go.
class PageBuilder {
  static Page build(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (HomePage.pageName):
        return PageClass(
          page: const HomePage(),
          pageNmae: HomePage.pageName,
        );
      case (SecondPage.pageName):
        return PageClass(
            page: const SecondPage(), pageNmae: SecondPage.pageName);
      case (ThirdPage.pageName):
        return PageClass(page: const ThirdPage(), pageNmae: ThirdPage.pageName);
      default:
        return PageClass(
            page: const MyErrorPage(), pageNmae: MyErrorPage.pageName);
    }
  }

  static bool isVaidPage(RouteSettings routeSettings) {
    return routeSettings.name == HomePage.pageName ||
        routeSettings.name == SecondPage.pageName;
  }
}
