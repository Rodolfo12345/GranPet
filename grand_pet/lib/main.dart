import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';
import 'package:grand_pet/src/pages/login_page.dart';
import 'package:grand_pet/src/pages/perfil_page.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';

void main() => runApp(MyApp());

/////////////Variables/////////////
String username = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GrandPet',
        debugShowCheckedModeBanner: false,
        //home: MyStatefulWidget(),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id : (context) => LoginPage(),
          HomePage.id : (context) => HomePage(),
          PerfilPage.id: (context) => PerfilPage(),
          VentasPage.id: (context) => VentasPage(),
        },
    );
  }
}
