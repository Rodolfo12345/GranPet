import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

class HeaderPerfil extends StatelessWidget {
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
                        leading: const Icon(Icons.chevron_left_sharp, size: 40, color: Colors.white,),
                        title: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 25),),
                        onTap: (){
                          Navigator.pushNamed(context, HomePage.id);
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,

                  decoration: const BoxDecoration(
                      //color: Colors.red,
                      color: Color(0xfffcbc5c),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),
                  child: (_ImageLogin()),
                )
              ]
            )
          ]
        )
      )
    );
  }
}

Widget _ImageLogin() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('assets/Login.png'),
        scale: 8,
      ),
    ),
  );
}

class Datos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: const Text('Nombre: ',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black)),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: const Text('Rodo el pica colas',
          textAlign: TextAlign.center, style: TextStyle(
              color: Color(0xff7b333f),
              fontSize: 30,
              fontStyle: FontStyle.italic,
              decoration:
              TextDecoration.underline,
              decorationThickness: 2.5,//grosor del subrayado
              height: 1.5,
          ),),
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: const Text('Telefono: ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,)),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: const Text('01 800 nueve mil',
          textAlign: TextAlign.center, style: TextStyle(
            color: Color(0xff7b333f),
            fontSize: 30,
            fontStyle: FontStyle.italic,
            decoration:
            TextDecoration.underline,
            decorationThickness: 2.5,//grosor del subrayado
            height: 1.5,
          ),),
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: const Text('Puesto: ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: const Text('Promo vendedor',
          textAlign: TextAlign.center, style: TextStyle(
            color: Color(0xff7b333f),
            fontSize: 30,
            fontStyle: FontStyle.italic,
            decoration:
            TextDecoration.underline,
            decorationThickness: 2.5,//grosor del subrayado
            height: 1.5,
        ))
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: const Text('Sucursal: ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black)),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: const Text('Santa Ana pacueco',
          textAlign: TextAlign.center, style: TextStyle(
            color: Color(0xff7b333f),
            fontSize: 30,
            fontStyle: FontStyle.italic,
            decoration:
            TextDecoration.underline,
            decorationThickness: 2.5,//grosor del subrayado
            height: 1.5,
          ))
      )
    ]);
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(  
        image:DecorationImage(
          image: ExactAssetImage('assets/Logo.png'),
          
          colorFilter: ColorFilter.mode(Colors.white,  BlendMode.softLight, ),/*BlendMode.softLight*/
          fit: BoxFit.contain,
        ) 
      ),
    );
  }
}