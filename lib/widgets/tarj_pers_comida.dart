import 'package:flutter/material.dart';
import 'package:flutter_rafood/routes/app_routes.dart';
import 'package:flutter_rafood/screens/screens.dart';

class TarjetaPersonalizableComida extends StatelessWidget {
  const TarjetaPersonalizableComida({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.imagenComida,
    required this.id,
    required this.precio,
    required this.ubicacion,
    required this.categoria,
  });

  final int id;
  final String titulo;
  final String descripcion;
  final String imagenComida;
  final int precio;
  final String ubicacion;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    //GESTURE DETECTOR LO AÑADI YO
    return GestureDetector(
      child: Card(
        child: Column(children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg/640px-001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(titulo),
            subtitle: Text(descripcion),
            contentPadding:
                const EdgeInsets.only(right: 30, left: 30, bottom: 20, top: 20),
          ),
          /*
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.menuOpciones[1].ruta);
                  },
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
              ],
            ),
          ),
          */
        ]),
      ),
      onTap: () {
        //Navigator.pushNamed(context, AppRoutes.menuOpciones[1].ruta);
        final ruta = MaterialPageRoute(
            builder: (context) => ComidaScreen(
                  id: id,
                  categoria: categoria,
                  descComida: descripcion,
                  nombreComida: titulo,
                  precio: precio,
                  ubicacion: ubicacion,
                  imagenComida: imagenComida,
                ));
        Navigator.push(context, ruta);
      },
    );
    /*Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Card(
        child: ListTile(
          leading: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg/640px-001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg',
              fit: BoxFit.cover),
          title: const Text('Hola'),
          subtitle: const Text("Videos"),
          trailing: const Icon(Icons.arrow_forward_rounded),
        ),
      ),
    );*/
  }
}
