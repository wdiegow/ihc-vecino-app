import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late final TextEditingController _correoController;
  late final TextEditingController _celularController;

  String? _nombreError;
  String? _casaError;
  String? _correoError;
  String? _celularError;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: PerfilStore.nombre);
    // Precargo solo los dígitos que ya tenga guardados (ej: 'Casa #24' -> '24')
    _casaController = TextEditingController(text: PerfilStore.casa.replaceAll(RegExp(r'[^0-9]'), ''),);
    _correoController = TextEditingController(text: PerfilStore.correo);
    _celularController = TextEditingController(text: PerfilStore.celular);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')), backgroundColor: Colors.grey.shade50,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 8),

            //ICONO AVATAR CIRCULAR
            Center(
              child: Stack(
                children: [
                  CircleAvatar(radius: 40, backgroundColor: Colors.green.shade700,
                    child: Text(PerfilStore.nombre.isNotEmpty ? PerfilStore.nombre[0].toUpperCase() : '?',
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold,),),),
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

            TextField(controller: _casaController, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], decoration: InputDecoration(prefixIcon: Icon(Icons.home, color: Colors.green.shade700), prefixText: 'Casa #', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),), errorText: _casaError,),),
            const SizedBox(height: 24),

            Text('Correo electrónico', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 8),

            TextField(controller: _correoController, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(prefixIcon: Icon(Icons.email, color: Colors.green.shade700), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),), errorText: _correoError,),),
            const SizedBox(height: 24),

            Text('Número de celular', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 8),

            TextField(controller: _celularController, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], decoration: InputDecoration(prefixIcon: Icon(Icons.phone, color: Colors.green.shade700), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),), errorText: _celularError,),),
            const SizedBox(height: 40),

            //BOTON GUARDAR CAMBIOS
            SizedBox(
              width: double.infinity, child: ElevatedButton(
              onPressed: () {

                //VALIDACIONES
                setState(() {
                  _nombreError = _nombreController.text.isEmpty ? 'Debe introducir un nombre' : null;
                  _casaError = _casaController.text.isEmpty ? 'Debe introducir un número de casa' : null;
                  _correoError = _correoController.text.isEmpty ? 'Debe introducir un correo' : (!_correoController.text.contains('@') || !_correoController.text.contains('.')) ? 'Correo inválido' : null;
                  _celularError = _celularController.text.isEmpty ? 'Debe introducir un número de celular' : null;
                });

                if (_nombreError != null || _casaError != null || _correoError != null || _celularError != null) {
                  return;
                }

                //ACTUALIZA LOS DATOS
                PerfilStore.actualizarPerfil(
                  nuevoNombre: _nombreController.text,
                  nuevaCasa: 'Casa #${_casaController.text}',
                  nuevoCorreo: _correoController.text,
                  nuevoCelular: _celularController.text,
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
