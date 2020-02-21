import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        title: "Welcome to my app",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcom to Flutter"),
          ),
          body: Center(child: Text(wordPair.asPascalCase)),
        ));
  }
}
