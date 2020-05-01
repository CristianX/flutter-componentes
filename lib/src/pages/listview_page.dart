import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _listaNumeros = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista(){
    return ListView.builder(
      itemCount: _listaNumeros.length,
      itemBuilder: ( BuildContext context, int index ){

        final imagen = _listaNumeros[index];

        return FadeInImage(
          image: NetworkImage('https://i.picsum.photos/id/$imagen/500/300.jpg'),
          placeholder: AssetImage('assets/original.gif'),
          // Alineando ancho de la imagen al gif
          fit: BoxFit.fitHeight,
          height: 300,
        );
      },
    );
  }
}