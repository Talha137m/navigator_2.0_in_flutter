import 'package:flutter/material.dart';
import 'package:navigator_two_o_in_flutter/routing/my-router_delegate.dart';

class SecondPage extends StatelessWidget {
  static const String pageName = '/secondPage';
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.pop(context);
          //MyRouterDelegate.of(context).pop();
        },
        child: const Center(
          child: Text('Second page'),
        ),
      ),
    );
  }
}
