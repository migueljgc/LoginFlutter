import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final Function(String, String) onLoginPressed;

  Login({required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesion",
        style: TextStyle(
          color: Colors.white,
          
        )),
        backgroundColor: Colors.black,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: correoController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: contrasenaController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String correo = correoController.text;
                String contrasena = contrasenaController.text;
                onLoginPressed(correo, contrasena);
              },
              child: Text("Iniciar Sesion"),
            ),
          ],
        ),
      ),
    );
  }
}
