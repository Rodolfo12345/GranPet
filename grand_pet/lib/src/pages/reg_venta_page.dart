import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/venta_widgets.dart';

class VentasPage extends StatefulWidget {
  static String id = 'RegistroVenta_page';
  @override
  _reg_venta_PageState createState() => _reg_venta_PageState();
}

//variables
final _lista = ['Premium', 'Super premium', 'Holistico'];
String _muestra = 'Opciones';

class _reg_venta_PageState extends State<VentasPage> {
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            body: Center(
                child: Column(children: [
          Expanded(
            child: (HederVentas()),
          ),
          Row(
            children: const [
              Text("Productos: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffcbc5c),
                    fontSize: 25,
                  )),
              Spacer(),
            ],
          ),
          Flexible(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: const Center(child: Text('Producto A')),
                ),
                Lote(),
              ],
            ),
          ),
          Row(
            children: const [
              Fotografia(),
              Spacer(),
              Agregar(),
              Spacer(),
              BotonGuardar()
            ],
          ),
        ]))));
  }
}
