import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rafood/models/tiendas.dart';
import 'package:flutter_rafood/screens/pantalla_comida.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';
import 'package:flutter_rafood/widgets/app_columna.dart';
import 'package:flutter_rafood/widgets/tarj_pers_comida.dart';
import 'package:flutter_rafood/widgets/text_widget.dart';
import 'package:flutter_rafood/widgets/widget_icono_texto.dart';
import 'package:flutter_rafood/widgets/widget_texto_chico.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:http/http.dart' as http;

import '../../widgets/widget_texto_grande.dart';

class PantallaTiendas extends StatefulWidget {
  const PantallaTiendas({super.key});

  @override
  State<PantallaTiendas> createState() => _PantallaTiendasState();
}

class _PantallaTiendasState extends State<PantallaTiendas> {
  final url = Uri.parse('http://192.168.0.199:8083/tiendas');
  static late Future<List<Tiendas>> tiendas;
  PageController pc = PageController(viewportFraction: 0.85);
  var _tarjetaActual = 0.0;
  final _factorEscala = 0.8;
  final double _altura = Dimensiones.vistaPaginaContainer;

  @override
  void dispose() {
    super.dispose();
    pc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tiendas>>(
      future: tiendas,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensiones.ancho20,
                    right: Dimensiones.ancho20,
                    top: Dimensiones.alto10,
                    bottom: Dimensiones.alto10,
                  ),
                  child: Container(
                    width: 300,
                    height: 110,
                    padding: EdgeInsets.only(
                      left: Dimensiones.ancho10,
                      right: Dimensiones.ancho10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(Dimensiones.radio15),
                    ),
                    child: Row(
                      children: [
                        //imagen secccion
                        Container(
                          width: Dimensiones.listaVistaImgTamanio,
                          height: Dimensiones.listaVistaImgTamanio,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensiones.radio15),
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.data![index].rutaImagen),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: Dimensiones.ancho10,
                            right: Dimensiones.ancho10,
                          ),
                          width: 205,
                          height: 90,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextoGrande(
                                  texto: snapshot.data![index].nomTienda),
                              SizedBox(height: Dimensiones.alto10),
                              //TextoChico(texto: snapshot.data![index].horario),
                              IconoTexto(
                                icono: Icons.timer_outlined,
                                texto: snapshot.data![index].horario,
                                colorIcono: Colors.red,
                              ),
                              SizedBox(height: Dimensiones.alto10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconoTexto(
                                    icono: Icons.location_on_sharp,
                                    texto: 'FES Aragón',
                                    colorIcono: TemaAplicacion.fab,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  final ruta = MaterialPageRoute(
                      builder: (context) => PantallaComida(
                            numTienda: snapshot.data![index].id,
                          ));
                  Navigator.push(context, ruta);
                },
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
    pc.addListener(() {
      setState(() {
        _tarjetaActual = pc.page!;
      });
    });
    tiendas = obtenerTiendas();
  }

  Future<List<Tiendas>> obtenerTiendas() async {
    try {
      final res = await http.get(url);
      final lista = List.from(jsonDecode(res.body));

      List<Tiendas> tiendas = [];
      for (var element in lista) {
        final Tiendas tienda = Tiendas.fromJson(element);
        tiendas.add(tienda);
      }
      return tiendas;
    } catch (e) {
      return [];
    }
  }

  Widget _paginasItem(int i) {
    Matrix4 matrix = Matrix4.identity();
    if (i == _tarjetaActual.floor()) {
      var escalaActual = 1 - (_tarjetaActual - i) * (1 - _factorEscala);
      var transicionActual = _altura * (1 - escalaActual) / 2;
      matrix = Matrix4.diagonal3Values(1, escalaActual, 1)
        ..setTranslationRaw(0, transicionActual, 0);
    } else if (i == _tarjetaActual.floor() + 1) {
      var escalaActual =
          _factorEscala + (_tarjetaActual - i + 1) * (1 - _factorEscala);
      var transicionActual = _altura * (1 - escalaActual) / 2;
      matrix = Matrix4.diagonal3Values(1, escalaActual, 1);
      matrix = Matrix4.diagonal3Values(1, escalaActual, 1)
        ..setTranslationRaw(0, transicionActual, 0);
    } else if (i == _tarjetaActual.floor() - 1) {
      var escalaActual = 1 - (_tarjetaActual - i) * (1 - _factorEscala);
      var transicionActual = _altura * (1 - escalaActual) / 2;
      matrix = Matrix4.diagonal3Values(1, escalaActual, 1);
      matrix = Matrix4.diagonal3Values(1, escalaActual, 1)
        ..setTranslationRaw(0, transicionActual, 0);
    } else {
      var escalaActual = 0.8;
      matrix = Matrix4.diagonal3Values(1, escalaActual, 1)
        ..setTranslationRaw(0, _altura * (1 - _factorEscala) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensiones.vistaPaginaContainer,
            margin: EdgeInsets.only(
                left: Dimensiones.ancho10, right: Dimensiones.ancho10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(Dimensiones.radio15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.ytimg.com/vi/T9eD3oxl9mM/maxresdefault.jpg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensiones.vistaPaginaTextContainer,
              margin: EdgeInsets.only(
                left: Dimensiones.ancho30,
                right: Dimensiones.ancho30,
                bottom: Dimensiones.alto30,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: BorderRadius.circular(Dimensiones.radio15),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensiones.alto15,
                  left: Dimensiones.ancho15,
                  right: Dimensiones.ancho15,
                ),
                child: AppColumna(
                  texto: 'Prueba de texto',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
