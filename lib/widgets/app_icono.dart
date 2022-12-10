import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';

class AppIcono extends StatelessWidget {
  final IconData icono;
  final Color backgroundColor;
  final Color iconoColor;
  final double tamanio;
  final double tamIcono;

  const AppIcono({
    Key? key,
    required this.icono,
    this.backgroundColor = Colors.white,
    this.iconoColor = TemaAplicacion.fab,
    this.tamanio = 40,
    this.tamIcono = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanio,
      height: tamanio,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(tamanio / 2),
          color: backgroundColor),
      child: Icon(
        icono,
        color: iconoColor,
        size: tamIcono,
      ),
    );
  }
}
