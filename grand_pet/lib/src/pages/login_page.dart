//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';

class LoginPage extends StatefulWidget{
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Center(
          child: Column(
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
