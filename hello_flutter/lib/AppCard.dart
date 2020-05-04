import 'package:flutter/material.dart';
import 'package:hello_flutter/CustomCard.dart';

class AppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CustomCard",
        home: Scaffold(
            appBar: AppBar(title: Text("CustomCard")),
            body: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, int index) {
                  return CustomCard(
                      index: 1,
                      onPress: () {
                        print("Clicked");
                      });
                })));
  }
}
