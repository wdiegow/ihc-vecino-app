import 'package:flutter/material.dart';
import 'pantalla_mis_visitas.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaConfirmacionCancelacion extends StatelessWidget {
  const PantallaConfirmacionCancelacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                Icon(Icons.cancel, color: Colors.red.shade700, size: 64,),
                const SizedBox(height: 24),

                Text('AUTORIZACION CANCELADA', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 16),

                Text('El guardia ya no dejará pasar\na esta visita o delivery.', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black54, fontSize: 14,),),
                const SizedBox(height: 64),

                //B0T0N VOLVER A MIS VISITAS
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const PantallaMisVisitas(),), (route) => route.isFirst,);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                    child: Text('Volver a Mis Visitas', style: GoogleFonts.inter(color: Colors.white,  fontSize: 16, fontWeight: FontWeight.bold,),),
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
