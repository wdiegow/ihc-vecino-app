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
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  String _tipoSeleccionado = 'Visita';

  String? _nombreError;
  String? _fechaError;
  String? _horaError;

  @override
  void dispose() {
    _nombreController.dispose();
    _fechaController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Atrás'),), backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),


            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('NUEVA AUTORIZACION', style: TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 22, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 32),

                const Text('Tipo', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


                DropdownButtonFormField<String>(value: _tipoSeleccionado, decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),),
                  items: const [
                    DropdownMenuItem(value: 'Visita', child: Text('Visita')),
                    DropdownMenuItem(value: 'Delivery', child: Text('Delivery')),
                  ],
                  onChanged: (nuevoValor) {setState(() {_tipoSeleccionado = nuevoValor!;});},
                ),
                const SizedBox(height: 24),


                const Text('Nombre', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


                TextField(controller: _nombreController, decoration: InputDecoration(border: const OutlineInputBorder(), hintText: 'Nombre completo', errorText: _nombreError,),),
                const SizedBox(height: 24),


                const Text('Fecha', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


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


                const Text('Hora aprox', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),


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


                Center(child: SizedBox(width: double.infinity, child: ElevatedButton(
                  onPressed: () {

                    setState(() {
                      _nombreError = _nombreController.text.isEmpty ? 'Debe introducir un nombre' : null;
                      _fechaError = _fechaController.text.isEmpty ? 'Debe elegir una fecha' : null;
                      _horaError = _horaController.text.isEmpty ? 'Debe elegir una hora' : null;
                    });

                    if (_nombreError != null || _fechaError != null || _horaError != null) {
                      return;
                    }

                    VisitasStore.agregarVisita(
                      tipo: _tipoSeleccionado,
                      nombre: _nombreController.text,
                      fecha: _fechaController.text,
                      hora: _horaController.text,
                    );

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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                  child: const Text('Autorizar Ingreso', style: TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
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
