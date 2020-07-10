import 'package:flutter/cupertino.dart';

import 'item.dart';

class Requisicion with ChangeNotifier {
  String _codigoCentro = ''; //Centro de costo seleccionado
  String _clasificacion = ''; //Centro de costo seleccionado
  String _solicitud = ''; //Solicitud de materiales
  String _observacion = ''; //Observación
  String _reqNum = ''; //Número de requisición AI
  bool _urgente = false; //F: Ordinaria, T: Urgente
  DateTime _date = DateTime.now();
  String _estado = '';
  List<Item> _items = [];
  //get isValid {if (_codigoCentro != '' && _clasificacion != ''&&_solicitud!=''&&_observacion!=''&&_reqNum!=''&&_estado) {return true;} else {return false;}}

  get codigoCentro {
    return _codigoCentro;
  }

  get clasificacion {
    return _clasificacion;
  }

  get solicitud {
    return _solicitud;
  }

  get observacion {
    return _observacion;
  }

  get reqNum {
    return _reqNum;
  }

  get urgente {
    return _urgente;
  }

  get date {
    return _date;
  }

  get estado {
    return _estado;
  }

  get items {
    return _items;
  }

  void setAll(
      String codigoCentro,
      String clasificacion,
      String solicitud,
      String observacion,
      String reqNum,
      bool urgente,
      DateTime date,
      String estado) {
    this.codigoCentro = codigoCentro;
    this.clasificacion = clasificacion;
    this.solicitud = solicitud;
    this.observacion = observacion;
    this.reqNum = reqNum;
    this.urgente = urgente;
    this.date = date;
    this.estado = estado;
    notifyListeners();
  }

  set codigoCentro(String codigoCentro) {
    this._codigoCentro = codigoCentro;
    notifyListeners();
  }

  set clasificacion(String clasificacion) {
    this._clasificacion = clasificacion;
    notifyListeners();
  }

  set solicitud(String solicitud) {
    this._solicitud = solicitud;
    notifyListeners();
  }

  set observacion(String observacion) {
    this._observacion = observacion;
    notifyListeners();
  }

  set reqNum(String reqNum) {
    this._reqNum = reqNum;
    notifyListeners();
  }

  set urgente(bool urgente) {
    this._urgente = urgente;
    notifyListeners();
  }

  set date(DateTime date) {
    this._date = date;
    notifyListeners();
  }

  set estado(String s) {
    this._estado = s;
    notifyListeners();
  }

  set items(List<Item> l) {
    this._items = l;
    notifyListeners();
  }

  void addItem(Item i) {
    this.items.add(i);
    notifyListeners();
  }

  void delete() {
    this.codigoCentro = '';
    this.clasificacion = '';
    this.solicitud = '';
    this.observacion = '';
    this.reqNum = '';
    this.urgente = false;
    this.date = DateTime.now();
    this.estado = '';
    this.items = [];
  }
}
