/*import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _username = '';
  String get username => _username;
  List<bool> _permissions=[];
  List get permissions => _permissions;
  setPermissions(List<bool> perm) {
    _permissions = perm;
    notifyListeners();
  }
  logOut(){
    print(_username);
    _username='';
    print(_username);
    print(_permissions);
    setPermissions([]);
    print(_permissions);
  }
}
*/