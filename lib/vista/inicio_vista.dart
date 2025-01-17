import 'package:flutter/material.dart';
import '../controlador/banca_controlador.dart';
import 'transferir_dinero.dart';
import 'pago_servicios.dart';
import 'recargar_servicios.dart';
import 'package:intl/intl.dart';

class InicioVista extends StatelessWidget {
  final BancaControlador _bancaControlador = BancaControlador();

  @override
  Widget build(BuildContext context) {
    final usuario = _bancaControlador.obtenerUsuario();
    final String fechaActual = DateFormat('d MMMM yyyy').format(DateTime.now());
    final String horaActual = DateFormat('HH:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text('Banca Móvil')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(usuario.nombre),
              accountEmail: Text(usuario.correo),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.deepOrange),
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Cambiar Contraseña'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    final TextEditingController _actualController = TextEditingController();
                    final TextEditingController _nuevaController = TextEditingController();
                    return AlertDialog(
                      title: Text('Cambiar Contraseña'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _actualController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Digite contraseña actual',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _nuevaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Digite contraseña nueva',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _bancaControlador.cambiarContrasena(
                              _actualController.text,
                              _nuevaController.text,
                            );
                            Navigator.pop(context);
                          },
                          child: Text('Aceptar'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar Sesión'),
              onTap: () {
                _bancaControlador.cerrarSesion();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola, Cristhopher',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Último Ingreso: $fechaActual / $horaActual',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mi Cuenta Principal',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Nro. ********1104', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 16),
                    Text('Saldo Disponible', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('\$1906.04',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransferirDineroVista()),
                    );
                  },
                ),
                Text('Transferir Dinero', style: TextStyle(fontSize: 10))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.payment),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PagoServiciosVista()),
                    );
                  },
                ),
                Text('Pago Servicios', style: TextStyle(fontSize: 10))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecargarServiciosVista()),
                    );
                  },
                ),
                Text('Recargar Servicios', style: TextStyle(fontSize: 10))
              ],
            ),
          ],
        ),
      ),
    );
  }
}