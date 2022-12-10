import 'package:flutter/material.dart';
import 'package:flutter_rafood/models/product.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';
import 'package:flutter_rafood/widgets/app_columna.dart';
import 'package:flutter_rafood/widgets/text_widget.dart';
import 'package:flutter_rafood/widgets/widget_icono_texto.dart';
import 'package:flutter_rafood/widgets/widget_texto_chico.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../widgets/widget_texto_grande.dart';

class PantallaTiendas extends StatefulWidget {
  const PantallaTiendas({super.key});

  @override
  State<PantallaTiendas> createState() => _PantallaTiendasState();
}

class _PantallaTiendasState extends State<PantallaTiendas> {
  PageController pc = PageController(viewportFraction: 0.85);
  var _tarjetaActual = 0.0;
  final _factorEscala = 0.8;
  final double _altura = Dimensiones.vistaPaginaContainer;

  @override
  void initState() {
    super.initState();
    pc.addListener(() {
      setState(() {
        _tarjetaActual = pc.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensiones.vistaPagina,
          child: PageView.builder(
            controller: pc,
            itemCount: 5,
            itemBuilder: (context, posicion) {
              return _paginasItem(posicion);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _tarjetaActual,
          decorator: DotsDecorator(
            color: Colors.black26, // Inactive color
            activeColor: TemaAplicacion.fab,
            size: const Size.square(7.0),
            activeSize: const Size(14.0, 7.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(height: Dimensiones.alto30),
        Container(
          margin: EdgeInsets.only(left: Dimensiones.alto30),
          child: Row(
            children: [
              TextoGrande(
                texto: "Lugares asociados",
                tamanio: 26,
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
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
                  color: Colors.green,
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
                        color: Colors.white24,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://static.wikia.nocookie.net/vete-a-la-versh/images/f/fe/128b3abeaf2d591632a0bc598af49e36df8c0548_00.jpg/revision/latest?cb=20210626055915&path-prefix=es"),
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
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextoGrande(texto: 'Tacos de pito $index'),
                          SizedBox(height: Dimensiones.alto10),
                          TextoChico(texto: 'ingredientes'),
                          SizedBox(height: Dimensiones.alto10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              IconoTexto(
                                icono: Icons.location_on_sharp,
                                texto: 'Ubicacion',
                                colorIcono: Colors.indigo,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
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
                child: const AppColumna(
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
