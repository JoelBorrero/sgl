import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sgl/models/menu_item.dart';
import '../navigation_bloc.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenStreamController;
  Stream<bool> isSideBarOpenStream;
  StreamSink<bool> isSideBarOpenSink;
  final bool isSideBarOpen = true;
  final _animationDuration = const Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenStreamController = PublishSubject<bool>();
    isSideBarOpenStream = isSideBarOpenStreamController.stream;
    isSideBarOpenSink = isSideBarOpenStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenStreamController.close();
    isSideBarOpenSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSideBarOpenSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //return StreamBuilder(stream: Firestore.instance.collection('userData').document(user.uid).snapshots(),builder: (context, snapshot) {if (snapshot.hasData) {String name = snapshot.data['name'];String lastName = snapshot.data['lastName'];String phone = snapshot.data['phone'];
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenStream,
      builder: (context, isSidebarOpenAsync) {
        return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSidebarOpenAsync.data ? 0 : -screenWidth,
            right: isSidebarOpenAsync.data ? 0 : screenWidth - 45,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.indigo,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.perm_identity),
                            ),
                            title: Text(
                              'Jose Rosania',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'mail@mail.dom',
                              style: TextStyle(
                                  color: Colors.white30, fontSize: 20),
                            ),
                          ),
                          _divider(),
                          MenuItem(
                            icon: Icons.location_city,
                            title: 'Básicas',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.HomePageClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.departure_board,
                            title: 'Logística',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.SettingsClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.storage,
                            title: 'Inventario',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.SettingsClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.local_shipping,//rv_hookup,
                            title: 'Equipos',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.SettingsClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.playlist_add_check,
                            title: 'Reportes',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.SettingsClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.security,
                            title: 'Seguridad',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.SettingsClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.view_carousel,//dashboard,
                            title: 'Ventanas',
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.SettingsClickedEvent);
                            },
                          ),
                          _divider(),
                          MenuItem(
                            icon: Icons.exit_to_app,
                            title: 'Salir',
                            onTap: () {
                              onIconPressed();
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                          ),
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: Colors.indigo,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _animationController.view,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  Widget _divider() {
    return Divider(
      height: 20,
      thickness: 0.5,
      color: Colors.indigoAccent,
      indent: 32,
      endIndent: 32,
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
