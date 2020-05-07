import 'package:flutter/material.dart';

class AppRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: <String, WidgetBuilder>{
      "/a": (BuildContext context) => Page(
            content: 'a',
          ),
      "/b": (BuildContext context) => Page(
            content: 'b',
          ),
    }, home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Route'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('Home'),
            ),
            RaisedButton(
              child: const Text('to a'),
              onPressed: () {
                Navigator.pushNamed(context, "/a");
              },
            ),
            RaisedButton(
                child: const Text('to new'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Page(
                                content: 'c',
                              )));
                })
          ],
        ));
  }
}

class Page extends StatelessWidget {
  final String content;
  Page({@required this.content}) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('b'),
              onPressed: () {
                Navigator.pushNamed(context, '/b');
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Text(content),
            RaisedButton(
              child: Text('to a'),
              onPressed: () {
                Navigator.pushNamed(context, '/a');
              },
            ),
            RaisedButton(
              child: Text('pop'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
