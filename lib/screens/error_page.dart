import 'package:flutter/material.dart';

class MyErrorPage extends StatelessWidget {
  static const String pageName = '/errorPage';
  const MyErrorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 400,
        color: Colors.red,
        child: const Text('Home'),
      ),
    );
  }
}
