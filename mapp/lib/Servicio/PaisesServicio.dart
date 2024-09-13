import 'dart:convert'; // Para manejar la conversión de JSON a objetos de Dart
import 'package:http/http.dart' as http; // Importamos la librería http para hacer la solicitud

class paisesServicio {
  // API key para autenticar la solicitud
  final String _apiKey = 'f29bc4a506538b852112dd4a77b5e839';

  // Base URL de la API de CountryLayer
  final String _baseUrl = 'https://api.countrylayer.com/v2/all';

  // Método para hacer la solicitud HTTP y obtener la lista de países
  Future<List<String>> fetchCountries() async {
    // Construimos la URL con la llave de acceso incluida
    final response = await http.get(Uri.parse('$_baseUrl?access_key=$_apiKey'));

    // Verificamos si la respuesta es exitosa (código 200)
    if (response.statusCode == 200) {
      // Decodificamos el cuerpo de la respuesta que viene en formato JSON
      List<dynamic> data = jsonDecode(response.body);

      // Mapeamos la lista de países y extraemos solo el campo 'name' de cada país
      List<String> countryNames = data.map((country) => country['name'] as String).toList();

      // Retornamos la lista de nombres de países
      return countryNames;
    } else {
      // Si hubo un error, lanzamos una excepción
      throw Exception('Error al cargar los países');
    }
  }
}