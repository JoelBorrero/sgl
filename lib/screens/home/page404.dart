import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Icon(
            Icons.error_outline,
            size: 200,
            color: Colors.red,
          ),
          Text('Acceso denegado',textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red[800], fontSize: 50))
        ]));
  }
}
