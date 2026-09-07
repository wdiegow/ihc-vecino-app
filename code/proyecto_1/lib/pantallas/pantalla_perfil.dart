import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/perfil_store.dart';
import 'pantalla_editar_perfil.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Perfil')), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                Text('MI PERFIL', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 40),

                Text('Nombre', style: GoogleFonts.inter(fontSize: 14, color: Colors.black54,),),
                const SizedBox(height: 8),

                Text(PerfilStore.nombre, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 24),

                Text('Casa', style: GoogleFonts.inter(fontSize: 14, color: Colors.black54,),),
                const SizedBox(height: 8),

                Text(PerfilStore.casa, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 64),

                //BOTON EDITAR PEFIL
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(

                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaEditarPerfil(),),);
                    },

                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                    child: Text('Editar Perfil', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
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
