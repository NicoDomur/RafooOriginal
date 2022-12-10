import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';

class Notificacion {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: const TextStyle(color: TemaAplicacion.fab),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
