import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/home_widgest.dart';
import 'package:grand_pet/src/widgest/login_widgest.dart';
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
          child: Column(
            children: [
              Flexible(
                child: (HederVentas()),
              ),
              Row(
                children: const [Text("Productos: ",textAlign: TextAlign.center,style: TextStyle(color: Color(0xfffcbc5c),fontSize: 25,)),
                Spacer(),
                ],
              ),

              Expanded(
                child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Producto A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Producto B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Producto C')),
                  ),
                                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Producto A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Producto B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Producto C')),
                  ),
                  Lote(),
                ],
                ),
              ),
              PaddinHistorial(),
              Row(children: const [
                Fotografia(),
                Spacer(),
                Agregar(),
                Spacer(),
                Guardar()

              ],
              ),
            ]
          )
        )
      )
    );
  }
}

class Guardar extends StatelessWidget {
  const Guardar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "guardar",
      onPressed: () => {},
      child: const Icon(Icons.save),
      backgroundColor: Colors.blue,
    );
  }
}

class Agregar extends StatelessWidget {
  const Agregar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "agregar",
      onPressed: () => {},
      child: const Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}

class Fotografia extends StatelessWidget {
  const Fotografia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "foto",
      onPressed: () => {},
      child: const Icon(Icons.add_a_photo),
      backgroundColor: Colors.blue,
      
    );
  }
}
