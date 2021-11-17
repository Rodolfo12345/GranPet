import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';
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
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Flexible(
                child: (HederVentas()),
              ),
              Flexible(
                  child: Row(
                children: const [
                  Text(
                    "Productos: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xfffcbc5c),
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                ],
              )),
              const SizedBox(
                height: 30.0,
              ),
              Premium(),
              const SizedBox(
                height: 30.0,
              ),
              Olistico(),
              const SizedBox(
                height: 30.0,
              ),
              SuperPremium(),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [Fotografia(), BotonAgregarVenta(), Guardar()],
              )
            ]))));
  }
}
