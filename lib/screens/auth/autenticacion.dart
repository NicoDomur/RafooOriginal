import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Autenticacion extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCvYi5CSb2pxKqj5eMnYnnnaZo7HA5LX5U';

  final storage = FlutterSecureStorage();

  Future<String?> crearUsuario(String correo, String contrasena) async {
    final Map<String, dynamic> datosAuth = {
      'email': correo,
      'password': contrasena,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final res = await http.post(url, body: json.encode(datosAuth));
    final Map<String, dynamic> resDecode = json.decode(res.body);

    if (resDecode.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: resDecode['idToken']);
      return null;
    } else {
      return resDecode['error']['message'];
    }
  }

  Future<String?> iniciarSesion(String correo, String contrasena) async {
    final Map<String, dynamic> datosAuth = {
      'email': correo,
      'password': contrasena,
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final res = await http.post(url, body: json.encode(datosAuth));
    final Map<String, dynamic> resDecode = json.decode(res.body);

    if (resDecode.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: resDecode['idToken']);
      return null;
    } else {
      return resDecode['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'idToken');
  }

  Future<String> leerToken() async => await storage.read(key: 'idToken') ?? '';
}
