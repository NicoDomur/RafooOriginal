import 'package:flutter/material.dart';

class TemaAplicacion {
  static const Color fab = Colors.teal;

  static const Color primarioDark = Colors.black;
  static const Color secundarioDark = Colors.white;
  static const Color tercerDark = Colors.teal;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: secundarioDark,
    appBarTheme: const AppBarTheme(
      color: primarioDark,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primarioDark,
      foregroundColor: secundarioDark,
      highlightElevation: 0,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: tercerDark,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primarioDark,
      selectedItemColor: tercerDark,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: tercerDark,
      ),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    scaffoldBackgroundColor: primarioDark,
  );

  static const Color primarioLight = Colors.teal;
  static const Color secundariolight = Colors.black;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(onSurface: Colors.white),
    primaryColor: secundariolight,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: primarioLight),
      foregroundColor: primarioLight,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
      foregroundColor: primarioLight,
      highlightElevation: 0,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primarioLight,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primarioLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarioLight,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
