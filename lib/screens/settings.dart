import 'package:flutter/material.dart';
import 'package:sgl/navigation_bloc.dart';

class Settings extends StatefulWidget with NavigationStates {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    List<String> colores = ['indigo', 'teal'];
    List<Color> colors = [
      Colors.amber,
      Colors.black,
      Colors.blue,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.lime,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.yellow
    ];

    return Scaffold(
        body: ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text('Color $index',
                style: TextStyle(color: colors[index], fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.track_changes, color: colors[index], size: 100),
              ],
            ),
          ],
        );
      },
      //mainAxisAlignment: MainAxisAlignment.center,
      /*children: [
        SizedBox(height: 200),
        Text('                Amber'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.track_changes, color: Colors.amber[50], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[100], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[200], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[300], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[400], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[500], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[600], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[700], size: 40),
            Icon(Icons.track_changes, color: Colors.amber[800], size: 40),
          ],
        ),
        Text('                Blue'),
                Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.track_changes, color: Colors.blue[50], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[100], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[200], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[300], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[400], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[500], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[600], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[700], size: 40),
            Icon(Icons.track_changes, color: Colors.blue[800], size: 40),
          ],
        ),
      ],
      */
    ));
  }
}
