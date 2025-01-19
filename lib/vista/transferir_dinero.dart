import 'package:flutter/material.dart';

class TransferirDineroVista extends StatelessWidget {
  final TextEditingController cuentaController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferir Dinero'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cuentaController,
              decoration: InputDecoration(
                labelText: 'Número de cuenta',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_balance, color: const Color(0xFF0A0A23)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cantidadController,
              decoration: InputDecoration(
                labelText: 'Cantidad a transferir',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money, color: const Color(0xFF0A0A23)),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final cuenta = cuentaController.text;
                final cantidad = cantidadController.text;

                if (cuenta.isEmpty || cantidad.isEmpty) {
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
                    content: Text('¡Transferencia exitosa a la cuenta $cuenta por \$${cantidad}!'),
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
                style: TextStyle(fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
