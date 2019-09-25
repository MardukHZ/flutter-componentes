import 'package:flutter/material.dart';
//util que sirve para cargar dinamicamente los iconos que entrega el JSON

//este Map relaciona el string que viene del JSON con el widget Icons correcto

final _icons = <String,IconData>{
  'add_alert'    : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'  : Icons.folder_open,
  //si necesitara mas iconos agrego la clave: valor aca
};

//metodo que retorna el icono correcto a partir de un nombre de icono
Icon getIcon(String nombreIcono){
  return Icon(_icons[nombreIcono], color: Colors.teal,);
}