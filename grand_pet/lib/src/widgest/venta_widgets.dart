import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

class Headerventas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child:Stack(
            children:[
              Column(
                  children:[
                    //Volver
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color(0xfffcbc5c),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )
                      ),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(Icons.chevron_left_sharp, size: 40, color: Colors.white,),
                            title: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 25),),
                            onTap: (){
                              Navigator.pushNamed(context, HomePage.id);
                            },
                          )
                        ],
                      ),
                    ),
                    //este es el container inferior en donde esta el texto de registrar venta
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                          color: Color(0xfffcbc5c),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                      ),
                      child: Center(
                          child: Text(" Registar Venta", style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold))),
                    ),
                  ]
              )
            ]
        ),
      ),
    );
  }
}


class AreaRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(
              //flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: const Color(0xfffcbc5c),
                decoration: const InputDecoration(
                  icon: Icon(Icons.date_range_outlined),
                  labelText: 'Lote',
                ),
                onChanged: (value){},
              ),
            ),
            Expanded(
              //flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: const Color(0xfffcbc5c),
                decoration: const InputDecoration(
                  icon: Icon(Icons.now_widgets_outlined),
                  labelText: 'Cantidad',
                  ),
                  onChanged: (value){},
              )
            ),
            Expanded(
              flex: 1,
                child: Center(
                    child:Container(
                      child: ElevatedButton.icon(
                        onPressed: () {print('Guardado!');},//hace un print en la consola
                        icon: Icon(Icons.add_photo_alternate_outlined, color: Colors.white,size: 35),
                        label: Text('Subir foto', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            onPrimary: Colors.white,
                        ),
                      ),
                      )
                ),
            ),
            Flexible(
              //flex: 1,
                child: Center(
                  child: Container(
                    child: ElevatedButton.icon(
                      onPressed: () {print('Guardado!');},
                      icon: Icon(Icons.upload, color: Colors.white,size: 35),
                      label: Text('Guardar', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        onPrimary: Colors.white,
                        onSurface: Colors.red
                      ),
                    ),
                  ),
                )
            )
          ],
        )
    );
  }
}
