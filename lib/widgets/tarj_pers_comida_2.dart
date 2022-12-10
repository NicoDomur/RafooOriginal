import 'package:flutter/material.dart';

class TarjetaPersonalizableComida2 extends StatelessWidget {
  const TarjetaPersonalizableComida2(
      {super.key,
      required this.titulo,
      required this.descripcion,
      required this.id,
      required this.imagenComida,
      required this.precio,
      required this.ubicacion,
      required this.categoria});

  /*
  final String urlImagenes;
  final String titulo;
  final String descripcion;
  */
  final int id;
  final String titulo;
  final String descripcion;
  final String imagenComida;
  final int precio;
  final String ubicacion;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        FadeInImage(
          image: NetworkImage(imagenComida),
          placeholder: const AssetImage('assets/img/gifCargaImg.gif'),
          width: double.infinity,
          height: 100,
          fit: BoxFit.cover,
        ),
        ListTile(
          leading: const Icon(
            Icons.food_bank_rounded,
          ),
          title: Text(titulo),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(descripcion),
              const SizedBox(height: 5),
              Text('Categoria: $categoria'),
              const SizedBox(height: 5),
              Text('Costo: \$$precio MXN'),
              const SizedBox(height: 5),
              Text('Ubicación: $ubicacion'),
            ],
          ),
          contentPadding:
              const EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 20),
        ),
      ]),
    );
  }
}
