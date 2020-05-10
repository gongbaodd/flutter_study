import 'package:flutter/material.dart';

Widget buid() {
  return MaterialApp(
      title: "Flutter",
      home: Scaffold(
          appBar: AppBar(
            title: Text('hello'),
          ),
          body: Body()));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Text('height ${screenSize.height}'),
        Text('width ${screenSize.width}')
      ],
    );
  }
}
