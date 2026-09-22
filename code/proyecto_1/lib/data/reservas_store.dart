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

  // Revisa si ya existe una reserva para esa área/fecha dentro de un rango de 2 horas
  static bool horarioOcupado({
    required String area,
    required String fecha,
    required String hora,
  }) {
    final int horaSolicitada = int.parse(hora.split(':')[0]);

    for (final reserva in reservas) {
      final bool mismaArea = reserva['area'] == area;
      final bool mismaFecha = reserva['fecha'] == fecha;

      if (mismaArea && mismaFecha) {
        final int horaExistente = int.parse(reserva['hora']!.split(':')[0]);
        final int diferencia = (horaSolicitada - horaExistente).abs();

        if (diferencia < 2) {
          return true;
        }
      }
    }
    return false;
  }
}
