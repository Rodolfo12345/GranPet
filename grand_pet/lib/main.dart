import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';
import 'package:grand_pet/src/pages/login_page.dart';
import 'package:grand_pet/src/pages/perfil_page.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';

//=> runApp
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrandPet',
      debugShowCheckedModeBanner: false,
      //home: MyStatefulWidget(),
      initialRoute: LoginPage.id,
      //Themas definidos
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black87,
        backgroundColor: Colors.black87,
        primaryColor: Colors.teal.shade400,
        primaryColorBrightness: Brightness.dark,
        dialogTheme: DialogTheme(backgroundColor: Colors.blueGrey.shade900),
        dialogBackgroundColor: Colors.white,
      ),

      //Rutas de slas paginas por nombre asignado de id
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        PerfilPage.id: (context) => PerfilPage(),
        VentasPage.id: (context) => VentasPage("0"),
      },
    );
  }
}
