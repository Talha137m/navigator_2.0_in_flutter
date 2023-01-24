import 'package:flutter/material.dart';
import 'package:navigator_two_o_in_flutter/routing/my-router_delegate.dart';
import 'package:navigator_two_o_in_flutter/routing/my_route_information_parser.dart';
import 'package:navigator_two_o_in_flutter/routing/page_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRoteInformationParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
