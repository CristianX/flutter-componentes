
import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          // Bordes redondeados
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta( context ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        onPressed: () {
          // Regresando a home
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta( BuildContext context ) {
    showDialog(
      // Obligatorio mandar context
      context: context,
      // Para que se cierre cuando se hace click fuera
      barrierDismissible: true,
      // Se encarga el dialog popup de la alerta
      builder: ( context ) {
        return AlertDialog(
          // Bordes redondeados
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
          title: Text('Título'),
          content: Column(
            // Evitar que la tarjeta se estire por toda la pantalla
            // MainAxisSize.min para que se adapte al contenido interno
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de alerta'),
              // Añadiendo logo de flutter
              FlutterLogo( size: 100.0)
            ],
          ),
          // Añadiendo botones a la alerta
          actions: <Widget>[
            FlatButton(
              // Saliendo a pantalla anterior
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('Cancelar')
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('Ok')
            )
          ],
        );
      }
    );
  }

}