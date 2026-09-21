class VisitasStore {
  VisitasStore._();

  static final List<Map<String, String>> visitas = [
    {
      'tipo': 'Delivery',
      'nombre': 'Juan Perez',
      'fechaHora': 'Hoy - 14:30',
      'estado': 'Pendiente',
    },
    {
      'tipo': 'Visita',
      'nombre': 'Ana Gomez',
      'fechaHora': 'Ayer - 10:00',
      'estado': 'Ingresó',
    },
  ];

  // Cantidad de visitas actualmente en estado "Pendiente"
  static int get visitasPendientes =>
      visitas.where((v) => v['estado'] == 'Pendiente').length;

  static void agregarVisita({
    required String tipo,
    required String nombre,
    required String fecha,
    required String hora,
  }) {
    visitas.insert(0, {
      'tipo': tipo,
      'nombre': nombre,
      'fechaHora': '$fecha - $hora',
      'estado': 'Pendiente',
    });
  }

  // Cambia el estado de una visita a Cancelado
  static void cancelarVisita(int index) {
    visitas[index]['estado'] = 'Cancelado';
  }
}
