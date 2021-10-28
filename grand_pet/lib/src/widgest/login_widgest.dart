import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

//instanciamos la base de datos
CollectionReference administradores = FirebaseFirestore.instance.collection("Administradores");

//Variables
var usuario = TextEditingController();
var password = TextEditingController();

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
            print('hola');
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
        onPressed: () async{
          Navigator.pushNamed(context, HomePage.id);
          //insertar datos
          /*await administradores.add({
            'Correo': 'nameUser',
            'Password': 'ageUser',
            'Usuario': 'textNote',
            'id_Administrador': 1
          }).then((value) => print("Usuario Añadido"));
          */

          //Modificar datos
          /*await administradores
          .doc('dNESyMhvYDLTcToJ5qHI')
          .update(
            {
            'Correo': 'Nuevo usuario',
            'Password': '1234',
            }
          ).then((value) => print("Actualizacion completada"));
          */

          //Eliminar datos
          /*await administradores
          .doc('u7JJ2efJfWPU9pvN6r2H')//Oviamente ya no existe
          .delete()
          .then((value) => print("Eliminacion completada"));
          */

          //Obtener datos globales
          /*QuerySnapshot users = await administradores.get();
          if(users.docs.length != 0){
            for(var doc in users.docs){
              print(doc.data());
            }
          }*/
          
          //Consulta de un usuario
          /*var usuario = await administradores.where('Usuario', isEqualTo: 'Rodolfo')
          .snapshots()
          .listen((result){
            result.docs.forEach((result) {
              print(result.data());
            });
          });
          */
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