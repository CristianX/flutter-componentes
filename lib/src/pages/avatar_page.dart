
import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.huffpost.com%2Fgen%2F1233973%2Fimages%2Fo-NIKOLA-TESLA-facebook.jpg&f=1&nofb=1'),
              radius: 25.0,
            ),
          ),

          Container(
            // Anadiendo margenes (Solo margen a la derecha)
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text('NT'),
              backgroundColor: Colors.brown,
              
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          // Imagen que se carga por defecto antes de llamar a la NetworkImage
          placeholder: AssetImage('assets/original.gif'), 
          // Duracion
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.gqMbfOvueVBWdOIeYK-eBQHaES%26pid%3DApi&f=1')
        ),
      ),
    );
  }
}