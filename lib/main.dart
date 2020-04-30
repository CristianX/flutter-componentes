
import 'package:flutter/material.dart';
 
// Paquetes personalizados
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alert_page.dart';


// Rutas
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      // Quitando indicación de debug
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      initialRoute: '/',
      routes: getApllicationRouter(),
      onGenerateRoute: ( settings ){
        print( 'Ruta llamada: ${ settings.name }' );

        return MaterialPageRoute(
          builder: ( BuildContext context) => AlertPage()
        );

      },
    );
  }
}