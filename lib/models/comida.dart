class Comida {
  int id;
  String nomComida;
  String descComida;
  int tamaPorcion;
  String categoria;
  int precio;
  String rutaImg;
  int llaveIdTiendas;
  Comida({
    required this.id,
    required this.nomComida,
    required this.descComida,
    required this.tamaPorcion,
    required this.categoria,
    required this.precio,
    required this.rutaImg,
    required this.llaveIdTiendas,
  });

  factory Comida.fromJson(Map json) {
    return Comida(
      id: json["idcomida"],
      nomComida: json["nombre_comida"],
      descComida: json["descripcion_ingredientes"],
      tamaPorcion: json["porcion"],
      categoria: json["categoria"],
      precio: json["precio"],
      rutaImg: json["ruta_imagen"],
      llaveIdTiendas: json["fk_idtiendas"],
    );
  }
}
