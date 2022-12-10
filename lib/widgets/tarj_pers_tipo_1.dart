import 'package:flutter/material.dart';

class TarjetaPersonalizableTipo1 extends StatelessWidget {
  const TarjetaPersonalizableTipo1(
      {super.key, required this.titulo, required this.descripcion});

  final String titulo;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          leading: const Icon(
            Icons.access_alarm_rounded,
          ),
          title: Text(titulo),
          subtitle: Text(descripcion),
          contentPadding:
              const EdgeInsets.only(right: 30, left: 30, bottom: 0, top: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Ok"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Cancelar"),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
