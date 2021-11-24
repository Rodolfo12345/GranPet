import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/venta_widgets.dart';

class VentasPage extends StatefulWidget {
  static String id = 'RegistroVenta_page';
  @override
  _reg_venta_PageState createState() => _reg_venta_PageState();

  String CantidadProductos;
  VentasPage(this.CantidadProductos, {Key? key}) : super(key: key);
}
int contador = 0;

class _reg_venta_PageState extends State<VentasPage> {
  @override
  Widget build(BuildContext context) {
    contador = int.parse(widget.CantidadProductos);
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
                  )
                ),
                Spacer(),
              ],
            ),
            
            Flexible(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  for (var i = 0; i < contador; i++)
                    Lote(),
                ],
              ),
            ),
            
            Row(
              children:const [
                Spacer(),
                Fotografia(),
                Spacer(),
                AgregarRegistro(),
                Spacer(),
                BotonGuardar(),
                Spacer(),
              ],
            ),

          ])
        )
      )
    );
  }
}