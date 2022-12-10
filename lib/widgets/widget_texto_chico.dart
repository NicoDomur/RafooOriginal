import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextoChico extends StatelessWidget {
  final Color? color;
  final String texto;
  double tamanio;
  double ancho;
  TextoChico({
    super.key,
    this.color = Colors.black,
    required this.texto,
    this.tamanio = 12,
    this.ancho = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        color: color,
        fontSize: tamanio,
        height: ancho,
      ),
    );
  }
}
