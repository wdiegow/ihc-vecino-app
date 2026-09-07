class PerfilStore {
  PerfilStore._();

  static String nombre = 'Mateo';
  static String casa = 'Casa #24';

  static void actualizarPerfil({
    required String nuevoNombre,
    required String nuevaCasa,
  }) {
    nombre = nuevoNombre;
    casa = nuevaCasa;
  }
}
