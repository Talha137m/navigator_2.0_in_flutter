import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator_two_o_in_flutter/routing/my_page_builder.dart';
import 'package:navigator_two_o_in_flutter/screens/error_page.dart';

class MyRoteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(
      RouteInformation routeInformation) {
    final routesetting = RouteSettings(name: routeInformation.location);
    if (PageBuilder.isVaidPage(routesetting)) {
      return SynchronousFuture(routesetting);
    } else {
      return SynchronousFuture(const RouteSettings(name: MyErrorPage.pageName));
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration) {
    if (PageBuilder.isVaidPage(configuration)) {
      return RouteInformation(location: configuration.name);
    } else {
      return const RouteInformation(location: MyErrorPage.pageName);
    }
  }
}
