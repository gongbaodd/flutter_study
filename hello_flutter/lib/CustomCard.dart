import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final index;
  final Function onPress;

  CustomCard({@required this.index, @required this.onPress});

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text('Card $index'),
          FlatButton(
            child: const Text("Press"),
            onPressed: onPress,
          )
        ],
      ),
    );
  }
}
