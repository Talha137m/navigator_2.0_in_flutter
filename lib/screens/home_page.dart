import 'package:flutter/material.dart';
import 'package:navigator_two_o_in_flutter/routing/my-router_delegate.dart';
import 'package:navigator_two_o_in_flutter/screens/scecond_screen.dart';

class HomePage extends StatelessWidget {
  static const String pageName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (() {
            //Navigator.pushNamed(context, SecondPage.pageName);
            MyRouterDelegate.of(context)
                .push(const RouteSettings(name: SecondPage.pageName));
          }),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: const Center(child: Text('Home page')),
          ),
        ),
      ),
    );
  }
}
