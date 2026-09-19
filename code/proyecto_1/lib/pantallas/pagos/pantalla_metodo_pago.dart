import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/pagos_store.dart';
import 'pantalla_comprobante_pago.dart';
import 'pantalla_confirmar_pago_tarjeta.dart';
import 'pantalla_confirmar_pago_transferencia.dart';
import 'pantalla_confirmar_pago_qr.dart';

class PantallaMetodoPago extends StatefulWidget {
  const PantallaMetodoPago({super.key});

  @override
  State<PantallaMetodoPago> createState() => _PantallaMetodoPagoState();
}

class _PantallaMetodoPagoState extends State<PantallaMetodoPago> {
  String _metodoSeleccionado = 'Tarjeta terminada en 4242';

  final List<String> _metodos = [
    'Tarjeta terminada en 4242',
    'Transferencia Bancaria',
    'Pago por QR',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Método de Pago')), backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0),
          child: Container(width: double.infinity, padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Monto a pagar', style: GoogleFonts.inter(fontSize: 14, color: Colors.black54,),),
                const SizedBox(height: 4),

                Text(PagosStore.montoExpensa, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 32),

                Text('Elige un método de pago', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 8),

                // Genera un botón de radio por cada método disponible
                ..._metodos.map((metodo) {
                  return RadioListTile<String>(value: metodo,
                    groupValue: _metodoSeleccionado, activeColor: Colors.green.shade700, contentPadding: EdgeInsets.zero,
                    title: Text(metodo, style: GoogleFonts.inter(fontSize: 15),),

                    onChanged: (nuevoValor) {
                      setState(() {
                        _metodoSeleccionado = nuevoValor!;
                      });

                    },

                  );
                }),
                const SizedBox(height: 32),

                Center(
                  child: SizedBox(
                    width: double.infinity, child: ElevatedButton(

                      onPressed: () {
                        if (_metodoSeleccionado == 'Tarjeta terminada en 4242') {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaConfirmarPagoTarjeta(metodo: _metodoSeleccionado,),),);

                        } else if (_metodoSeleccionado == 'Transferencia Bancaria') {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaConfirmarPagoTransferencia(metodo: _metodoSeleccionado,),),);

                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaConfirmarPagoQr(metodo: _metodoSeleccionado,),),);
                        }
                      },

                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: const EdgeInsets.symmetric(vertical: 16),),
                      child: Text('Continuar', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
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
