import 'package:flutter/material.dart';

class WidgetComida extends StatelessWidget {
  const WidgetComida({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
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
              title: const Text('titulo'),
              subtitle: const Text('descripcion'),
              contentPadding: const EdgeInsets.only(
                  right: 30, left: 30, bottom: 20, top: 20),
            ),
          ]),
        ),
        onTap: () {
          /*
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
              */
        },
      ),
    );
  }
}
