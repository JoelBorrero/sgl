class Item {
  String _material = '';
  String _descripcion = 'OTRO';
  String _unidad = '';
  int _cantidad = 0;
  bool _aprobada = false;
  String _estado = '';
  Item();
  get material {
    return _material;
  }

  get descripcion {
    return _descripcion;
  }

  get unidad {
    return _unidad;
  }

  get cantidad {
    return _cantidad;
  }

  get aprobada {
    return _aprobada;
  }

  get estado {
    return _estado;
  }

  set material(String m) {
    this._material = m;
    if (m == '1005') {
      this.descripcion = 'MATERIAL';
    } else {
      this.descripcion = 'OTRO';
    }
  }

  set descripcion(String d) {
    this._descripcion = d;
  }

  set unidad(String u) {
    this._unidad = u;
  }

  set cantidad(int c) {
    this._cantidad = c;
  }

  set aprobada(bool a) {
    this._aprobada = a;
  }

  set estado(String e) {
    this._estado = e;
  }
}
