import 'package:flutter/material.dart';
import 'package:flutter_rafood/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rafood"),
      ),
      body: ListView(
        children: const [
          TarjetaPersonalizableTipo1(
            titulo: 'Titulo 2',
            descripcion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam venenatis orci nunc, ut accumsan urna volutpat eget. Nullam porttitor lobortis neque, nec ornare velit egestas eu. In hac habitasse platea dictumst.',
          ),
          SizedBox(height: 15),
          TarjetaPersonalizableTipo2(
            urlImagenes:
                'https://media.gq.com.mx/photos/5ced746cd09b9ae227169147/16:9/w_2560%2Cc_limit/GettyImages-688974829.jpg',
          ),
          SizedBox(height: 15),
          TarjetaPersonalizableTipo2(
            urlImagenes:
                'https://www.elsoldesinaloa.com.mx/circulos/pc6ow7-quesabirria-sinaloa/ALTERNATES/LANDSCAPE_960/quesabirria-sinaloa',
          ),
          SizedBox(height: 15),
          TarjetaPersonalizableTipo1(
            titulo: 'Titulo 2',
            descripcion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam venenatis orci nunc, ut accumsan urna volutpat eget. Nullam porttitor lobortis neque, nec ornare velit egestas eu. In hac habitasse platea dictumst.',
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
