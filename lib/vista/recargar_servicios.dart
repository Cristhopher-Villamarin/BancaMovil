import 'package:flutter/material.dart';

class RecargarServiciosVista extends StatelessWidget {
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  String? lineaSeleccionada;

  final List<String> lineasTelefonicas = ['Claro', 'Movistar', 'Tuenti', 'CNT'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recargas Telefónicas'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Seleccione una línea',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone_android, color: const Color(0xFF0A0A23)),
              ),
              items: lineasTelefonicas
                  .map((linea) => DropdownMenuItem(
                value: linea,
                child: Text(linea),
              ))
                  .toList(),
              onChanged: (value) {
                lineaSeleccionada = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: telefonoController,
              decoration: InputDecoration(
                labelText: 'Número de teléfono',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone, color: const Color(0xFF0A0A23)),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cantidadController,
              decoration: InputDecoration(
                labelText: 'Cantidad de recarga',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money, color: const Color(0xFF0A0A23)),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final telefono = telefonoController.text;
                final cantidad = cantidadController.text;

                if (lineaSeleccionada == null || telefono.isEmpty || cantidad.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Por favor, completa todos los campos'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '¡Recarga exitosa en la línea $lineaSeleccionada al número $telefono por \$${cantidad}!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A0A23),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
