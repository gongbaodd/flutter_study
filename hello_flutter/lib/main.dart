import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Welcome to my app",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcom to Flutter"),
          ),
          body: Center(child: Text("Hello World")),
        ));
  }
}
