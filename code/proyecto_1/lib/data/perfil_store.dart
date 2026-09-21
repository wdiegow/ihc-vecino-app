class PerfilStore {
  PerfilStore._();

  static String nombre = 'Mateo';
  static String casa = 'Casa #24';
  static String correo = 'mateo@gmail.com';
  static String celular = '77893712';

  static void actualizarPerfil({
    required String nuevoNombre,
    required String nuevaCasa,
    required String nuevoCorreo,
    required String nuevoCelular,
  }) {
    nombre = nuevoNombre;
    casa = nuevaCasa;
    correo = nuevoCorreo;
    celular = nuevoCelular;
  }
}
