import 'package:flutter/material.dart';
import 'package:flutter_rafood/providers/login_provider.dart';
import 'package:flutter_rafood/services/servicios.dart';
import 'package:flutter_rafood/theme/tema_aplicacion.dart';
import 'package:flutter_rafood/widgets/card_container.dart';
import 'package:flutter_rafood/widgets/fondo_login.dart';
import 'package:provider/provider.dart';

class PantallaLogin extends StatelessWidget {
  const PantallaLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FondoLogin(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Text('Iniciar sesion',
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginProvider(), child: _LoginForm())
            ],
          )),
          const SizedBox(height: 50),
          const Text(
            '¿Aún no tienes cuenta?',
            style: TextStyle(fontSize: 12),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
            child: const Text(
              'Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icon(Icons.alternate_email_rounded),
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no luce como un correo';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: '*****',
              labelText: 'Contraseña',
              prefixIcon: Icon(Icons.lock_outline),
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: TemaAplicacion.fab,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final servAutenticacion =
                        Provider.of<Autenticacion>(context, listen: false);

                    if (!loginForm.isValidForm()) return;

                    loginForm.isLoading = true;

                    final String? res = await servAutenticacion.iniciarSesion(
                        loginForm.email, loginForm.password);

                    if (res == null) {
                      Navigator.pushReplacementNamed(context, 'principal');
                    } else {
                      //print(res);
                      Notificacion.showSnackbar(res);
                      loginForm.isLoading = false;
                    }
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Espere' : 'Ingresar',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
