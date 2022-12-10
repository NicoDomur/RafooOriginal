import 'package:flutter/material.dart';

class TarjetaPersonalizableTipo2 extends StatelessWidget {
  const TarjetaPersonalizableTipo2({super.key, required this.urlImagenes});

  final String urlImagenes;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        FadeInImage(
          image: NetworkImage(urlImagenes),
          placeholder: const AssetImage('assets/img/gifCargaImg.gif'),
          width: double.infinity,
          height: 230,
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}
