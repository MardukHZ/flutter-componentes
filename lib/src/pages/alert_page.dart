import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.keyboard_backspace),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlert(context),
          color: Colors.blueAccent,
          textColor: Colors.white,
          shape: StadiumBorder(),
          child: Text('Mostrar Alerta'),
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Esto es una alerta'),
              FlutterLogo(size: 80.0,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.pop(context),
            )
          ],
          //content: ,

        );
      }


    );
  }
}