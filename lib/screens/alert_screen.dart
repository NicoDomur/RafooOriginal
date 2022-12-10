import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void dialogoAlerta(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Titulo"),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Estoy llorando xd"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Aceptar"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => dialogoAlerta(context),
          child: const Text("Mostrar alerta"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TemaAplicacion.fab,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.exit_to_app_rounded),
      ),
    );
  }
}
