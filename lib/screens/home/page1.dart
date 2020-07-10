import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Icon(Icons.store, size: 200,color:Colors.amber),
          Text('Inventario',
              style: TextStyle(color: Colors.amber[800], fontSize: 50))
        ]));
  }
}
