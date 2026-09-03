import 'package:flutter/material.dart';
import 'pantalla_detalle_visita.dart';
import '../data/visitas_store.dart';

class PantallaMisVisitas extends StatelessWidget {
  const PantallaMisVisitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Visitas'),), backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(16.0), child: Container(width: double.infinity, padding: const EdgeInsets.all(16),

          child: ListView.separated(itemCount: VisitasStore.visitas.length, separatorBuilder: (context, index) => const Divider(color: Colors.black, thickness: 2,),

            itemBuilder: (context, index) {
              final visita = VisitasStore.visitas[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PantallaDetalleVisita(
                      tipo: visita['tipo']!,
                      nombre: visita['nombre']!,
                      fechaHora: visita['fechaHora']!,
                      estado: visita['estado']!,
                    ),
                    ),
                  );
                },


                child: Padding(padding: const EdgeInsets.symmetric(vertical: 16),

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(visita['tipo']!.toUpperCase(), style: const TextStyle(fontFamily: 'monospace', fontSize: 14, fontWeight: FontWeight.bold,),),
                      const SizedBox(height: 8),


                      Text(visita['nombre']!, style: const TextStyle(fontFamily: 'monospace', fontSize: 16,),),
                      const SizedBox(height: 8),


                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(visita['fechaHora']!, style: const TextStyle(fontFamily: 'monospace', fontSize: 13, color: Colors.black54,),),
                          Text(visita['estado']!, style: TextStyle(fontFamily: 'monospace', fontSize: 13, fontWeight: FontWeight.bold, color: visita['estado'] == 'Pendiente' ? Colors.orange : Colors.green,),),
                        ],
                      ),

                    ],
                  ),
                ),


              );
            },
          ),
        ),
        ),
      ),
    );
  }
}
