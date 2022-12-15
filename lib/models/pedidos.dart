class Pedidos {
  int id;
  String nomComida;
  int precio;
  int porcion;
  String rutaImagen;
  String fechaPedido;
  String fechaEntrega;
  int cantidad;
  int costoTotal;
  String comenExtra;
  Pedidos({
    required this.id,
    required this.nomComida,
    required this.precio,
    required this.porcion,
    required this.rutaImagen,
    required this.fechaPedido,
    required this.fechaEntrega,
    required this.cantidad,
    required this.costoTotal,
    required this.comenExtra,
  });
  factory Pedidos.fromJson(Map json) {
    return Pedidos(
      id: json["idpedidos"],
      nomComida: json["nombre_comida"],
      precio: json["precio"],
      porcion: json["porcion"],
      rutaImagen: json["ruta_imagen"],
      fechaPedido: json["fecha_pedido"],
      fechaEntrega: json["fecha_entrega"],
      cantidad: json["cantidad"],
      costoTotal: json["costo_total"],
      comenExtra: json["comentarios_extra"],
    );
  }
}
