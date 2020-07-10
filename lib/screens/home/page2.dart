import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Icon(Icons.person, size: 200,color:Colors.blue),
          Text('Pendientes\npor aprobar',textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue[800], fontSize: 50))
        ]));
  }
}
