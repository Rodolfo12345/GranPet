import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

//Variables
var usuario = '';

var password = '';

//instanciamos la base de datos
CollectionReference administradores = FirebaseFirestore.instance.collection("Administradores");
CollectionReference ventas = FirebaseFirestore.instance.collection("Ventas");

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
          child: //const Text('Iniciar Secion'),
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xfffcbc5c),
          ),*/
          Nombre()
        ),

        onPressed: () async{

          if(password == '1234')
          {
            Navigator.pushNamed(context, HomePage.id);
          }

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
          });*/
          print(usuario);
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


class Nombre extends StatelessWidget {
  //final String documentId;

  //GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: ventas.doc("NacAUlEx2QPwS4JD55NN").get(),
      builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("A ocurrido un herror");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("El documento no existe");
          }

           if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("Usuario: ${data['NombreUsuario']} ${data['IdUsuario']}");
          }
          return const Text("Cargando");
      },
    );
  }
}

class Login {
  Widget build(BuildContext context) {
    var a = '';
    return FutureBuilder<DocumentSnapshot>(
      future: administradores.doc("z8AFLHGvIjs8ERSk08hJ").get(),
      builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("A ocurrido un herror");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("El documento no existe");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("Usuario: ${data['Usuario']}");
          }
          return const Text("Cargando");
      },
    );
  }
}