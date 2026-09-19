import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/perfil_store.dart';
import 'pantalla_editar_perfil.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')), backgroundColor: Colors.grey.shade50,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),

          child: Column(

            children: [
              const SizedBox(height: 24),

              // Avatar circular con la inicial del nombre
              CircleAvatar(radius: 40, backgroundColor: Colors.green.shade700,
                child: Text(PerfilStore.nombre.isNotEmpty ? PerfilStore.nombre[0].toUpperCase() : '?',
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold,),),
              ),
              const SizedBox(height: 16),

              Text(PerfilStore.nombre, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 4),

              Text(PerfilStore.casa, style: GoogleFonts.inter(fontSize: 14, color: Colors.black54,),),
              const SizedBox(height: 32),

              // Tarjeta con los datos, en formato "fila con ícono"
              Container(
                width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(12),),
                child: Column(
                  children: [
                    _FilaDato(icono: Icons.person, etiqueta: 'Nombre', valor: PerfilStore.nombre,),
                    const Divider(height: 1, color: Colors.black12),
                    _FilaDato(icono: Icons.home, etiqueta: 'Casa', valor: PerfilStore.casa,),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity, child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaEditarPerfil(),),);
                  },

                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: Text('Editar Perfil', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
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

// Widget reutilizable: una fila con ícono + etiqueta + valor
class _FilaDato extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final String valor;

  const _FilaDato({
    required this.icono,
    required this.etiqueta,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(

        children: [
          Icon(icono, color: Colors.green.shade700, size: 22),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(etiqueta, style: GoogleFonts.inter(fontSize: 12, color: Colors.black54,),),
                const SizedBox(height: 2),

                Text(valor, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
