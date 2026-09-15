class ReservasStore {
  ReservasStore._();

  // Lista de reservas registradas (2 de ejemplo, para que no se vea vacía al inicio)
  static final List<Map<String, String>> reservas = [
    {
      'area': 'Cancha Multiusos',
      'fecha': '16/09/2026',
      'hora': '18:00',
    },
    {
      'area': 'Salón de Eventos',
      'fecha': '20/09/2026',
      'hora': '15:00',
    },
  ];

  // Agrega una nueva reserva a la lista
  static void agregarReserva({
    required String area,
    required String fecha,
    required String hora,
  }) {
    reservas.insert(0, {
      'area': area,
      'fecha': fecha,
      'hora': hora,
    });
  }
}
