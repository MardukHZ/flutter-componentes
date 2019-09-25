import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//clase que permite acceder a la data que viene en el archivo JSON
class _MenuProvider{
  //inicializo la lista de opciones donde guardare el arreglo con los objetos rutas d JSON
  List<dynamic> opciones = [];

  _MenuProvider();

  //al cargar datos externos siempre debemos usar un Future
  Future<List<dynamic>> cargarData() async{// al usar "await" debemos colocar async siempre
    //casi siempre se utiliza async y await con los futures
    final resp = await rootBundle.loadString('data/menu_opts.json');//lee un json local
    Map parsedJson = json.decode(resp); //transformamos el string (rawJson) a un JSON valido
    opciones = parsedJson['rutas']; //accedemos a la clave "rutas" del  JSON
    return opciones;//retornamos la lista

  }

}
//creamos instancia para utilizarla globalmente en la aplicacion
final menuProvider = _MenuProvider();