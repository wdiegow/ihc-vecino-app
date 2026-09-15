import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/reservas_store.dart';
import 'pantalla_confirmacion_reserva.dart';

class PantallaReservarHorario extends StatefulWidget {
  final String area;

  const PantallaReservarHorario({
    super.key,
    required this.area,
  });

  @override
  State<PantallaReservarHorario> createState() =>
      _PantallaReservarHorarioState();
}

class _PantallaReservarHorarioState extends State<PantallaReservarHorario> {
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  String? _fechaError;
  String? _horaError;

  @override
  void dispose() {
    _fechaController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservar')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.area.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                Text(
                  'Fecha',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _fechaController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'DD/MM/AAAA',
                    suffixIcon: const Icon(Icons.calendar_today),
                    errorText: _fechaError,
                  ),
                  onTap: () async {
                    final DateTime? fechaElegida = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (fechaElegida != null) {
                      final String fechaFormateada =
                          '${fechaElegida.day.toString().padLeft(2, '0')}/'
                          '${fechaElegida.month.toString().padLeft(2, '0')}/'
                          '${fechaElegida.year}';
                      setState(() {
                        _fechaController.text = fechaFormateada;
                      });
                    }
                  },
                ),
                const SizedBox(height: 24),

                Text(
                  'Hora',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _horaController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'HH:MM',
                    suffixIcon: const Icon(Icons.access_time),
                    errorText: _horaError,
                  ),
                  onTap: () async {
                    final TimeOfDay? horaElegida = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (horaElegida != null) {
                      final String horaFormateada =
                          '${horaElegida.hour.toString().padLeft(2, '0')}:'
                          '${horaElegida.minute.toString().padLeft(2, '0')}';
                      setState(() {
                        _horaController.text = horaFormateada;
                      });
                    }
                  },
                ),
                const SizedBox(height: 40),

                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _fechaError = _fechaController.text.isEmpty
                              ? 'Debe elegir una fecha'
                              : null;
                          _horaError = _horaController.text.isEmpty
                              ? 'Debe elegir una hora'
                              : null;
                        });

                        if (_fechaError != null || _horaError != null) {
                          return;
                        }

                        ReservasStore.agregarReserva(
                          area: widget.area,
                          fecha: _fechaController.text,
                          hora: _horaController.text,
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PantallaConfirmacionReserva(
                              area: widget.area,
                              fecha: _fechaController.text,
                              hora: _horaController.text,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Reservar',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
