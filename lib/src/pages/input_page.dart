import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  
 
// Para poder poner la fecha en el campo de fecha
  TextEditingController _inputFieldDateController = new TextEditingController();

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
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearPersona(),
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
      subtitle: Text('Email: $_email'),
    );

  }

  Widget _crearEmail() {

    return TextField(

      // Estableciendo campo de email
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        // Bordes del contenedor
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(20.0)
         ),
      ),
      // Capturando valor de la caja de texto
      onChanged: (valor) => setState(() {
          _email = valor;
        })
      

    );

  }

  Widget _crearPassword() {
    
     return TextField(

      // Para no poder ver los caracteres
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        labelText: 'password',
        helperText: 'password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        // Bordes del contenedor
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(20.0)
         ),
      ),
      // Capturando valor de la caja de texto
      onChanged: (valor) => setState(() {
          _email = valor;
        })
      

    );

  }

  Widget _crearFecha( BuildContext context ) {
    return TextField(

      enableInteractiveSelection: false,
      // Controldor para poner la fecha en el campo de texto fecha
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        helperText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
        // Bordes del contenedor
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(20.0)
         ),
      ),
      // Capturando valor de la caja de texto
      onTap: (){

        // Quitar el foco de la caja de texto
        FocusScope.of(context).requestFocus( new FocusNode() );
        _selectDate( context );

      },
      

    );

  }

  // Para seleccionar fecha
  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),

      // Poniendo picker en español
      locale: Locale('es', 'ES')
    );

    // Al seleccionar la fecha
    if( picked != null ) {
      setState(() {
        _fecha = picked.toString();

        // Llenando caja de texto
        _inputFieldDateController.text = _fecha;
      });
    }

  }
}