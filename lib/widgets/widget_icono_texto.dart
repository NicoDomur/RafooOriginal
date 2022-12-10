import 'package:flutter/material.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';
import 'package:flutter_rafood/widgets/widget_texto_chico.dart';

class IconoTexto extends StatelessWidget {
  final IconData icono;
  final String texto;
  final Color colorIcono;
  const IconoTexto(
      {super.key,
      required this.icono,
      required this.texto,
      required this.colorIcono});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icono,
          color: colorIcono,
          size: Dimensiones.tamIcono24,
        ),
        const SizedBox(width: 5),
        TextoChico(texto: texto),
      ],
    );
  }
}
