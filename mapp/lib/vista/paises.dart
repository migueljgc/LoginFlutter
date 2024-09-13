import 'package:flutter/material.dart';
import 'package:mapp/Servicio/PaisesServicio.dart';

class Paises extends StatefulWidget {
  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<Paises> {
  late Future<List<Country>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    // Inicializamos la carga de países
    _countriesFuture = paisesServicio().fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Países'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Country>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Muestra un loader mientras se carga
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar países'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay países disponibles'));
          } else {
            // Muestra la lista de países y bandera
            List<Country> countries = snapshot.data!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return ListTile(
                leading: Image.network(
                countries[index].flag, // Muestra la bandera del país
                width: 50, // Ancho de la bandera
                height: 30, // Alto de la bandera
                errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // Muestra un icono si la bandera no carga
                },
                ),
                title: Text(countries[index].name), // Muestra el nombre del país
                );
              },
            );
          }
        },
      ),
    );
  }
}
