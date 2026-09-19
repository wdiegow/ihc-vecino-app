import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/pagos_store.dart';
import 'pantalla_metodo_pago.dart';
import 'pantalla_historial_pagos.dart';

class PantallaPagarExpensas extends StatelessWidget {
  const PantallaPagarExpensas({super.key});

  @override
  Widget build(BuildContext context) {
    final bool estaPagado = PagosStore.estadoMesActual == 'Pagado';

    return Scaffold(
      appBar: AppBar(title: const Text('Pagar Expensas')), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              Container(width: double.infinity, padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(8),),

                child: Column(

                  children: [
                    Text(PagosStore.mesActual, style: GoogleFonts.inter(fontSize: 16, color: Colors.black54,),),
                    const SizedBox(height: 8),

                    //MONTO A PAGAR O SALDO
                    Text(PagosStore.montoExpensa, style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold,),),
                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
                      decoration: BoxDecoration(color: estaPagado ? Colors.green.shade50 : Colors.orange.shade50, borderRadius: BorderRadius.circular(20),),
                      child: Text(PagosStore.estadoMesActual.toUpperCase(), style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold, color: estaPagado ? Colors.green.shade700 : Colors.orange.shade700,),),
                    ),
                    const SizedBox(height: 24),

                    //BOTON PAGAR AHORA
                    if (!estaPagado)
                      SizedBox(
                        width: double.infinity, child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaMetodoPago(),),);
                          },

                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                          child: Text('Pagar Ahora', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              //BOTON VER HISTORIAL DE PAGOS
              SizedBox(
                width: double.infinity, child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHistorialPagos(),),);
                  },

                  icon: Icon(Icons.receipt_long, color: Colors.green.shade700),
                  label: Text('Ver Historial de Pagos', style: GoogleFonts.inter(color: Colors.green.shade700, fontSize: 15, fontWeight: FontWeight.bold,),),
                  style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.green.shade700, width: 2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
