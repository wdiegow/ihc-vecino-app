import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../data/pagos_store.dart';
import 'pantalla_comprobante_pago.dart';

class PantallaConfirmarPagoQr extends StatelessWidget {
  final String metodo;

  const PantallaConfirmarPagoQr({
    super.key,
    required this.metodo,
  });

  // Genera un texto aleatorio para simular un QR de pago (solo para el MVP)
  String _generarCodigoQR() {
    final int numeroAleatorio = Random().nextInt(999999);
    return 'PAGO-$numeroAleatorio-${PagosStore.montoExpensa}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pago por QR')), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Escanea este código para pagar ${PagosStore.montoExpensa}', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 32),

                QrImageView(data: _generarCodigoQR(), version: QrVersions.auto, size: 200, backgroundColor: Colors.white,),
                const SizedBox(height: 16),

                Text('Saca captura a esta pantalla y realiza tu pago', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 12, color: Colors.black54,),),
                const SizedBox(height: 64),

                //BOTON CONFIRMAR PAGO
                SizedBox(
                  width: double.infinity, child: ElevatedButton(

                    onPressed: () {
                      PagosStore.registrarPago(metodo);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PantallaComprobantePago(metodo: metodo,),),);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                    child: Text('Confirmar Pago', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
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
