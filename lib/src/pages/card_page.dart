import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        // EdgeInsets.all quiere decir que se pondra un padding en todos los lados
        padding: EdgeInsets.all(10),
        // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),

          // Poniendo espacio entre esta y otra tarjeta
          SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),

          _cardTipo1(),
           SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),
          _cardTipo1(),
           SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),
          _cardTipo1(),
           SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),
          _cardTipo1(),
           SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),
          _cardTipo1(),
           SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),
          _cardTipo1(),
           SizedBox( height: 30.0),
          _cardTipo2(),
          SizedBox( height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      // Sombra de la tarjeta
      elevation: 10.0,

      // Bordes
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),

      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancerlar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container( 

      // Para que ningun contenido de la tarjeta se salga de la mismoa
      // clipBehavior: Clip.antiAlias,


      child: Column(
        children: <Widget>[
          // Pantalla de carga de imagen
          FadeInImage(
            image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.photocdn.pt%2Fimages%2Farticles%2F2018%2F06%2F28%2Farticles%2F2017_8%2Fmountain_photography_tips.jpg&f=1&nofb=1'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            // Indica como la imagen debe ocupar el espacio
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.photocdn.pt%2Fimages%2Farticles%2F2018%2F06%2F28%2Farticles%2F2017_8%2Fmountain_photography_tips.jpg&f=1&nofb=1') 
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner')
            )
        ],
      ),
    );

    // Este container es como un div en html
    return Container(

      // Bordes de la tarjeta tipo 2
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,

        // Sombra de la tarjeta
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            // Que tanto se extiende
            spreadRadius: 2.0,

            // Posición
            offset: Offset(2.0, 10.0)
          )
        ]
      ),

      // Corta cualquier cosa fuera del contenedor
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}