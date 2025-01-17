import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transferir_dinero.dart';
import 'pago_servicios.dart';
import 'recargar_servicios.dart';

class InicioVista extends StatelessWidget {
  final String usuarioNombre = "Usuario Ejemplo";
  final String usuarioCorreo = "usuario@gmail.com";
  final double saldoDisponible = 1906.04;

  @override
  Widget build(BuildContext context) {
    final String fechaActual =
    DateFormat('d/MM/yyyy').format(DateTime.now());
    final String horaActual =
    DateFormat('HH:mm:ss').format(DateTime.now());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A23), // Color de fondo personalizado
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0A23),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.tealAccent, // Cambia el color del ícono de menú hamburguesa
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('asset/imag/Innova.png'),
              ),
              SizedBox(width: 8),
              Text(
                'Innova ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Bank',
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.tealAccent),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.white),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF0A0A23),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Colors.tealAccent,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            usuarioNombre,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            usuarioCorreo,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.white),
                title: Text(
                  'Cambiar Contraseña',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Versión 1.0.0",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Hola, $usuarioNombre! 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Último ingreso: $fechaActual / $horaActual',
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mi Cuenta Principal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Nro. ********1104',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Saldo Disponible',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$${saldoDisponible.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TabBar(
                labelColor: Colors.tealAccent,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.tealAccent,
                tabs: [
                  Tab(text: 'Transferir'),
                  Tab(text: 'Servicios'),
                  Tab(text: 'Recargas'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TransferirDineroVista(),
                    PagoServiciosVista(),
                    RecargarServiciosVista(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
