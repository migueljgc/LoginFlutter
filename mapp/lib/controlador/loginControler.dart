import 'package:flutter/material.dart';
import 'package:mapp/modelo/Usuario.dart';
import 'package:mapp/vista/dashboard.dart';

class LoginController {
  final BuildContext context;

  LoginController({required this.context});

  void onLoginPressed(String correo, String contrasena) async {
    Usuario usuario = Usuario(correo: correo, contrasena: contrasena);

    if (!usuario.isEmailValid()) {
      _showMessage("Correo no válido");
      return;
    }

    if (!usuario.isPasswordValid()) {
      _showMessage("Contraseña debe tener al menos 6 caracteres");
      return;
    }

    bool isAuthenticated = await usuario.authenticate();

    if (isAuthenticated) {
      _showMessage("Login exitoso");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
      // Navega a la siguiente pantalla, etc.
    } else {
      _showMessage("Login fallido. Credenciales incorrectas.");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
