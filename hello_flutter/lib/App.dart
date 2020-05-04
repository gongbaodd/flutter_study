import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Welcome to flutter",
        home: Scaffold(
            appBar: AppBar(title: Text("Welcome to Flutter")),
            body: Center(
              child: Text("Hello World"),
            )));
  }
}
