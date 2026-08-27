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
}
