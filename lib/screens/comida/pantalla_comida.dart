import 'dart:convert';
import 'package:flutter_rafood/widgets/tarj_pers_comida.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_rafood/screens/comida.dart';

class PantallaComida extends StatefulWidget {
  const PantallaComida({super.key});

  @override
  State<PantallaComida> createState() => _PantallaComidaState();
}

class _PantallaComidaState extends State<PantallaComida> {
  final url = Uri.parse('http://192.168.0.199:8083/comida');
  static late Future<List<Comida>> comidas;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comida>>(
      future: comidas,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //return Text(snapshot.data![index].nomComida);
                return TarjetaPersonalizableComida(
                  id: snapshot.data![index].id,
                  titulo: snapshot.data![index].nomComida,
                  descripcion: snapshot.data![index].descComida,
                  imagenComida: 'imagenComida',
                  categoria: snapshot.data![index].categoria,
                  precio: snapshot.data![index].precio,
                  ubicacion: snapshot.data![index].ubicacion,
                );
              });
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error al traer los datos"),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    comidas = obtenerComida();
  }

  Future<List<Comida>> obtenerComida() async {
    try {
      final res = await http.get(url);
      final lista = List.from(jsonDecode(res.body));

      List<Comida> comidas = [];
      for (var element in lista) {
        final Comida comida = Comida.fromJson(element);
        comidas.add(comida);
      }
      return comidas;
    } catch (e) {
      return [];
    }
  }
}
