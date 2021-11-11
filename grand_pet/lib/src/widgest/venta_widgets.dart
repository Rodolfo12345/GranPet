import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

class HederVentas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(/*Container*/
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: const Color(0xfffcbc5c),
            borderRadius: BorderRadius.circular(20)
          ),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.chevron_left_sharp, size: 40, color: Colors.white,),
                title: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 25),),
                onTap: (){
                  Navigator.pushNamed(context, HomePage.id);
                },
              ),
              const Text(
                'Registrar Ventas',
                textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white, 
                  fontSize: 40,

                )
              )
            ]
          )
        )
      )
    );
  }
}

Widget Lote() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: const Color(0xfffcbc5c),
          decoration: const InputDecoration(
            icon: Icon(Icons.date_range_outlined),
            labelText: 'Lote',
          ),

          onChanged: (value){
            
          },
        ),
      );
    }
  ); 
}

Widget Cantidad() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: const Color(0xfffcbc5c),
          decoration: const InputDecoration(
            icon: Icon(Icons.now_widgets_outlined),
            labelText: 'Cantidad',
          ),

          onChanged: (value){
            
          },
        ),
      );
    }
  ); 
}

Widget Guardar() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Guardar'),
        ),
        onPressed: () async{
          //Navigator.pushNamed(context, HomePage.id);
        }
      );
    }
  );
}

Widget Fotografia() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Subir Fotografia'),
        ),
        onPressed: () async{
          //Navigator.pushNamed(context, HomePage.id);
        }
      );
    }
  );
}