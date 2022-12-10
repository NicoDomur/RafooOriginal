import 'package:flutter/material.dart';
import 'package:flutter_rafood/routes/app_routes.dart';
import 'package:flutter_rafood/screens/screens.dart';
import 'package:flutter_rafood/widgets/widgets.dart';
import '../share_preferences/preferences.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    /*
    ListView(
      children: const [
        SizedBox(height: 10),
        TarjetaPersonalizableTipo1(
            titulo: 'Titulo 1',
            descripcion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam venenatis orci nunc, ut accumsan urna volutpat eget. Nullam porttitor lobortis neque, nec ornare velit egestas eu. In hac habitasse platea dictumst.'),
        //SizedBox(height: 10),
        TarjetaPersonalizableTipo2(
          urlImagenes:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg/640px-001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg',
        ),
        //SizedBox(height: 10),
        TarjetaPersonalizableTipo1(
            titulo: 'Titulo 2',
            descripcion:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam venenatis orci nunc, ut accumsan urna volutpat eget. Nullam porttitor lobortis neque, nec ornare velit egestas eu. In hac habitasse platea dictumst.'),
        SizedBox(height: 10),
      ],
    ),
    */
    Column(
      children: const [
        SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: PantallaTiendas(),
          ),
        ),
        SizedBox(height: 10),
      ],
    ),
    //const PantallaTiendas(),
    const PantallaComida(),
    const PantallaPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rafood"),
        actions: [
          Row(
            children: [
              const FloatingActionButton.small(
                heroTag: 'busqueda',
                onPressed: null,
                child: Icon(Icons.search),
              ),
              FloatingActionButton.small(
                heroTag: 'configuracion',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.menuOpciones[4].ruta);
                },
                child: const Icon(Icons.settings),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        elevation: 0,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
