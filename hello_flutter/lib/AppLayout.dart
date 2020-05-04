import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Layout",
        home: Scaffold(
          appBar: AppBar(
            title: Text("App Layout"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 100.0,
                ),
                Container(
                  color: Colors.blue,
                  width: 100.0,
                  height: 100.0,
                ),
                Container(
                  color: Colors.green,
                  width: 100.0,
                  height: 100.0,
                )
              ],
            ),
          ),
        ));
  }
}
