import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator_two_o_in_flutter/routing/my_page_builder.dart';
import 'package:navigator_two_o_in_flutter/routing/transition_delegate.dart';
import 'package:navigator_two_o_in_flutter/screens/error_page.dart';
import 'package:navigator_two_o_in_flutter/screens/home_page.dart';

//This is the heart of the navigator of 2.0
class MyRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _stack = <RouteSettings>[const RouteSettings(name: HomePage.pageName)];
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: onPopPage,
      pages: [
        for (final routeSettings in _stack) PageBuilder.build(routeSettings)
      ],
    );
  }

  static MyRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is MyRouterDelegate,
        'Router delegate must be MyRouterDelegate but is found ${delegate.runtimeType}');
    return delegate as MyRouterDelegate;
  }

  pop() async {
    if (_stack.isNotEmpty) {
      _stack.remove(_stack.last);
      notifyListeners();
    }
  }

  push(RouteSettings settings) async {
    _stack.add(settings);
    notifyListeners();
  }

  bool onPopPage(Route route, result) {
    if (_stack.isNotEmpty) {
      if (_stack.last.name == route.settings.name) {
        _stack.remove(_stack.last);
      } else {
        _stack.add(const RouteSettings(name: HomePage.pageName));
      }
    }
    return route.didPop(result);
  }

  @override
  RouteSettings? get currentConfiguration => _stack.isNotEmpty
      ? _stack.last
      : const RouteSettings(name: MyErrorPage.pageName);

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Future<void> setInitialRoutePath(RouteSettings configuration) {
    return setNewRoutePath(configuration);
  }
}
