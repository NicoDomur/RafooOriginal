import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/widgets/widgets.dart';

class ComidaScreen extends StatefulWidget {
  const ComidaScreen({
    Key? key,
    required this.id,
    required this.nombreComida,
    required this.descComida,
    required this.precio,
    required this.categoria,
    required this.rutaImg,
  }) : super(key: key);

  final int id;
  final String nombreComida;
  final String descComida;
  final int precio;
  final String categoria;
  final String rutaImg;

  @override
  State<ComidaScreen> createState() => _ComidaScreenState();
}

class _ComidaScreenState extends State<ComidaScreen> {
  int _contador = 1;

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

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              MaterialButton(
                onPressed: _quitar,
                child: const Icon(Icons.remove),
              ),
              //const SizedBox(width: 10),
              Text(
                _contador.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              //const SizedBox(width: 10),
              MaterialButton(
                onPressed: _anadir,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Añadir a pedidos')),
          )
        ],
      ),
    );
  }
}
