//import 'dart:convert';
import 'navigation_bloc.dart';
import 'models/constants.dart';
import 'models/sidebar_layout.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sgl/models/session.dart';
//import 'package:dart_mssql/dart_mssql.dart';
import 'package:sgl/models/requisicion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Session(),
        builder: (context) => Session(),
        child: ChangeNotifierProvider(
          create: (context) => Requisicion(),
          builder: (context) => Requisicion(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                iconTheme: IconThemeData(color: Colors.indigo),
                appBarTheme: AppBarTheme(elevation: 5),
                scaffoldBackgroundColor: Colors.grey.shade200,
                primarySwatch: Colors.indigo,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                buttonTheme: ButtonThemeData(
                    buttonColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            home: LogIn(),
            routes: <String, WidgetBuilder>{
              '/admin': (BuildContext context) => new SideBarLayout(),
              '/seller': (BuildContext context) => new SideBarLayout(),
              '/login': (BuildContext context) => new LogIn()
            },
          ),
        ));
  }
}

class LogIn extends StatefulWidget with NavigationStates {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final List<String> _empresas = [
    'CONSTRUCCIONES E INVERSIONES BETA S...',
    'SERGIO TORRES REATIGA',
    'UNIÓN TEMPORAL CUENCA ORIENTAL 2006',
    'UNIÓN TEMPORAL VÍAS ATLÁNTICO',
    'UNIÓN TEMPORAL CANALES DEL SUR',
    'CONTRATO COMISARIAS',
    'UNIÓN TEMPORAL METROPOLITANO',
    'CONSORCIO ALCANTARILLADO BARANOA',
    'UNIÓN TEMPORAL CIRCUNVALAR 2010',
    'UNIÓN TEMPORAL ARROYO EL SALAO'
  ];
  String _message = '';
  String _username = '';
  String _password = '';
  int _empresa = 0;
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  Future<List> login() async {
    print('Start connection');
    //final conn = SqlConnection(host: '190.157.4.28', db: 'SISlog'); //CONNECTING DB
    //SqlResult res = conn.execute('select * from usuarios');
    //print(res.toString());
    print('Connection ends');
    /*var results = await conn.query('select * from usuarios');
    print('USUARIOS:');
    for (var row in results) {
      print('${row[0]}');
    }
    print('FIN_USUARIOS'); //CONNECTING DB
    final response =
        await http.post('http://192.168.0.30/sgl_test/login.php', body: {
      'username': controllerUser.text,
      'password': controllerPassword.text,
    });
    var datauser = json.decode(response.body);
    String role = '';
    if (datauser.length == 0) {
      setState(() {
        _message = 'Usuario y/o contraseña incorrectos';
      });
    } else {
      Provider.of<Requisicion>(context).delete();
      Provider.of<Session>(context).user = controllerUser.text;
      String role = datauser[0]['role'];
      if (role == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin');
        Provider.of<Session>(context).role = 'admin';
      } else if (role == 'seller') {
        Navigator.pushReplacementNamed(context, '/seller');
        Provider.of<Session>(context).role = 'seller';
      }
      setState(() {
        _username = datauser[0]['username'];
        _password = datauser[0]['password'];
      });
    }
    return datauser;*/
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Sistema de Gestión Logística'),
          centerTitle: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        body: Form(
            child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: size.height / 10),
                child: Column(children: <Widget>[
                  CircleAvatar(
                      child: Icon(Icons.perm_identity, size: size.width / 3),
                      radius: size.width / 5),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: size.width / 5),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: textInputDecoration.copyWith(
                            icon: Icon(Icons.short_text), labelText: 'Usuario'),
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: size.width / 5),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        controller: controllerPassword,
                        decoration: textInputDecoration.copyWith(
                            icon: Icon(Icons.visibility_off),
                            labelText: 'Contraseña'),
                        obscureText: true,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: size.width / 5),
                    child: MediaQuery(
                        data: MediaQueryData(textScaleFactor: 0.65),
                        child: DropdownButtonFormField(
                            hint: Text('Empresa'),
                            items: _empresas.map((emp) {
                              return DropdownMenuItem(
                                  value: _empresas.indexOf(emp) + 1,
                                  child: Text(
                                      '${_empresas.indexOf(emp) + 1}. $emp'));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _empresa = value;
                              });
                            },
                            icon: Icon(
                              Icons.business,
                            ))),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_empresa != 0) {
                        login();
                        Provider.of<Session>(context).empresa =
                            _empresas[_empresa - 1];
                      } else {
                        setState(() {
                          _message = 'Debe seleccionar su empresa';
                        });
                      }
                    },
                    child: Text('Iniciar sesión',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Text(_message, style: TextStyle(color: Colors.red))
                ]))));
  }
}
