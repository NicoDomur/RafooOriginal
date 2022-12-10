import 'package:flutter/material.dart';
import 'package:flutter_rafood/services/servicios.dart';
import 'package:flutter_rafood/share_preferences/preferences.dart';
import 'package:flutter_rafood/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final autenticacion = Provider.of<Autenticacion>(context, listen: false);

    return ListView(
      children: [
        const SizedBox(height: 15),
        const CircleAvatar(
          maxRadius: 50,
          backgroundImage: NetworkImage(
              'https://assets.pokemon.com/assets/cms2/img/pokedex/full/376_f2.png'),
        ),
        const SizedBox(height: 10),
        Center(child: Text("Hola ${Preferences.name}")),
        const SizedBox(height: 15),
        //tarjeta3
        const TarjetaPersonalizableTipo3(
            titulo: 'Cupones',
            descripcion: 'Consulta de cupones o tarjetas de regalo.'),
        const TarjetaPersonalizableTipo3(
            titulo: 'Metodo de pago',
            descripcion: 'Añade o actualiza un metodo de pago.'),
        const SizedBox(height: 15),
        FloatingActionButton.extended(
          onPressed: () {
            autenticacion.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
          label: const Text('Cerrar sesion'),
          icon: const Icon(Icons.logout_rounded),
        ),
      ],
    );
  }
}
