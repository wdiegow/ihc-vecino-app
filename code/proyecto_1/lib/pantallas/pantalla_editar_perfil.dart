import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/perfil_store.dart';
import 'pantalla_confirmacion_perfil.dart';

class PantallaEditarPerfil extends StatefulWidget {
  const PantallaEditarPerfil({super.key});

  @override
  State<PantallaEditarPerfil> createState() => _PantallaEditarPerfilState();
}

class _PantallaEditarPerfilState extends State<PantallaEditarPerfil> {
  late final TextEditingController _nombreController;
  late final TextEditingController _casaController;
  String? _errorNombre;
  String? _errorCasa;

  @override
  void initState() {
    super.initState();
    // Prellena los campos con los datos actuales del residente
    _nombreController = TextEditingController(text: PerfilStore.nombre);
    _casaController = TextEditingController(text: PerfilStore.casa);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Editar Perfil')), backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),

            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                Text('EDITAR PERFIL', style: GoogleFonts.inter(color: Color(0xFF143125), fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 32),

                Text('Nombre', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                //TEXTEFIELD NOMBRE
                TextField(controller: _nombreController, decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _errorNombre,
                  errorStyle: const TextStyle(color: Color(0xFFFF0000)),
                  errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0000))),
                  focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0000))),
                ),),
                const SizedBox(height: 24),

                Text('Casa', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                //TEXTFIELD CASA
                TextField(controller: _casaController, decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _errorCasa,
                  errorStyle: const TextStyle(color: Color(0xFFFF0000)),
                  errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0000))),
                  focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0000))),
                ),),
                const SizedBox(height: 40),

                //BOTON GUARDAR
                Center(
                  child: SizedBox(width: double.infinity, child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _errorNombre = _nombreController.text.trim().isEmpty ? 'Debe introducir un nombre' : null;
                          _errorCasa = _casaController.text.trim().isEmpty ? 'Debe introducir un numero de casa' : null;
                        });
                        if (_errorNombre != null || _errorCasa != null) return;
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
