import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
 
 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _lista()
      );
  }


  //cuando cargamos datos con un Future, debemos utilizar un FutureBuilder
  //para que el widget lea esos datos y se construya(build) correctamente a partir de los datos
  Widget _lista() {
    //shortcut para futureBuilder: futureBldr
    return FutureBuilder(
      future: menuProvider.cargarData(), //aqui siempre va el future
      initialData: [],//data inicial cuando aun no hay datos
      //el builder me sirve para renderizar o construir el widget con la data que cargamos dl JSON
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          //recordar que del future estamos retornando una lista de tipo dynamic
          children: _listaItems(snapshot.data, context),//snapshot.data accede a los datos del JSON
        );
      },
    );
  }
  List<Widget> _listaItems(List<dynamic> data , BuildContext context) {
    final List<Widget> opciones = [];
     data.forEach((opt){
      final widgetTemp = ListTile(
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
        },
        leading: getIcon(opt['icon']),
        title: Text(opt['texto']),//accedemos a los valores del Map de data
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.teal),
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });

    return opciones;

  }
  

  Widget _lista2() {
    return ListView(
      children: _lista2Items(),
    );
  }

  List<Widget> _lista2Items() {
    final List<Widget> opciones = [];
    for (var i = 0; i < 10; i++) {
      opciones..add(
        ListTile(
          leading: Icon(Icons.backup),
          title: Text('Item $i'),
          trailing: Icon(Icons.keyboard_arrow_right),
        )
      )
      ..add(Divider(color: Colors.blue,));
    }
    return opciones;
  }
}