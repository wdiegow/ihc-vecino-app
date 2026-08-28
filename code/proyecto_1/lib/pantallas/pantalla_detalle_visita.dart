import 'package:flutter/material.dart';

// datos que esta pantalla recibe de la pantalla anterior
class PantallaDetalleVisita extends StatelessWidget {
  final String tipo;
  final String nombre;
  final String fechaHora;
  final String estado;

  //pasa los datos anteriores a esta pantalla
  const PantallaDetalleVisita({
    super.key,
    required this.tipo,
    required this.nombre,
    required this.fechaHora,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    final bool esPendiente = estado == 'Pendiente';

    return Scaffold(appBar: AppBar(title: const Text('Detalle'),), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
        child: Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(4),),

          child: Column(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(tipo.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'monospace', fontSize: 22, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 32),


              Text(nombre, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'monospace', fontSize: 18,),),
              const SizedBox(height: 4),


              Text(fechaHora, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'monospace', fontSize: 18,),),
              const SizedBox(height: 24),


              const Text('Estado:', style: TextStyle(fontFamily: 'monospace', fontSize: 14,),),
              const SizedBox(height: 4),


              Text(estado == 'Ingresó' ? 'INGRESÓ' : estado.toUpperCase(), style: TextStyle(fontFamily: 'monospace', fontSize: 18, fontWeight: FontWeight.bold, color: esPendiente ? Colors.orange : Colors.green,),),
              const SizedBox(height: 60),

              // El boton Cancelar solo aparece si la visita esta Pendiente
              if (esPendiente)
                SizedBox(width: double.infinity, child: OutlinedButton(
                  onPressed: () {
                    //
                    // SIN USO XD
                    //
                  },
                  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), side: const BorderSide(color: Colors.red), padding: const EdgeInsets.symmetric(vertical: 14),),
                  child: const Text('Cancelar autorización', style: TextStyle(color: Colors.red, fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold,),),
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