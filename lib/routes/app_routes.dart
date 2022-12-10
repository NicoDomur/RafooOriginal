import 'package:flutter/material.dart';
import 'package:flutter_rafood/models/models.dart';
import 'package:flutter_rafood/screens/screens.dart';

class AppRoutes {
  static const rutaInicial = 'autenticacion';

  static final menuOpciones = <MenuOpciones>[
    MenuOpciones(
        ruta: 'principal',
        nombreRuta: 'Pantalla Principal',
        screen: const PrincipalScreen(),
        icono: Icons.home),
    /*
    MenuOpciones(
        ruta: 'comida',
        nombreRuta: 'Pantalla Comida',
        screen: const ComidaScreen(),
        icono: Icons.list_alt_rounded),
        */
    MenuOpciones(
        ruta: 'listv1',
        nombreRuta: 'Pantalla List View 1',
        screen: const ListV1Screen(),
        icono: Icons.list_rounded),
    MenuOpciones(
        ruta: 'aleret',
        nombreRuta: 'Pantalla Alerta',
        screen: const AlertScreen(),
        icono: Icons.error_outline),
    MenuOpciones(
        ruta: 'card',
        nombreRuta: 'Pantalla Tarjeta',
        screen: const CardScreen(),
        icono: Icons.credit_card_rounded),
    MenuOpciones(
        ruta: 'config',
        nombreRuta: 'Pantalla Configuracion',
        screen: const ConfiguracionScreen(),
        icono: Icons.settings),
    MenuOpciones(
        ruta: 'login',
        nombreRuta: 'Pantalla Login',
        screen: const PantallaLogin(),
        icono: Icons.login_rounded),
    MenuOpciones(
        ruta: 'registro',
        nombreRuta: 'Pantalla Registro',
        screen: const PantallaRegistro(),
        icono: Icons.app_registration_rounded),
    MenuOpciones(
        ruta: 'autenticacion',
        nombreRuta: 'Pantalla Autenticacion',
        screen: const VerificarAutenticacionScreen(),
        icono: Icons.attribution_rounded),
    MenuOpciones(
        ruta: 'tiendas',
        nombreRuta: 'Pantalla Tiendas',
        screen: const PantallaTiendas(),
        icono: Icons.shopping_basket_rounded),
  ];
//Lo de arriba, es lo mismo de abajo, pero con propiedades.
/*
  static Map<String, Widget Function(BuildContext)> rutas = {
    'principal': (context) => const PrincipalScreen(),
    'listv2': (context) => const ListV2Screen(),
    'listv1': (context) => const ListV1Screen(),
    'aleret': (context) => const AlertScreen(),
    'card': (context) => const CardScreen(),
  };
*/

  //con esto mandamos a recorrer las opciones del menuOpciones
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final opcion in menuOpciones) {
      appRoutes.addAll({opcion.ruta: (context) => opcion.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
