import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pantalla_nueva_autorizacion.dart';
import 'pantalla_mis_visitas.dart';
import 'pantalla_perfil.dart';
import '../data/perfil_store.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
        child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            Text('CONTROL ACCESO', style: GoogleFonts.inter(color: Color(0xFF174D3A), fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2,),),
            const SizedBox(height: 32),

            Text('Hola, ${PerfilStore.nombre}', style: GoogleFonts.inter(color: Colors.black, fontSize: 16,),),
            const SizedBox(height: 8),


            Text(PerfilStore.casa, style: GoogleFonts.inter(color: Colors.black, fontSize: 16,),),
            const SizedBox(height: 24),


            Text('2 visitas esperadas', style: GoogleFonts.inter(color: Colors.black, fontSize: 14,),),
            const SizedBox(height: 32),


            //BOTON NUEVA AUTO
            SizedBox(width: double.infinity, child: OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PantallaNuevaAutorizacion(),),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
              child: Text('+ Nueva autorización', style: GoogleFonts.inter(color: Colors.white, fontSize: 14,),),
            ),
            ),


            const SizedBox(height: 40), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

              //MENU MIS VISITAS
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PantallaMisVisitas(),),
                  );
                },
                child: Text('Mis visitas', style: GoogleFonts.inter(color: Colors.black, fontSize: 14,),),
              ),

              //MENU PERFIL
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PantallaPerfil(),),
                  );
                },
                child: Text('Perfil', style: GoogleFonts.inter(color: Colors.black, fontSize: 14,),),
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
