import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  // Controla el scroll a voluntad
  ScrollController  _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();

  // Para agregar más imagenes
  int _ultmoItem = 0;

  // Etapa del ciclo de vida de la creación de un StateFulWidget
  @override
  void initState() { 
    super.initState();

    _agregar10();


    // Se disparara cada vez que se mueva el scroll
    _scrollController.addListener(() {
      
      // Analizando si llega al final
      // _scrollController.position.maxScrollExtent es largo máximo
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        _agregar10();
      }

    });
    
  }

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
      // Controlando scroll
      controller: _scrollController,
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
  // Al llamar al método, agrega 10 imagenes a la lista
  _agregar10() {


    setState(() {
      
      for (var i = 0; i < 10; i++) {

        _ultmoItem ++;
        _listaNumeros.add( _ultmoItem );
        
      }
    });

  }

}