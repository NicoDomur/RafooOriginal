import 'package:flutter/material.dart';
import 'package:flutter_rafood/screens/auth/login.dart';
import 'package:flutter_rafood/screens/principal_screen.dart';
import 'package:flutter_rafood/services/servicios.dart';
import 'package:provider/provider.dart';

class VerificarAutenticacionScreen extends StatelessWidget {
  const VerificarAutenticacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servAutenticacion =
        Provider.of<Autenticacion>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: servAutenticacion.leerToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const Text('Verificando, espere...');
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const PantallaLogin(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const PrincipalScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
