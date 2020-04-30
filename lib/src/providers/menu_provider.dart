

import 'package:flutter/services.dart' show rootBundle ;

// Libreria para mapear json
import 'dart:convert';

class _MenuProvider {

  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {

    // Tomando datos del json e imprimiendolo como string
    final resp = await rootBundle.loadString('data/menu_opts.json');

    // Convirtiendo en mapa
      Map dataMap = json.decode( resp );
      // print(dataMap['rutas']);

      opciones = dataMap['rutas'];


      return opciones;

  }


}

final menuProvider = new _MenuProvider();