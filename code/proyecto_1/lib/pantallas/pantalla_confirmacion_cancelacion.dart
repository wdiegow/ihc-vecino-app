import 'package:flutter/material.dart';
import 'pantalla_mis_visitas.dart';

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

                const Text('AUTORIZACION CANCELADA', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 16),

                const Text('El guardia ya no dejará pasar\na esta visita o delivery.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontFamily: 'monospace', fontSize: 14,),),
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
                    child: const Text('Volver a Mis Visitas', style: TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
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
