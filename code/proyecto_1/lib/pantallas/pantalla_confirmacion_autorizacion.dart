import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PantallaConfirmacionAutorizacion extends StatelessWidget {
  final String tipo;
  final String nombre;
  final String fecha;
  final String hora;

  String _generarDatosQR() {return 'Tipo: $tipo\nNombre: $nombre\nFecha: $fecha\nHora: $hora';}

  const PantallaConfirmacionAutorizacion({super.key,
    required this.tipo,
    required this.nombre,
    required this.fecha,
    required this.hora,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
        child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            // Título
            const Text('AUTORIZACION REGISTRADA', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 24, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 40),

            // Código QR
            QrImageView(data: _generarDatosQR(), version: QrVersions.auto, size: 200, backgroundColor: Colors.white,),
            const SizedBox(height: 24),

            // Tipo (Visita / Delivery)
            Text(tipo.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 20, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 32),

            // Nombre
            Text(nombre, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 18, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 8),

            // Fecha y hora juntas
            Text('$fecha - $hora', textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 18, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 64),

            // Botón Volver al Inicio
            SizedBox(width: double.infinity, child: OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const PantallaInicio(),), (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
              child: const Text('Volver al Inicio', style: TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
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
