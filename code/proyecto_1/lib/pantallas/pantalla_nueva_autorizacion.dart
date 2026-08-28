import 'package:flutter/material.dart';
import 'pantalla_confirmacion_autorizacion.dart';
import '../data/visitas_store.dart';

class PantallaNuevaAutorizacion extends StatefulWidget {
  const PantallaNuevaAutorizacion({super.key});

  @override
  State<PantallaNuevaAutorizacion> createState() => _PantallaNuevaAutorizacionState();
}

class _PantallaNuevaAutorizacionState
    extends State<PantallaNuevaAutorizacion> {
  // aqui se guarda lo que se escribe en pantalla
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  String _tipoSeleccionado = 'Visita'; //tipo se inicializa en visita

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(4),),


            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('NUEVA AUTORIZACION', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 32),

                const Text('Tipo', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


                // escoger el tipo
                DropdownButtonFormField<String>(value: _tipoSeleccionado, decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),),
                  items: const [
                    DropdownMenuItem(value: 'Visita', child: Text('Visita')),
                    DropdownMenuItem(value: 'Delivery', child: Text('Delivery')),
                  ],
                  onChanged: (nuevoValor) {setState(() {_tipoSeleccionado = nuevoValor!;});},
                ),
                const SizedBox(height: 24),


                const Text('Nombre', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


                TextField(controller: _nombreController, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Nombre completo',),),
                const SizedBox(height: 24),


                const Text('Fecha', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


                // pa escoger fecha
                TextField(controller: _fechaController, readOnly: true, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'DD/MM/AAAA', suffixIcon: Icon(Icons.calendar_today),),
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


                const Text('Hora aprox', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


                // pa escoger hora
                TextField(controller: _horaController, readOnly: true, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'HH:MM', suffixIcon: Icon(Icons.access_time),),
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


                // boton confirmar autorizacion
                Center(child: SizedBox(width: double.infinity, child: OutlinedButton(
                  onPressed: () {

                    // guarda los datos en la lista
                    VisitasStore.agregarVisita(
                      tipo: _tipoSeleccionado,
                      nombre: _nombreController.text,
                      fecha: _fechaController.text,
                      hora: _horaController.text,
                    );
                    // le pasa los datos a la nueva pantalla
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PantallaConfirmacionAutorizacion(
                        tipo: _tipoSeleccionado,
                        nombre: _nombreController.text,
                        fecha: _fechaController.text,
                        hora: _horaController.text,
                      ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), side: const BorderSide(color: Colors.black), padding: const EdgeInsets.symmetric(vertical: 14),),
                  child: const Text('Autorizar Ingreso', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
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