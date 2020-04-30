
import 'package:flutter/material.dart';
 
// Paquetes personalizados
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alert_page.dart';

// Internacionalización de flutter
import 'package:flutter_localizations/flutter_localizations.dart';

// Rutas
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Poniendo en español
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Español
        // ... other locales the app supports
      ],
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