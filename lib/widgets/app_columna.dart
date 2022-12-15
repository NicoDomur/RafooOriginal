import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';
import 'package:flutter_rafood/widgets/widget_icono_texto.dart';
import 'package:flutter_rafood/widgets/widget_texto_chico.dart';
import 'package:flutter_rafood/widgets/widget_texto_grande.dart';

class AppColumna extends StatelessWidget {
  final String texto;
  int cantidad;
  String fechaEntrega;
  int costoTotal;
  String comentarioExtra;
  AppColumna({
    super.key,
    required this.texto,
    this.fechaEntrega = 'Sin especificar',
    this.costoTotal = 0,
    this.cantidad = 0,
    this.comentarioExtra = 'SC',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextoGrande(texto: texto, tamanio: Dimensiones.fuente18),
        SizedBox(height: Dimensiones.alto10),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return const Icon(Icons.star,
                    color: TemaAplicacion.fab, size: 15);
              }),
            ),
            SizedBox(width: Dimensiones.ancho10),
            TextoChico(texto: '5'),
            SizedBox(width: Dimensiones.ancho10),
            TextoChico(texto: 'Califiacion'),
          ],
        ),
        SizedBox(height: Dimensiones.alto10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconoTexto(
                icono: Icons.details_rounded,
                texto: '\$$costoTotal, $cantidad producto(s)',
                colorIcono: Colors.purple),
          ],
        ),
        SizedBox(height: Dimensiones.alto10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconoTexto(
                icono: Icons.calendar_month_rounded,
                texto:
                    '${fechaEntrega.split('T')[0]} - ${fechaEntrega.split('T')[1].substring(0, 5)}',
                colorIcono: Colors.red),
          ],
        ),
        SizedBox(height: Dimensiones.alto10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconoTexto(
                icono: Icons.comment_rounded,
                texto: 'Comentarios: $comentarioExtra',
                colorIcono: Colors.cyan),
          ],
        ),
      ],
    );
  }
}
