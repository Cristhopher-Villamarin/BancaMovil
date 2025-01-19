import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PagoServiciosVista extends StatefulWidget {
  @override
  _PagoServiciosVistaState createState() => _PagoServiciosVistaState();
}

class _PagoServiciosVistaState extends State<PagoServiciosVista> {
  final String apiUrl = 'https://678d153bf067bf9e24e935b2.mockapi.io/api/servicios/servicios';
  List<dynamic> serviciosAleatorios = [];

  @override
  void initState() {
    super.initState();
    fetchServicios();
  }

  Future<void> fetchServicios() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          serviciosAleatorios = obtenerServiciosAleatorios(data);
        });
      } else {
        throw Exception('Error al cargar los datos');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  List<dynamic> obtenerServiciosAleatorios(List<dynamic> servicios) {
    final random = Random();
    int cantidad = random.nextInt(5) + 1; // Genera entre 1 y 5.
    List<dynamic> aleatorios = List.from(servicios)..shuffle();
    return aleatorios.take(cantidad).toList();
  }

  void pagarServicio(int index) {
    final servicio = serviciosAleatorios[index];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Servicio "${servicio['name']}" pagado'),
        backgroundColor: Colors.green,
      ),
    );
    setState(() {
      serviciosAleatorios.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago a Servicios'),
        backgroundColor: Colors.tealAccent,
      ),
      body: serviciosAleatorios.isEmpty
          ? const Center(child: Text('No hay servicios pendientes'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: serviciosAleatorios.length,
          itemBuilder: (context, index) {
            final servicio = serviciosAleatorios[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.network(
                  servicio['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(servicio['name']),
                subtitle: Text('Valor a pagar: \$${servicio['price']}'),
                trailing: ElevatedButton(
                  onPressed: () => pagarServicio(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A0A23),
                  ),
                  child: const Text(
                    'Pagar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
