import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';

class LoginPage extends StatefulWidget{
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            ],
          ),
        ),
      ),
    );
  }
}