import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/perfil_store.dart';
import '../../data/pagos_store.dart';
import '../control_acceso/pantalla_control_acceso.dart';
import '../areas_comunes/pantalla_areas_comunes.dart';
import '../pagos/pantalla_pagar_expensas.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade50,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 16),
            Text('CONDOMINIO', style: GoogleFonts.inter(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2,),),
            const SizedBox(height: 32),

            CircleAvatar(radius: 32, backgroundColor: Colors.green.shade700,
              child: Text(PerfilStore.nombre.isNotEmpty ? PerfilStore.nombre[0].toUpperCase() : '?', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,),),),
            const SizedBox(height: 16),

            Text('Bienvenido de vuelta', style: GoogleFonts.inter(color: Colors.black54, fontSize: 14,),),
            const SizedBox(height: 4),

            Text('${PerfilStore.nombre} · ${PerfilStore.casa}', style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 40),

            // Botón: Control de Acceso
            SizedBox(
              width: double.infinity, child: ElevatedButton.icon(
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaControlAcceso(),),);
                setState(() {});
              },

              icon: const Icon(Icons.shield, color: Colors.white),
              label: Text('Control de Acceso', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),

            ),
            ),
            const SizedBox(height: 24),

            // Botón: Reservar Áreas Comunes
            SizedBox(
              width: double.infinity, child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaAreasComunes(),),);
              },

              icon: const Icon(Icons.sports_soccer, color: Colors.white),
              label: Text('Reservar Áreas Comunes', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),

            ),
            ),
            const SizedBox(height: 24),

            // Botón: Pagar Expensas
            SizedBox(
              width: double.infinity, child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaPagarExpensas(),),);
              },

              icon: const Icon(Icons.payments, color: Colors.white),
              label: Text('Pagar Expensas', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),

              ),
            ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
