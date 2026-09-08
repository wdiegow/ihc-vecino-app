import 'package:flutter/material.dart';
import '../data/visitas_store.dart';
import 'pantalla_confirmacion_cancelacion.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaDetalleVisita extends StatelessWidget {
  final int index;
  final String tipo;
  final String nombre;
  final String fechaHora;
  final String estado;

  const PantallaDetalleVisita({
    super.key,
    required this.index,
    required this.tipo,
    required this.nombre,
    required this.fechaHora,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    final bool esPendiente = estado == 'Pendiente';

    return Scaffold(appBar: AppBar(title: const Text('Detalle'),), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
        child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

          child: Column(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(tipo.toUpperCase(), textAlign: TextAlign.center, style: GoogleFonts.inter( fontSize: 22, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 32),

              Text(nombre, textAlign: TextAlign.center, style: GoogleFonts.inter( fontSize: 18,),),
              const SizedBox(height: 8),

              Text(fechaHora, textAlign: TextAlign.center, style: GoogleFonts.inter( fontSize: 18,),),
              const SizedBox(height: 24),

              Text('Estado:', style: GoogleFonts.inter( fontSize: 14,),),
              const SizedBox(height: 8),

              Text(estado == 'Ingresó' ? 'INGRESÓ' : estado.toUpperCase(),
                style: GoogleFonts.inter( fontSize: 18, fontWeight: FontWeight.bold, color: esPendiente ? Color(0xFFF7AE12) : estado == 'Cancelado' ? Colors.red : Color(0xFF37CD00),),),
              const SizedBox(height: 64),

              // BOTON CANCELAR, SOLO SI ES "PENDIENTE"
              if (esPendiente)
                SizedBox(width: double.infinity, child: OutlinedButton(
                  onPressed: () {
                    VisitasStore.cancelarVisita(index);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PantallaConfirmacionCancelacion(),),);
                  },

                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF3B30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                  child: Text('Cancelar autorización', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
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
