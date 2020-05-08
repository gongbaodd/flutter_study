import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget build() {
  return MaterialApp(home: Home());
}

class Home extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) =>
                  !value.contains('@') ? 'Not a valid email' : null,
              onSaved: (value) => _email = value,
            ),
            RaisedButton(
              child: Text('ok'),
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text('Alert'),
                        content: Text('Email: $_email'),
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
