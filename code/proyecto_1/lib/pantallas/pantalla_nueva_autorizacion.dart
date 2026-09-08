import 'package:flutter/material.dart';
import 'pantalla_confirmacion_autorizacion.dart';
import '../data/visitas_store.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaNuevaAutorizacion extends StatefulWidget {
  const PantallaNuevaAutorizacion({super.key});

  @override
  State<PantallaNuevaAutorizacion> createState() => _PantallaNuevaAutorizacionState();
}

class _PantallaNuevaAutorizacionState
    extends State<PantallaNuevaAutorizacion> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  String _tipoSeleccionado = 'Visita';

  String? _nombreError;
  String? _fechaError;
  String? _horaError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Atrás'),), backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),


            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NUEVA AUTORIZACION', style:  GoogleFonts.inter(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 32),

                Text('Tipo', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                //DESPLEGABLE TIPO
                DropdownButtonFormField<String>(value: _tipoSeleccionado, decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),),
                  items: const [
                    DropdownMenuItem(value: 'Visita', child: Text('Visita')),
                    DropdownMenuItem(value: 'Delivery', child: Text('Delivery')),
                  ],
                  onChanged: (nuevoValor) {setState(() {_tipoSeleccionado = nuevoValor!;});},
                ),
                const SizedBox(height: 24),


                Text('Nombre', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                //TEXTFIELD NOMBRE
                TextField(controller: _nombreController, decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'Nombre completo', errorText: _nombreError,),),
                const SizedBox(height: 24),


                Text('Fecha', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                //ELEGIR FECHA
                TextField(controller: _fechaController, readOnly: true, decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'DD/MM/AAAA', suffixIcon: const Icon(Icons.calendar_today), errorText: _fechaError,),
                  onTap: () async {final DateTime? fechaElegida = await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (fechaElegida != null) {
                    final String fechaFormateada =
                        '${fechaElegida.day.toString().padLeft(2, '0')}/'
                        '${fechaElegida.month.toString().padLeft(2, '0')}/'
                        '${fechaElegida.year}';
                    setState(() {
                      _fechaController.text = fechaFormateada;
                    });
                  }
                  },
                ),
                const SizedBox(height: 24),


                Text('Hora aprox', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                //ELEGIR HORA
                TextField(controller: _horaController, readOnly: true, decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'HH:MM', suffixIcon: const Icon(Icons.access_time), errorText: _horaError,),
                  onTap: () async {
                    final TimeOfDay? horaElegida = await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
                    if (horaElegida != null) {
                      final String horaFormateada =
                          '${horaElegida.hour.toString().padLeft(2, '0')}:'
                          '${horaElegida.minute.toString().padLeft(2, '0')}';
                      setState(() {
                        _horaController.text = horaFormateada;
                      });
                    }
                  },
                ),
                const SizedBox(height: 40),

                //BOTON AUTORIZAR INGRESO
                Center(child: SizedBox(width: double.infinity, child: ElevatedButton(
                  onPressed: () {

                    //RESTRICCION CAMPOS VACIOS
                    setState(() {
                      _nombreError = _nombreController.text.isEmpty ? 'Debe introducir un nombre' : null;
                      _fechaError = _fechaController.text.isEmpty ? 'Debe elegir una fecha' : null;
                      _horaError = _horaController.text.isEmpty ? 'Debe elegir una hora' : null;
                    });

                    //CORTA EL BOTON SI ESTA VACIO
                    if (_nombreError != null || _fechaError != null || _horaError != null) {
                      return;
                    }

                    VisitasStore.agregarVisita(tipo: _tipoSeleccionado, nombre: _nombreController.text, fecha: _fechaController.text, hora: _horaController.text,);

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PantallaConfirmacionAutorizacion(tipo: _tipoSeleccionado, nombre: _nombreController.text, fecha: _fechaController.text, hora: _horaController.text,),),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                  child: Text('Autorizar Ingreso', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
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
