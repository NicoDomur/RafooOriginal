import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';

class ListV1Screen extends StatelessWidget {
  final opciones = const ['opcion 1', 'opcion 2', 'opcion 3', 'opcion 4'];

  const ListV1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rafood"),
          leading: const BackButton(color: TemaAplicacion.fab),
        ),
        body: ListView(
          children: [
            //... sirve para no sé xd
            ...opciones
                .map((opc) => ListTile(
                      title: Text(opc),
                    ))
                .toList(),
          ],
        ));
  }
}
