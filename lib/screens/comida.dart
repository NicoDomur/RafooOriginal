class Comida {
  int id;
  String nomComida;
  String descComida;
  int tamaPorcion;
  String categoria;
  String ubicacion;
  int precio;
  String comExtra;
  Comida({
    required this.id,
    required this.nomComida,
    required this.descComida,
    required this.tamaPorcion,
    required this.categoria,
    required this.ubicacion,
    required this.precio,
    required this.comExtra,
  });

  factory Comida.fromJson(Map json) {
    return Comida(
      id: json["id"],
      nomComida: json["nombre_comida"],
      descComida: json["descripcion_ingredientes"],
      tamaPorcion: json["tamanio_porcion"],
      categoria: json["categoria"],
      ubicacion: json["ubicacion"],
      precio: json["precio"],
      comExtra: json["comentarios_extra"],
    );
  }
}
