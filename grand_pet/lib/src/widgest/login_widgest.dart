import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

//Variables
//Guardado de los datos que ingreso el usuario
final user = TextEditingController();
String userLogin = '';

var _usuario = '';

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
          controller: user,//Indicamos el texto que vamos a guardar
          keyboardType: TextInputType.emailAddress,
          cursorColor: const Color(0xfffcbc5c),

          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Usuario',
          ),

          onChanged: (text) => {},

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

    //Validacion
    stream: administradores.where('Usuario', isEqualTo: 'Rodolfo').snapshots(),
    builder:(BuildContext context,  AsyncSnapshot<QuerySnapshot> snapshot){

      if(!snapshot.hasData) return const CircularProgressIndicator();
      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Iniciar Secion',style: TextStyle(fontSize: 16)),
        ),

        onPressed: () async{
          userLogin = user.text;
          //Verificacion de usuario
          //print('usuarion 2:$usuario');
          Navigator.pushNamed(context, HomePage.id);
          /*if(_usuario == 'rodovargas600@gmail.com')
          {
            _incrementCounter();
            Navigator.pushNamed(context, HomePage.id);//Cambio de pagina
          }*/

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

          //Listado de usuarios
          /*FirebaseFirestore.instance
            .collection('Administradores')
            .where('Usuario', isEqualTo: 'Rodolfo')
            .get()
            .then((resultado) => {
            resultado.docs.forEach((elementos) {
              print(elementos.data());
            })
          });*/

        /*StreamBuilder(
          stream: administradores.where('Usuario', isEqualTo: 'Rodolfo').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
          {
            if(!snapshot.hasData) return const CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index){
                //String id = snapshot.data!.docs[index].id;
                String usuario = snapshot.data!.docs[index].get('Usuario');
                print(usuario);
                return Card(
                  child: Column(
                    children: [
                      Text('Usuario: $usuario')
                    ],
                  ),
                );
              });
          });*/

        });   
    }); 
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

Widget InicioSesion(){
    return Scaffold(
      body: Center(
        child: (
          StreamBuilder(
          stream: ventas.where('Correo', isEqualTo: 'rodovargas600@gmail.com').snapshots(),
          
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
          {
            if(!snapshot.hasData) return const CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index){
                //String id = snapshot.data!.docs[index].id;
            _usuario = snapshot.data!.docs[index].get('Usuario');
                return Card(
                  child: Column(
                    children: [
                      Text('Usuario: $_usuario')
                    ],
                  ),
                );
              });
          })
        ),
      ),
    );
}
/////////////
_incrementCounter() async {
  //Numeros
  /*SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);*/

  //Texto
  SharedPreferences log = await SharedPreferences.getInstance();
  String prueba = (log.getString('Texto') ?? userLogin) + '';
  if(_usuario != 'Rodolfo11')
  {
    await log.clear();
  }
  
  print(prueba);
  //await prefs.setString('Texto', prueba);//Esperar un momento para que se vuelva a poder ejecutar el metodo
}