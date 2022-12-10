import 'package:get/get.dart';

/*
Parte fundamental para hacer medidas dinamicas para telefonos mas chicos.
844
*/

class Dimensiones {
  static double alturaPantalla = Get.context!.height;
  static double anchoPantalla = Get.context!.width;

  static double vistaPagina = alturaPantalla / 2.85;
  static double vistaPaginaContainer = alturaPantalla / 3.84;
  static double vistaPaginaTextContainer = alturaPantalla / 7.03;

  static double alto10 = alturaPantalla / 84.4;
  static double alto15 = alturaPantalla / 56.27;
  static double alto20 = alturaPantalla / 42.2;
  static double alto30 = alturaPantalla / 28.13;

  static double ancho10 = alturaPantalla / 84.4;
  static double ancho15 = alturaPantalla / 56.27;
  static double ancho20 = alturaPantalla / 42.2;
  static double ancho30 = alturaPantalla / 28.13;

  static double fuente14 = alturaPantalla / 60.2;
  static double fuente18 = alturaPantalla / 46.9;
  static double fuente24 = alturaPantalla / 35.17;

  static double radio15 = alturaPantalla / 56.26;

  static double tamIcono24 = alturaPantalla / 35.17;
  static double tamIcono16 = alturaPantalla / 52.75;

  //list view size
  static double listaVistaImgTamanio = anchoPantalla / 3.25;
  static double listaVistaTextoContTamanio = alturaPantalla / 3.9;

  //comida popular
  static double comidaPopularImgTamanio = alturaPantalla / 2.30;
}
