import 'package:flutter/material.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkmode})
      : currentTheme =
            isDarkmode ? TemaAplicacion.darkTheme : TemaAplicacion.lightTheme;

  setLightMode() {
    currentTheme = TemaAplicacion.lightTheme;
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = TemaAplicacion.darkTheme;
    notifyListeners();
  }
}
