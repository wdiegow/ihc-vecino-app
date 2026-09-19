import 'package:flutter/material.dart';
import 'package:prueba2/pantallas/principal/pantalla_principal.dart';
import 'pantallas/control_acceso/pantalla_control_acceso.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla Principal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const PantallaPrincipal(),
    );
  }
}
