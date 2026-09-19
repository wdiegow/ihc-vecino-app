class PagosStore {
  PagosStore._();

  // Monto fijo de la expensa mensual (dato de ejemplo para el MVP)
  static const String montoExpensa = 'Bs 350';

  // Mes actual, y si ya fue pagado o sigue pendiente
  static String mesActual = 'Septiembre 2026';
  static String estadoMesActual = 'Pendiente';

  // Historial de pagos ya realizados
  static final List<Map<String, String>> historial = [
    {
      'mes': 'Agosto 2026',
      'monto': montoExpensa,
      'metodo': 'Transferencia Bancaria',
      'fecha': '05/08/2026',
    },
    {
      'mes': 'Julio 2026',
      'monto': montoExpensa,
      'metodo': 'Tarjeta terminada en 4242',
      'fecha': '03/07/2026',
    },
  ];

  // Marca el mes actual como pagado, y lo agrega al historial
  static void registrarPago(String metodo) {
    estadoMesActual = 'Pagado';
    historial.insert(0, {
      'mes': mesActual,
      'monto': montoExpensa,
      'metodo': metodo,
      'fecha': _fechaHoy(),
    });
  }

  // Genera la fecha de hoy en formato DD/MM/AAAA
  static String _fechaHoy() {
    final DateTime hoy = DateTime.now();
    return '${hoy.day.toString().padLeft(2, '0')}/'
        '${hoy.month.toString().padLeft(2, '0')}/'
        '${hoy.year}';
  }
}
