import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/pagos_store.dart';

class PantallaHistorialPagos extends StatelessWidget {
  const PantallaHistorialPagos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Pagos')), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(4),),
            child: PagosStore.historial.isEmpty ? Center(child: Text('Aún no hay pagos registrados', style: GoogleFonts.inter(fontSize: 14, color: Colors.black54,),),)
                : ListView.separated(itemCount: PagosStore.historial.length, separatorBuilder: (context, index) => const Divider(color: Colors.black, thickness: 1,),

              itemBuilder: (context, index) {
                final pago = PagosStore.historial[index];
                return Padding(padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(pago['mes']!, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold,),),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pago['metodo']!, style: GoogleFonts.inter(fontSize: 13, color: Colors.black54,),),
                          Text(pago['monto']!, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.green.shade700,),),
                        ],
                      ),
                      const SizedBox(height: 4),

                      Text(pago['fecha']!, style: GoogleFonts.inter(fontSize: 12, color: Colors.black38,),),
                    ],
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
