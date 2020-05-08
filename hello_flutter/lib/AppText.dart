import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget build() {
  return MaterialApp(
    home: Home(),
  );
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => TextEditingController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Type", labelText: "Text"),
            ),
            RaisedButton(
              child: Text("submit"),
              onPressed: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('Alert'),
                      content: Text('you typed ${controller.text}'),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
