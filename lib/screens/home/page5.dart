import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          RaisedButton(
            child: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ]));
  }
}
