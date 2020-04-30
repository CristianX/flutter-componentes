import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {


double _valorSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only( top: 50.0 ),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400,
      onChanged: ( valor ){

        setState(() {
          _valorSlider = valor;
        });
        

      },
    );

  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.hondaprokevin.com%2Fpictures%2F2017-CBR250RR-2%2F2017-honda-cbr250rr-review-specs-cbr-250-rr-sport-bike-motorcycle-cbr250-250rr-supersport-8.jpg&f=1&nofb=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }
}