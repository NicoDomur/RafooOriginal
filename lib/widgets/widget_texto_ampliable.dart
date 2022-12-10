import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';
import 'package:flutter_rafood/widgets/widget_texto_chico.dart';

class TextoAmpliableWidget extends StatefulWidget {
  final String texto;
  const TextoAmpliableWidget({super.key, required this.texto});

  @override
  State<TextoAmpliableWidget> createState() => _TextoAmpliableWidgetState();
}

class _TextoAmpliableWidgetState extends State<TextoAmpliableWidget> {
  late String primeraParte;
  late String segundaParte;

  bool textoEscondido = true;

  double tamMostrar = Dimensiones.alturaPantalla / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.texto.length > 1) {
      primeraParte = widget.texto.substring(0, tamMostrar.toInt());

      segundaParte =
          widget.texto.substring(tamMostrar.toInt() + 1, widget.texto.length);
    } else {
      primeraParte = widget.texto;
      segundaParte = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: segundaParte.isEmpty
          ? TextoChico(texto: primeraParte)
          : Column(
              children: [
                TextoChico(
                    texto: textoEscondido
                        ? ('$primeraParte ...')
                        : (primeraParte + segundaParte),
                    tamanio: Dimensiones.fuente14,
                    ancho: 1.5),
                InkWell(
                  onTap: () {
                    setState(() {
                      textoEscondido = !textoEscondido;
                    });
                  },
                  child: Row(
                    children: [
                      TextoChico(
                          texto: textoEscondido
                              ? 'Mas detalles'
                              : 'Menos detalles',
                          color: Colors.black),
                      Icon(
                          textoEscondido
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: Colors.black),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
