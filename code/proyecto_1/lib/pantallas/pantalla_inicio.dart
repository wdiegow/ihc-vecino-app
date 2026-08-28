import 'package:flutter/material.dart';
import 'pantalla_nueva_autorizacion.dart';
import 'pantalla_mis_visitas.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
        child: Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(4),),


          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            const Text('CONTROL ACCESO', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2,),),
            const SizedBox(height: 32),

            const Text('Hola, Mateo', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 16,),),
            const SizedBox(height: 4),


            const Text('Casa #24', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 16,),),
            const SizedBox(height: 24),


            const Text('2 visitas esperadas', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 14,),),
            const SizedBox(height: 32),

            // BOTON NUEVA AUTORIZACION FLUJO-V0.1
            SizedBox(width: double.infinity, child: OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PantallaNuevaAutorizacion(),),
                );
              },
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black), padding: const EdgeInsets.symmetric(vertical: 14),),
              child: const Text('+ Nueva autorización', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 14,),),
            ),
            ),


            const SizedBox(height: 40), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // NUEVO FLUJO - FLUJO-V0.2
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PantallaMisVisitas(),),
                  );
                },
                child: const Text('Mis visitas', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 14,),),
              ),


              TextButton(
                onPressed: () {
                  // Sin uso todavia :)
                },
                child: const Text('Perfil', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 14,),),
              ),
            ],


            ),
          ],


          ),
        ),
      ),
      ),
    );
  }
}