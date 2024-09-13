import 'package:flutter/material.dart';
import 'package:mapp/Servicio/PaisesServicio.dart';

class Paises extends StatefulWidget {
  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<Paises> {
  late Future<List<String>> _countriesFuture;

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
      body: FutureBuilder<List<String>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Muestra un loader mientras se carga
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar países'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay países disponibles'));
          } else {
            // Muestra la lista de países
            List<String> countries = snapshot.data!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(countries[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
