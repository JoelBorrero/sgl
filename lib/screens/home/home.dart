import 'createReq.dart';
import 'reqItems.dart';
import 'page5.dart';
import 'page404.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgl/navigation_bloc.dart';
import 'package:sgl/models/session.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _showPage = CreateReq();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return CreateReq();
        break;
      case 1:
        return ReqItems();
        break;
      case 2:
        return Page5();
        break;
      case 3:
        return Page404();
        break;
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    int _page = 0;
    Session session = Provider.of<Session>(context);
    List<bool> perm = session.permissions;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          _showPage,
          Container(
              height: MediaQuery.of(context).size.height / 1.075,
              alignment: Alignment.bottomLeft,
              child: Text('     ${session.empresa} : ${session.user}',
                  textScaleFactor: 0.8))
        ]),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          index: _page,
          backgroundColor: Colors.grey.shade200,
          color: Colors.indigo,
          items: <Widget>[
            //Icon(Icons.store,size: 30, color: perm[0] ? Colors.white : Colors.grey),
            //Icon(Icons.playlist_add_check, size: 30, color: perm[1] ? Colors.white : Colors.grey),
            Icon(Icons.add, size: 30, color: perm[0] ? Colors.white : Colors.grey),
            Icon(Icons.line_style, size: 30, color: perm[1] ? Colors.white : Colors.grey),
            Icon(Icons.settings, size: 30, color: perm[2] ? Colors.white : Colors.grey),
          ],
          onTap: (index) {
            setState(() {
              _showPage = perm[index] ? _pageChooser(index) : _pageChooser(5);
            });
          },
        ));
  }
}
