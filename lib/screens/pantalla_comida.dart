import 'dart:convert';
import 'package:flutter_rafood/widgets/tarj_pers_comida.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_rafood/models/comida.dart';

class PantallaComida extends StatefulWidget {
  const PantallaComida({super.key, required this.numTienda});
  final int numTienda;

  @override
  State<PantallaComida> createState() => _PantallaComidaState();
}

class _PantallaComidaState extends State<PantallaComida> {
  late final int _numTienda = widget.numTienda;
  //final url = Uri.parse('http://192.168.0.199:8083/comida');
  final String url = 'http://192.168.0.199:8083/comida';
  static late Future<List<Comida>> comidas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda')),
      body: FutureBuilder<List<Comida>>(
        future: comidas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print(snapshot.data);
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
                  llaveIdTiendas: snapshot.data![index].llaveIdTiendas,
                  rutaImg: snapshot.data![index].rutaImg,
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error al traer los datos"),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    comidas = obtenerComida();
  }

  Future<List<Comida>> obtenerComida() async {
    try {
      final res = await http.get(Uri.parse('$url/$_numTienda'));
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
