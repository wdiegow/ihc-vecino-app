import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/reservas_store.dart';

class PantallaMisReservas extends StatelessWidget {
  const PantallaMisReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Reservas')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ReservasStore.reservas.isEmpty
                ? Center(
              child: Text(
                'Aún no tienes reservas',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            )
                : ListView.separated(
              itemCount: ReservasStore.reservas.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                final reserva = ReservasStore.reservas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reserva['area']!.toUpperCase(),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${reserva['fecha']} - ${reserva['hora']}',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
