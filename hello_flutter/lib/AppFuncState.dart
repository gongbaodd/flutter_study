import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget createApp() {
  return MaterialApp(
      title: "Functional State",
      home: Scaffold(
        appBar: AppBar(title: Text("Functonal State App")),
        body: Home(),
      ));
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final showText = useState<bool>(false);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            showText.value ? Text('Hello') : Container(),
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: RaisedButton(
                onPressed: () {
                  print("clicked");
                  showText.value = !showText.value;
                },
                child: Text('show Text'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
