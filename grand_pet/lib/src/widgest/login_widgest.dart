import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

          onChanged: (Text) => {
            
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
    //Validacion
    stream: administradores.where('Usuario', isEqualTo: 'Rodolfo').snapshots(),
    builder:(BuildContext context,  AsyncSnapshot<QuerySnapshot> snapshot){

      return ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Iniciar Secion',style: TextStyle(fontSize: 16)),
        ),

        onPressed: () async{
          //userLogin = user.text;
          //Navigator.pushNamed(context, HomePage.id);

          //final authService = Provider.of<AuthService>(context, listen: false);
          //final String? token = await authService.createUser(loginform.email, loginform.password);

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

/*Widget InicioSesion(){
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
}*/