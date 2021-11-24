import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';
import 'package:grand_pet/src/widgest/home_widgest.dart';

class PerfilPage extends StatefulWidget {
  static String id = 'PerfilPage';
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Column(
            children: [
              Expanded(
                flex: 4,
                  child: HeaderPerfil()),
              Expanded(
                flex: 6,
                  child: 
                    Stack(
                      children:[
                        Background(),
                        Datos()
                      ]
                  )
              )
            ]
          ),
        ],
      ) //Metodos
    );
  }
}
