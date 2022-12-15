import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rafood/models/models.dart';
import 'package:flutter_rafood/share_preferences/preferences.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';
import 'package:flutter_rafood/widgets/app_columna.dart';
import 'package:http/http.dart' as http;

class PantallaPedidos extends StatefulWidget {
  const PantallaPedidos({super.key});

  @override
  State<PantallaPedidos> createState() => _PantallaPedidosState();
}

class _PantallaPedidosState extends State<PantallaPedidos> {
  final url =
      Uri.parse('http://192.168.0.199:8083/pedidos/${Preferences.name}');
  static late Future<List<Pedidos>> pedidos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pedidos>>(
      future: pedidos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: Dimensiones.vistaPagina,
                    child: Stack(
                      children: [
                        Container(
                          height: 175,
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.data![index].rutaImagen),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.only(
                              left: 50,
                              right: 50,
                              bottom: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade100,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: Dimensiones.alto15,
                                left: Dimensiones.ancho15,
                                right: Dimensiones.ancho15,
                              ),
                              child: AppColumna(
                                texto: snapshot.data![index].nomComida,
                                costoTotal: snapshot.data![index].costoTotal,
                                fechaEntrega:
                                    snapshot.data![index].fechaEntrega,
                                cantidad: snapshot.data![index].cantidad,
                                comentarioExtra:
                                    snapshot.data![index].comenExtra,
                              ), //aqui va appcolumn no se que
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error al traer los datos"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    pedidos = obtenerPedidos();
  }

  Future<List<Pedidos>> obtenerPedidos() async {
    try {
      print(url);
      final res = await http.get(url);
      final lista = List.from(jsonDecode(res.body));

      List<Pedidos> pedidoss = [];
      for (var element in lista) {
        final Pedidos pedidos = Pedidos.fromJson(element);
        pedidoss.add(pedidos);
      }
      print(pedidoss);
      return pedidoss;
    } catch (e) {
      return [];
    }
  }
}
