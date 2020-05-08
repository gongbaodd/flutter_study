import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget build() {
  return MaterialApp(home: Home());
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final vsync = useSingleTickerProvider();
    final controller = useMemoized(() {
      return TabController(length: 2, vsync: vsync);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.email))
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Center(child: Text("Home")),
          Center(
            child: Text("home2"),
          )
        ],
      ),
    );
  }
}
