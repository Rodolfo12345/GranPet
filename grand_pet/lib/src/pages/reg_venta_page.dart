import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';


class VentasPage extends StatefulWidget {
  static String id = 'RegistroVenta_page';
  @override
  _reg_venta_PageState createState() => _reg_venta_PageState();
}

final _lista = ['Premium', 'Super premium', 'Holistico'];
String _muestra = 'Selecciona una opción';

class _reg_venta_PageState extends State<VentasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:[
            Column(
                children: [
                  Container(
                    child: Headerventas()
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text('Producto', style: TextStyle(fontSize: 28,color: Colors.deepOrangeAccent),),
                            )
                        ),
                        Expanded(
                          flex: 6,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: DropdownButton(
                                iconSize: 30,
                                items: _lista.map((String a){
                                  return DropdownMenuItem(
                                      value: a,
                                      child: Text(a));
                                }).toList(),
                                onChanged: (String? contenido)=>{
                                  setState((){
                                     _muestra = contenido!;
                                  })
                                },
                                hint: Text(_muestra, style: TextStyle(fontSize: 18),),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child:
                      Container(
                          child:
                          Stack(
                              children:[
                                AreaRegistro()
                              ]
                          )
                      )
                  )
                ]
            ),
          ],
        ) //Metodos
    );
  }
}
