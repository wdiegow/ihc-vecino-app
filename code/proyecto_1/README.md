# App de Control de Acceso (proyecto_1)

Aplicación Flutter para que los residentes de un condominio puedan autorizar el ingreso de visitas y deliveries, registrando los datos y generando un código QR como comprobante.

## Requisitos

- Flutter SDK instalado
- Android Studio (o emulador/dispositivo disponible)

## Cómo correrla

```bash
cd code/proyecto_1
flutter pub get
flutter run
```

## Flujo actual

1. **Pantalla de inicio** — bienvenida del residente y acceso a las opciones.
2. **Nueva autorización** — formulario con tipo (Visita/Delivery), nombre, fecha y hora.
3. **Confirmación** — muestra un código QR con los datos de la autorización.
4. **Mis visitas** — lista de autoridades creadas con su estado (Pendiente/Ingresó).
5. **Detalle** — detalle de una visita con opción de cancelar autorización.
