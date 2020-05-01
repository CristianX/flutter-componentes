
import 'package:flutter/material.dart';

// Libreria de async
import 'dart:async';

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

  // Variable que evalua cuando esta cargando
  bool _isloading = false;

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
        // _agregar10();
        // Traer información
        fetchData();
      }

    });
    
  }

  // Destruyendo ScrollController para evitar multiples pedidos de este ya que escucha todos los scroll y quedan guardados cuando sale de la pagina
  // evita fugas de memoria
  @override
  void dispose() { 
    
    super.dispose();

    // vaciando _scrollController
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      // Stack apila todos juntos uno encima de otro
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ), 
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

  // Simulando delay
  Future<Null> fetchData()  async {

    _isloading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    new Timer(duration, respuestaHTTP);

  }

  void respuestaHTTP(){

    _isloading = false;

    // Moviendo scroll para indicar que hay mas registros
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    _agregar10();

  }

  Widget _crearLoading() {
    if( _isloading ) {
      return Column(
        // Poniendo carga en la parte de abajo
        mainAxisSize:  MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()

            ],
          ),
          SizedBox( height: 15.0 )
        ],
      );
    } else {
      // Si no carga se regresa un contenedor vacio por que siempre se debe regresar un widget
      return Container();
    }
  }

}