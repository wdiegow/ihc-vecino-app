import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pantalla_reservar_horario.dart';
import 'pantalla_mis_reservas.dart';

class PantallaAreasComunes extends StatelessWidget {
  const PantallaAreasComunes({super.key});

  // Lista fija de áreas disponibles, cada una con su ícono representativo
  static const List<Map<String, dynamic>> _areas = [
    {'nombre': 'Cancha Multiusos', 'icono': Icons.sports_soccer},
    {'nombre': 'Churrasquera', 'icono': Icons.outdoor_grill},
    {'nombre': 'Salón de Eventos', 'icono': Icons.celebration},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Áreas Comunes')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elige un área para reservar',
                style: GoogleFonts.inter(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),

              ..._areas.map((area) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PantallaReservarHorario(
                              area: area['nombre'] as String,
                            ),
                          ),
                        );
                      },
                      child: Ink(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              area['icono'] as IconData,
                              color: Colors.green.shade700,
                              size: 32,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    area['nombre'] as String,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Toca para reservar',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: 16),

              // Botón para ver el historial de reservas
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaMisReservas(),
                      ),
                    );
                  },
                  icon: Icon(Icons.event_note, color: Colors.green.shade700),
                  label: Text(
                    'Ver Mis Reservas',
                    style: GoogleFonts.inter(
                      color: Colors.green.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green.shade700, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
