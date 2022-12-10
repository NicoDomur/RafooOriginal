import 'package:flutter/material.dart'
    show IconData, Widget; //Solo importa IconData,
//no todo material.dart

class MenuOpciones {
  final String ruta;
  final IconData icono;
  final String nombreRuta;
  final Widget screen;

  MenuOpciones({
    required this.ruta,
    required this.icono,
    required this.nombreRuta,
    required this.screen,
  });
}
