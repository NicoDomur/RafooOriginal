import 'package:flutter/material.dart';
import 'package:flutter_rafood/screens/alert_screen.dart';

class TarjetaPersonalizableTipo3 extends StatelessWidget {
  const TarjetaPersonalizableTipo3(
      {super.key, required this.titulo, required this.descripcion});

  final String titulo;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          leading: const Icon(
            Icons.wallet_giftcard_rounded,
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
                onPressed: () {
                  final ruta = MaterialPageRoute(
                      builder: (context) => const AlertScreen());
                  Navigator.push(context, ruta);
                },
                child: const Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
