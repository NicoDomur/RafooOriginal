import 'package:flutter/material.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';

// ignore: must_be_immutable
class TextoGrande extends StatelessWidget {
  final Color? color;
  final String texto;
  double tamanio;
  TextOverflow overflow;
  TextoGrande({
    super.key,
    this.color = Colors.black,
    required this.texto,
    this.tamanio = 0,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Ubuntu',
        color: color,
        fontSize: tamanio == 0 ? Dimensiones.fuente18 : tamanio,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
