import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  Home() : super();
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        bottomNavigationBar: Material(
          color: Colors.blue,
          child: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.email),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('home2'),
            )
          ],
          controller: controller,
        ));
  }
}
