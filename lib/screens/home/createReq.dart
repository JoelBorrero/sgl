import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgl/models/constants.dart';
import 'package:sgl/models/requisicion.dart';

class CreateReq extends StatelessWidget {
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Requisicion _req = Requisicion();
  List<String> _codCenC = ['AIRE', 'ALM1']; //Códigos centros de costo
  List<String> _centros = [
    'AIRES ACONDICIONADOS OFICINA',
    'ALMACEN CANGURO'
  ]; //Nombres centros de costo
  List<String> _codClas = [
    'COMB',
    'CONT',
    'DOT',
    'ECOM',
    'ELEC',
    'EQOF',
    'EQU',
    'FIL',
    'HERR',
    'MAT',
    'REP',
    'SERV',
    'SIST',
    'SUMI'
  ]; //Códigos clasificaciones
  List<String> _clasificaciones = [
    'COMBUSTIBLES Y ACEITES',
    'CONTABILIDAD',
    'DOTACIÓN',
    'EQUIPOS DE COMUNICACIÓN',
    'ELECTRICOS',
    'EQUIPOS DE OFICINA',
    'EQUIPOS MENORES',
    'FILTROS',
    'HERRAMIENTAS',
    'MATERIALES',
    'REPUESTOS',
    'SERVICIOS',
    'SISTEMAS',
    'SUMINISTROS'
  ]; //Nombres clasificaciones
  @override
  Widget build(BuildContext context) {
    Requisicion req = Provider.of<Requisicion>(context);
    if (req.estado != '') _req = req;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('Requisiciones', style: TextStyle(color: Colors.indigo)),
          centerTitle: true,
          actions: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.add_circle, color: Colors.indigo, size: 40))
          ],
          backgroundColor: Colors.grey.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      body: Column(children: <Widget>[
        Text(
            '\n\nRequisición número: ${req.reqNum != '' ? req.reqNum : _req.reqNum}'),
        Text('${req.estado} - ${req.estado == 'N' ? 'No procesada' : ''}',
            style: TextStyle(
                color: req.estado == 'N' ? Colors.red : Colors.black)),
        Container(
          width: size.width / 2,
          child: RaisedButton(
              color: Colors.indigo[100],
              elevation: 2,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        '${_req.date.day} / ${_req.date.month} / ${_req.date.year}'),
                    Icon(Icons.calendar_today)
                  ]),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: req.date != null ? req.date : _req.date,
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2030))
                    .then((date) {
                  setState(() {
                    if (date != null) _req.date = date;
                  });
                });
              }),
        ),
        Container(
            padding: EdgeInsets.only(top: 10),
            width: size.width / 2,
            child: TextFormField(
              initialValue:
                  req.solicitud != '' ? req.solicitud : _req.solicitud,
              textAlign: TextAlign.center,
              onChanged: (s) {
                setState(() {
                  if (s.length == 5) _req.solicitud = s;
                });
              },
              keyboardType: TextInputType.number,
              maxLength: 5,
              decoration: textInputDecoration.copyWith(
                  labelText: 'Solicitud de materiales'),
            )),
        Container(
            width: 350,
            child: DropdownButtonFormField(
                value: req.codigoCentro != ''
                    ? _codCenC[_codCenC.indexOf(req.codigoCentro)]
                    : null,
                hint: Text('Centro de costo'),
                items: _centros.map((c) {
                  return DropdownMenuItem(
                      value: _codCenC[_centros.indexOf(c)],
                      child: Text('$c', // - ${_codCenC[_centros.indexOf(c)]}',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.end));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _req.codigoCentro = value;
                    _req.reqNum = value + ' - 004';
                  });
                },
                icon: Icon(
                  Icons.business,
                ))),
        Container(
            width: 300,
            child: DropdownButtonFormField(
                value: req.clasificacion != ''
                    ? _codClas[_codClas.indexOf(req.clasificacion)]
                    : null,
                hint: Text('Clasificación'),
                items: _clasificaciones.map((c) {
                  return DropdownMenuItem(
                      value: _codClas[_clasificaciones.indexOf(c)],
                      child: Text('$c'));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _req.clasificacion = value;
                  });
                })),
        Container(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              initialValue: _req.observacion,
              onChanged: (o) {
                setState(() {
                  if (o.length > 0) _req.observacion = o;
                });
              },
              decoration:
                  textInputDecoration.copyWith(labelText: 'Observaciones'),
            )),
        SwitchListTile(
          activeColor: Colors.indigo,
          inactiveThumbColor: Colors.indigo[200],
          activeTrackColor: Colors.indigo[200],
          inactiveTrackColor: Colors.indigo,
          contentPadding: EdgeInsets.symmetric(horizontal: 100),
          value: _req.urgente,
          title: Text(
            _req.urgente ? 'Urgente' : 'Ordinaria',
            style:
                TextStyle(color: _req.urgente ? Colors.indigo : Colors.black),
          ),
          onChanged: (u) {
            setState(() {
              _req.urgente = u;
            });
          },
        ),
        Container(
          width: 150,
          child: RaisedButton(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Enviar ', style: TextStyle(color: Colors.white)),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    )
                  ]),
              onPressed: () {
                if (_req.codigoCentro != '' &&
                    _req.clasificacion != '' &&
                    _req.solicitud != '' &&
                    _req.reqNum != '') {
                  req.codigoCentro = _req.codigoCentro;
                  req.clasificacion = _req.clasificacion;
                  req.solicitud = _req.solicitud;
                  req.observacion = _req.observacion;
                  req.reqNum = _req.reqNum;
                  req.urgente = _req.urgente;
                  req.date = _req.date;
                  req.estado = 'N';
                  showDialog(
                      context: context,
                      child: Container(
                          width: 200,
                          child: AlertDialog(
                              title: Text('Requisición creada exitosamente',
                                  textAlign: TextAlign.center),
                              content: IconButton(
                                  icon: Icon(Icons.check_circle,
                                      color: Colors.green),
                                  onPressed: () => Navigator.pop(context),
                                  iconSize: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))))));
                } else {
                  showDialog(
                      context: context,
                      child: Container(
                          width: 200,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              content: Text(
                                  'Datos incompletos\nCC:${_req.codigoCentro}\nCL:${_req.clasificacion}\nSL:${_req.solicitud}\nRN:${_req.reqNum}'))));
                }
              }),
        ),
        IconButton(
            iconSize: 100,
            icon: Icon(Icons.print),
            onPressed: () {
              print('COD: ' + req.codigoCentro);
              print('CLA:' + req.clasificacion);
              print(req.date);
              print('OBS:' + req.observacion);
              print('REQ:' + req.reqNum);
              print('SOL:' + req.solicitud);
              print(req.urgente);
            })
      ]),
    );
  }
}
