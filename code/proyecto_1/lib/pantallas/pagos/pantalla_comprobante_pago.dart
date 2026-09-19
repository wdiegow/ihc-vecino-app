import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/pagos_store.dart';
import 'pantalla_pagar_expensas.dart';

class PantallaComprobantePago extends StatelessWidget {
  final String metodo;

  const PantallaComprobantePago({
    super.key,
    required this.metodo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

            child: Column(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(Icons.check_circle, color: Colors.green.shade700, size: 64,),
                const SizedBox(height: 24),

                Text('PAGO REALIZADO', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 40),

                Text(PagosStore.mesActual, textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                Text(PagosStore.montoExpensa, textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                Text(metodo, textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black54, fontSize: 14,),),
                const SizedBox(height: 64),

                //BOTON VOLVER A PAGAR EXPENSAS
                SizedBox(
                  width: double.infinity, child: OutlinedButton(

                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PantallaPagarExpensas(),), (route) => route.isFirst,);
                    },

                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                    child: Text('Volver a Pagar Expensas', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
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
