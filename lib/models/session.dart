import 'package:flutter/cupertino.dart';

class Session with ChangeNotifier {
  String _empresa = '';
  String _user = '';
  List<bool> _perm = [false, false, false, false, false];
  get permissions {
    return _perm;
  }

  get empresa {
    return _empresa;
  }

  get user {
    return _user;
  }

  set role(String role) {
    if (role == 'admin') {
      this._perm = [true, true, true];
    } else if (role == 'seller') {
      this._perm = [true, true, true];
    }
    notifyListeners();
  }

  set empresa(String e) {
    this._empresa = e;
    notifyListeners();
  }

  set user(String u) {
    this._user = u;
    notifyListeners();
  }

  void delete() {
    this._empresa = '';
    this._perm = [false, false, false, false, false];
    this._user = '';
  }
}
