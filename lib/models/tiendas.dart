class Tiendas {
  int id;
  String nomTienda;
  String rutaImagen;
  String propietario;
  String horario;
  Tiendas({
    required this.id,
    required this.nomTienda,
    required this.rutaImagen,
    required this.propietario,
    required this.horario,
  });
  factory Tiendas.fromJson(Map json) {
    return Tiendas(
      id: json["id_tienda"],
      nomTienda: json["nombre_tienda"],
      rutaImagen: json["ruta_imagen_tienda"],
      propietario: json["propietario"],
      horario: json["horario"],
    );
  }
}
