import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/pagos_store.dart';
import 'pantalla_comprobante_pago.dart';

class PantallaConfirmarPagoTarjeta extends StatelessWidget {
  final String metodo;

  const PantallaConfirmarPagoTarjeta({
    super.key,
    required this.metodo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmar Pago')), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(Icons.credit_card, color: Colors.green.shade700, size: 56,),
                const SizedBox(height: 24),

                Text('¿Estás seguro que quieres confirmar el pago de ''${PagosStore.montoExpensa} con $metodo?', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 64),

                //BOTON CONFIRMAR PAGO
                SizedBox(
                  width: double.infinity, child: ElevatedButton(

                    onPressed: () {
                      PagosStore.registrarPago(metodo);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PantallaComprobantePago(metodo: metodo,),),
                      );
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
