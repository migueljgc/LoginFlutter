class Usuario {
  String correo;
  String contrasena;

  Usuario({required this.correo, required this.contrasena});

  // Método para validar el formato del email
  bool isEmailValid() {
    return correo.contains('@');
  }

  // Método para validar el password (mínimo 6 caracteres)
  bool isPasswordValid() {
    return contrasena.length >= 6;
  }

  // Simular autenticación con un servidor
  Future<bool> authenticate() async {
    // Aquí podrías agregar lógica para llamar a un API
    if (correo == 'miguel@gmail.com' && contrasena == '123456') {
      return true;
    } else {
      return false;
    }
  }
}