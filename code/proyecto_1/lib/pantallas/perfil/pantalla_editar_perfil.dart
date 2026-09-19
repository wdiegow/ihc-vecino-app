import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/perfil_store.dart';
import 'pantalla_confirmacion_perfil.dart';

class PantallaEditarPerfil extends StatefulWidget {
  const PantallaEditarPerfil({super.key});

  @override
  State<PantallaEditarPerfil> createState() => _PantallaEditarPerfilState();
}

class _PantallaEditarPerfilState extends State<PantallaEditarPerfil> {
  late final TextEditingController _nombreController;
  late final TextEditingController _casaController;

  String? _nombreError;
  String? _casaError;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: PerfilStore.nombre);
    _casaController = TextEditingController(text: PerfilStore.casa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')), backgroundColor: Colors.grey.shade50,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 8),

              // Avatar con ícono de "editar" superpuesto, para reforzar la acción
              Center(
                child: Stack(

                  children: [
                    CircleAvatar(radius: 40, backgroundColor: Colors.green.shade700,
                      child: Text(PerfilStore.nombre.isNotEmpty ? PerfilStore.nombre[0].toUpperCase() : '?',
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold,),),),

                    Positioned(bottom: 0, right: 0,
                      child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.green.shade700, width: 2,),),
                        child: Icon(Icons.edit, size: 14, color: Colors.green.shade700,),),),
                  ],

                ),
              ),
              const SizedBox(height: 32),

              Text('Nombre', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 8),

              TextField(controller: _nombreController, decoration: InputDecoration(prefixIcon: Icon(Icons.person, color: Colors.green.shade700), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),), errorText: _nombreError,),),
              const SizedBox(height: 24),

              Text('Casa', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 8),

              TextField(controller: _casaController, decoration: InputDecoration(prefixIcon: Icon(Icons.home, color: Colors.green.shade700), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),), errorText: _casaError,),),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity, child: ElevatedButton(
                  onPressed: () {

                    // Restricción de campos vacíos
                    setState(() {
                      _nombreError = _nombreController.text.isEmpty ? 'Debe introducir un nombre' : null;
                      _casaError = _casaController.text.isEmpty ? 'Debe introducir una casa' : null;
                    });

                    // Corta el botón si algo quedó vacío
                    if (_nombreError != null || _casaError != null) {
                      return;
                    }

                    PerfilStore.actualizarPerfil(
                      nuevoNombre: _nombreController.text,
                      nuevaCasa: _casaController.text,
                    );

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PantallaConfirmacionPerfil(),),);
                  },

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                  child: Text('Guardar Cambios', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
