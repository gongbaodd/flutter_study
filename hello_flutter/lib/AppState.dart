import 'dart:async';
import 'package:flutter/material.dart';

Widget createApp() {
  return MaterialApp(
    title: "stateApp",
    home: Scaffold(
      appBar: AppBar(title: Text("State APP")),
      body: MyStatefulWidget(),
    ),
  );
}

class MyStatefulWidget extends StatefulWidget {
  final String title;
  MyStatefulWidget({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<StatefulWidget> {
  bool showText = true;
  bool toggleState = true;
  Timer t2;

  toggleBlinkState() {
    setState(() {
      toggleState = !toggleState;
    });

    var twenty = const Duration(milliseconds: 1000);
    if (toggleState == false) {
      t2 = Timer.periodic(twenty, (Timer t) {
        toggleShowText();
      });
    } else {
      t2.cancel();
    }
  }

  toggleShowText() {
    setState(() {
      showText = !showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            (showText ? Text("Blink") : Container()),
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: RaisedButton(
                onPressed: toggleBlinkState,
                child: (toggleState ? Text("Blink") : Text("Stop Blinking")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
