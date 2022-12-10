import 'package:flutter/material.dart';
import 'package:flutter_rafood/providers/theme_provider.dart';
import 'package:flutter_rafood/routes/app_routes.dart';

import 'package:flutter_rafood/screens/screens.dart';
import 'package:flutter_rafood/services/servicios.dart';
import 'package:flutter_rafood/share_preferences/preferences.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Autenticacion()),
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rafood',
      home: const PrincipalScreen(),
      initialRoute: AppRoutes.rutaInicial,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      /*
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme()
      ),
      */
      //theme: TemaAplicacion.darkTheme,
      scaffoldMessengerKey: Notificacion.messengerKey,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
