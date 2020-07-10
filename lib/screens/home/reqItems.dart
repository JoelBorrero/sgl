import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgl/models/item.dart';
import 'package:sgl/models/requisicion.dart';

class ReqItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Provider.of<Requisicion>(context).estado != ''
        ? Body()
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 200),
                Text(
                  'Primero debe crear una requisición',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _delete = -1;
  @override
  Widget build(BuildContext context) {
    List<Item> items = Provider.of<Requisicion>(context).items;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('Requisiciones', style: TextStyle(color: Colors.indigo)),
          centerTitle: true,
          actions: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.list, color: Colors.indigo, size: 40))
          ],
          backgroundColor: Colors.grey.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                      columnSpacing: 20,
                      horizontalMargin: 10,
                      showCheckboxColumn: true,
                      columns: [
                        DataColumn(
                          label: Icon(Icons.remove_circle_outline),
                        ),
                        DataColumn(label: Text('Material'), numeric: true),
                        DataColumn(label: Text('Descripción')),
                        DataColumn(label: Text('Cantidad'), numeric: true),
                        DataColumn(label: Text('Estado'))
                      ],
                      rows: items.map((i) {
                        return DataRow(cells: [
                          DataCell(
                              Icon(
                                  _delete == items.indexOf(i)
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_unchecked,
                                  color: _delete == items.indexOf(i)
                                      ? Colors.indigo
                                      : Colors.grey), onTap: () {
                            setState(() {
                              _delete = items.indexOf(i);
                            });
                          }),
                          DataCell(TextFormField(
                            initialValue: i.material,
                            keyboardType: TextInputType.number,
                            onChanged: (m) {
                              setState(() {
                                i.material = m;
                              });
                            },
                          )),
                          DataCell(Text(i.descripcion)),
                          DataCell(TextFormField(
                            initialValue: i.cantidad.toString(),
                            keyboardType: TextInputType.number,
                            onChanged: (c) {
                              setState(() {
                                i.cantidad = int.parse(c);
                              });
                            },
                          )),
                          DataCell(Text(i.aprobada ? 'Aprobada' : 'En espera')),
                        ]);
                      }).toList()),
                ),
              ),
            )
          ]),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: size.height / 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    items.add(Item());
                  });
                },
                child: Icon(Icons.note_add, color: Colors.white, size: 40),
              ),
              FloatingActionButton(
                onPressed: _delete != -1
                    ? () {
                        if (_delete != -1)
                          setState(() {
                            items.removeAt(_delete);
                            _delete = -1;
                          });
                      }
                    : null,
                child: Icon(Icons.delete, color: Colors.white, size: 40),
                backgroundColor: _delete != -1 ? Colors.indigo : Colors.grey,
                disabledElevation: 0,
              ),
              FloatingActionButton(
                  onPressed: () {
                    print('[');
                    items.forEach((e) {
                      print(
                          'Index: ${items.indexOf(e)}, Cantidad: ${e.cantidad}, Material: ${e.material}');
                    });
                    print(']');
                  },
                  child: Icon(Icons.save, color: Colors.white, size: 40)),
            ],
          )),
    );
  }
}
