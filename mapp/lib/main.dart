import 'package:flutter/material.dart';
import 'package:mapp/controlador/loginControler.dart';
import 'package:mapp/vista/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          LoginController controller = LoginController(context: context);
          return Login(onLoginPressed: controller.onLoginPressed);
        },
      ),
    );
  }
}
