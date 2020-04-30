
import 'package:flutter/material.dart';

// Paginas
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';


// Para transformarlo a mapa
Map<String, WidgetBuilder> getApllicationRouter() {


return <String, WidgetBuilder>{
  '/'     : ( BuildContext context ) => HomePage(),
  'alert' : ( BuildContext context ) => AlertPage(),
  'avatar': ( BuildContext context ) => AvatarPage(),
  'card': ( BuildContext context ) => CardPage(),
  'inputs': ( BuildContext context ) => InputPage(),
  'sliders': ( BuildContext context ) => SliderPage(),
  'animatedContainer': ( BuildContext context ) => AnimatedContainerPage(),
};


  
}

