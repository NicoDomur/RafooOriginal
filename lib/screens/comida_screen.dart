import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rafood/screens/screens.dart';
import 'package:flutter_rafood/share_preferences/preferences.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/widgets/widget_texto_grande.dart';
import 'package:flutter_rafood/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ComidaScreen extends StatefulWidget {
  const ComidaScreen({
    Key? key,
    required this.id,
    required this.nombreComida,
    required this.descComida,
    required this.precio,
    required this.categoria,
    required this.rutaImg,
    required this.numTienda,
  }) : super(key: key);

  final int id;
  final String nombreComida;
  final String descComida;
  final int precio;
  final String categoria;
  final String rutaImg;
  final int numTienda;

  @override
  State<ComidaScreen> createState() => _ComidaScreenState();
}

class _ComidaScreenState extends State<ComidaScreen> {
  int _contador = 1;
  int _totPrecio = 0;
  final url = Uri.parse('http://192.168.0.199:8083/pedidos');
  final comentAdi = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    comentAdi.dispose();
    super.dispose();
  }

  void dialogoAlerta(
      BuildContext context, String titulo, String texto, Icon icono) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icono,
              Text(texto),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'principal'),
              child: const Text("Aceptar"),
            )
          ],
        );
      },
    );
  }

  void _anadir() {
    setState(() {
      _contador++;
    });
  }

  void _quitar() {
    if (_contador > 1) {
      setState(() {
        _contador--;
      });
    }
  }

  void _totalPrecio(int precio, int totProd) {
    setState(() {
      _totPrecio = precio * totProd;
    });
  }

  @override
  Widget build(BuildContext context) {
    _totalPrecio(widget.precio, _contador);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles"),
      ),
      //como no utilizo las variables de abajo puedo reemplazar por guiones bajos
      body: ListView(
        children: [
          TarjetaPersonalizableComida2(
            titulo: widget.nombreComida,
            descripcion: widget.descComida,
            categoria: widget.categoria,
            id: widget.id,
            precio: widget.precio,
            rutaImg: widget.rutaImg,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextoGrande(
              texto: '¿Qué vamos a poner y a quitar?',
              color: TemaAplicacion.fab,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: TextField(
              controller: comentAdi,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Pon aqui comentarios adicionales',
              ),
            ),
          ),
          const SizedBox(height: 50),
          Center(child: TextoGrande(texto: 'Total: \$${_totPrecio.toString()}'))
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              /*
              MaterialButton(
                onPressed: _quitar,
                child: const Icon(Icons.remove),
              ),
              */
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: 'btnQuitar',
                onPressed: () {
                  _quitar();
                  _totalPrecio(widget.precio, _contador);
                },
                child: const Icon(Icons.remove),
              ),
              //const SizedBox(width: 10),
              const SizedBox(width: 10),
              Text(
                _contador.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: TemaAplicacion.fab,
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: 'btnAnadir',
                onPressed: () {
                  _anadir();
                  _totalPrecio(widget.precio, _contador);
                },
                child: const Icon(Icons.add),
              ),
              //const SizedBox(width: 10),
              /*
              MaterialButton(
                onPressed: _anadir,
                child: const Icon(Icons.add),
              ),
              */
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
                onPressed: () {
                  var horaActual = DateTime.now();
                  var horaEntrega = obtHoraEntrega();
                  genPedido(
                      comentAdi.text.length > 1 ? comentAdi.text : 'SC',
                      horaActual.toLocal().toString(),
                      horaEntrega.toString(),
                      widget.id,
                      _contador,
                      _totPrecio,
                      widget.numTienda);
                  dialogoAlerta(
                    context,
                    'A disfrutar',
                    'Pedido realizado con exito',
                    const Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.green,
                      size: 75,
                    ),
                  );
                },
                child: const Text('Añadir a pedidos')),
          ),
        ],
      ),
    );
  }

  DateTime obtHoraEntrega() {
    var timestamp = DateTime.now().millisecondsSinceEpoch + 1500000;
    final DateTime horaEntrega = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return horaEntrega;
  }

  Future<http.Response> genPedido(
    String comentarios,
    String fechaPedido,
    String fechaEntrega,
    int idComida,
    int cantidad,
    int precTot,
    int numTienda,
  ) async {
    return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'comentario': comentarios,
        'fecha_pedido': fechaPedido,
        'fecha_entrega': fechaEntrega,
        'id_tienda': numTienda,
        'idComida': idComida,
        'cantidad': cantidad,
        'precio_total': precTot,
        'nombre_usuario': Preferences.name,
      }),
    );
  }
}
