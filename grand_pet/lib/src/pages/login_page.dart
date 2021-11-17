//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';

class LoginPage extends StatefulWidget{
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{


  /*@override
  void initState() {
    super.initState();
    getAdministradores();
  }

  //Funciones
  void getAdministradores() async{
    CollectionReference collectionReference = 
      FirebaseFirestore.instance.collection("Administradores");//hace referencia a la colleccion a obtener

    QuerySnapshot Administradores = await collectionReference.get(); //hacemos una consulta a la coleccion
    
    //si la cantidad de documentso es diferente de cero
    if(Administradores.docs.length != 0) //docs es la cantidad de documentos o registros en la collecion
    {
      for (var doc in Administradores.docs) {
        print(doc.data());
      }
    }
  }*/


/////////////////////////////////////////

  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Flexible(
                child: (
                  FondoPrincipal() 
                ),
              ),
              const SizedBox(height: 30.0,),
              userTextField(),
              const SizedBox(height: 25.0,),
              passwordTextField(),
              const SizedBox(height: 25.0,),
              bottomLogin(),
              Flexible(child:InicioSesion())
            ],
            
          ),
        ),
      ),
    );
  }
}

//Validacion
