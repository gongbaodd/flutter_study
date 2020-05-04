import "package:flutter/material.dart";

Widget app() {
  return MaterialApp(
      title: "Functional",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Functional"),
        ),
        body: Center(
          child: Text('hello'),
        ),
      ));
}
