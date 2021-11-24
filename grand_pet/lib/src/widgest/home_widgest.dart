import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:grand_pet/src/pages/perfil_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference administradores =
    FirebaseFirestore.instance.collection("Administradores");
CollectionReference ventas = FirebaseFirestore.instance.collection("Ventas");

class Barra_lateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xfffcbc5c),
        child: const Lateral(),
      ),
    );
  }
}
//Status Bar de home
class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color(0xfffcbc5c), size: 40),
      title: const Text("GrandPet",textAlign: TextAlign.center, style: TextStyle(color: Color(0xff7b333f), fontSize: 40)),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.help,
            size: 40,
          ),
          onPressed: () {},
        ),
      ]
    );
  }
}
///Contenido barra lateral
class Lateral extends StatelessWidget {
  const Lateral({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeader(
            child: CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.brown,
          backgroundImage: AssetImage("assets/Login.png"),
        )),
        Flexible(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.people,
                  color: Colors.white,
                  size: 40,
                ),
                title: const Text('Perfil',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                onTap: () {
                  Navigator.pushNamed(context, PerfilPage.id);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.arrow_circle_up,
                  color: Colors.white,
                  size: 40,
                ),
                title: const Text('Nivel',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                onTap: () {
                  Navigator.pushNamed(context, PerfilPage.id);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                  size: 40,
                ),
                title: const Text('Comisiones',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                onTap: () {
                  Navigator.pushNamed(context, PerfilPage.id);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 40,
                ),
                title: const Text('Historial',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                onTap: () {
                  Navigator.pushNamed(context, PerfilPage.id);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.calculate,
                  color: Colors.white,
                  size: 40,
                ),
                title: const Text('Calculadora',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                onTap: () {
                  Navigator.pushNamed(context, PerfilPage.id);
                },
              ),
            ],
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.lightbulb_outline,
            color: Colors.white,
            size: 35,
          ),
          title: Text(
            'Tema',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.white,
            size: 35,
          ),
          title: Text(
            'Configuracion',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        const ListTile(
          title: Text(
            'Cerra Sesion',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              decoration: TextDecoration.underline,
              decorationThickness: 2.5, //grosor del subrayado
              height: 2,
            ),
          ),
        ),
      ],
    );
  }
}