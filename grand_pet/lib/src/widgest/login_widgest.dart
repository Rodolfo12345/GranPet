import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';
//zapato_size
class FondoPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
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
          child: (
            _ImageLogin()
          ), 
          
        ),
      ),
    );
  }
}

Widget userTextField() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: const Color(0xfffcbc5c),
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Usuario',
          ),

          onChanged: (value){
            
          },
        ),
      );
    }
  ); 
}

Widget passwordTextField() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value){
            
          },
        ),
      );
    }
  );
}

Widget bottomLogin() {
  return StreamBuilder(
    builder:(BuildContext context, AsyncSnapshot snapshot){
      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Iniciar Secion'),
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xfffcbc5c),
          ),*/
        ),
        onPressed: (){
          Navigator.pushNamed(context, HomePage.id);
        }
      );
    },
  ); 
}

//Metodos privados
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