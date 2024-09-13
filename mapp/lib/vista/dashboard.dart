import 'package:flutter/material.dart';
import 'package:mapp/vista/login.dart';
import 'package:mapp/vista/paises.dart';
import 'package:mapp/controlador/loginControler.dart';
import 'package:mapp/main.dart';

class Dashboard extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu), // Icono de menú
              onPressed: () {
                // Abrir o cerrar el drawer cuando se hace clic en el ícono
                if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
                  // Si el drawer está abierto, se cierra
                  Navigator.of(context).pop();
                } else {
                  // Si el drawer está cerrado, se abre
                  _scaffoldKey.currentState?.openDrawer();
                }
              },
            ),
            Text("Dasboard",
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
        backgroundColor: Colors.black,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Paises'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Paises()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Salir'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Contenido del Dashboard',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}