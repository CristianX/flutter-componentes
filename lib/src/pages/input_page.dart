import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(

      // autofocus: true,

      // Capitalización por espacios
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        counter: Text('Caractéres ${ _nombre.length }'),
        hintText: 'Nombre completo',
        labelText: 'Nombre',
        helperText: 'Nombre completo',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        // Bordes del contenedor
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(20.0)
         ),
      ),
      // Capturando valor de la caja de texto
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      }

    );

  }

  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre: $_nombre'),
    );

  }
}