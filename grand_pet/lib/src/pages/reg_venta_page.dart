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

            children:[
              Flexible(
                child: (
                  HederVentas()
                ),
              ),
              Flexible(
                child: Row(
                  children: const [
                    Text("Productos: ", 
                      textAlign: TextAlign.center, style: TextStyle(
                        color: Color(0xfffcbc5c), 
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    /*Flexible(
                      flex: 2,
                      child: DropdownButton(
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
                        hint: Text(_muestra, style: const TextStyle(fontSize: 20),),
                        )
                    ),*/
                  ],
                )
              ),
              /*const SizedBox(height: 30.0,)
,             Premium(),
              const SizedBox(height: 30.0,),
              Olistico(),
              const SizedBox(height: 30.0,),
              SuperPremium(),
              const SizedBox(height: 30.0,),
              Guardar(),
              const SizedBox(height: 30.0,),
              Fotografia(),*/

              Flexible(
                child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[


                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry D')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry E')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry F')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry G')),
                  ),
                  Premium()

                ],
                ),
              )
            ]
          )
        )
      )
    );
  }
}