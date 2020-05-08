import 'package:flutter/material.dart';

Widget build() {
  return MaterialApp(
    home: Home(),
    routes: {'/b': (BuildContext context) => B()},
  );
}

Widget B() {
  return Scaffold(
    appBar: AppBar(
      title: Text('b'),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListTile(
          leading: Icon(Icons.change_history),
          title: Text('Screen2'),
          onTap: () {
            Navigator.pushNamed(context, '/b');
          },
        ),
        elevation: 20.0,
      ),
    );
  }
}
