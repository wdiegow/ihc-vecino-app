import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/perfil_store.dart';
import 'pantalla_perfil.dart';

class PantallaConfirmacionPerfil extends StatelessWidget {
  const PantallaConfirmacionPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade50,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.green.shade50, shape: BoxShape.circle,), child: Icon(Icons.check_circle, color: Colors.green.shade700, size: 56,),
              ),
              const SizedBox(height: 24),

              Text('PERFIL ACTUALIZADO', textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 32),

              // Avatar con los nuevos datos
              CircleAvatar(radius: 40, backgroundColor: Colors.green.shade700,
                  child: Text(PerfilStore.nombre.isNotEmpty ? PerfilStore.nombre[0].toUpperCase() : '?',
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold,),),),
              const SizedBox(height: 16),

              Text(PerfilStore.nombre, textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 4),

              Text(PerfilStore.casa, textAlign: TextAlign.center, style: GoogleFonts.inter(color: Colors.black54, fontSize: 15,),),
              const SizedBox(height: 64),

              //BOTON VOLVER A PERFIL
              SizedBox(
                width: double.infinity, child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PantallaPerfil(),), (route) => route.isFirst,);
                  },

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                  child: Text('Volver a Perfil', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
