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
        child: Column(
          children: [
            /*Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: const CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage("assets/Login.png"),
      
                //child: Text('Usuario',style: TextStyle(fontSize: 50),),
              ),
            ),*/
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
        ),
      ),
    );
  }
}

///<Historial de Ventas>///
class PaddinHistorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        /*Container*/
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),

          //de aqui en adelante tiro codigo el master Noé
          child: const SliderList(),
          //de aqui para arriba tiro codigo el master Noé
        ),
      ),
    );
  }
}

//este es el constructor del sliderlist

class SliderList extends StatelessWidget {
  const SliderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext contex, int index) => _Listitem());
  }
}

//en esta parte es donde creo la lista de objetos que iran dentro del slider list.
//Tambien en esta misma parte en donde creo los containers o cajas donde se mostrara el texto

class _Producto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text('Premium',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)));
  }
}

class _Fecha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text(
      '15/oct/2021',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500),
    ));
  }
}

class _Cantidad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text(
      'Cantidad: 16 sacos',
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
    ));
  }
}

class _Listitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //este es el container principal que esta en el fondo y no se ve
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xfffcbc5c),
        borderRadius: BorderRadius.circular(8),
        //border: Border(bottom: BorderSide(color: Colors.black, width: 3.0)),
      ),
      //ahora aqui creamos el jodido Row que nos abarcaratodo el ancho del container
      //y permitira que se pequien unos al lado de los otros
      child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: Icon(
                Icons.monetization_on,
                color: Colors.white,
                size: 50,
              )),
          Expanded(
              flex: 4,
              //ahora aqui usaremos las columnas, esto nos ayudara a que dentro de
              //cada Row se puedan encimar container uno por encima del otro
              child: Column(children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Productos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: const Text('Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)) //
                      ),
                ),
                Expanded(child: _Producto())
              ])),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: _Fecha(),
                  ),
                  Expanded(child: _Cantidad())
                ],
              ))
        ],
      ),
    );
  }
}

//Status Bar
class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,

        ///transparent
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xfffcbc5c), size: 40),
        title: const Text("GrandPet",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff7b333f), fontSize: 40)),
        //title: Image.asset('assets/Logo.png', alignment: FractionalOffset.topCenter, height: 50,),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.help,
              size: 40,
            ),
            onPressed: () {},
          ),
        ]);
  }
}

//CODIGO DE NOÉ
//ESTE CODIGO ES PARA LA VENTANA EMERGENTE
/*class VentanaEmergente extends StatelessWidget {
  Widget build(BuildContext context) {
    
  }
}*/

VentanaEmergente(BuildContext context) {
  TextEditingController controladorPersonalizado = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Escribe la cantidad'),
          content: TextField(
            controller: controladorPersonalizado,
          ),
          actions: [
            MaterialButton(
                elevation: 8.5, child: Text("Cancelar"), onPressed: () => {}),
            MaterialButton(
              elevation: 5.0,
              child: Text("Continuar"),
              onPressed: () => {
                Navigator.of(context)
                    .pop(controladorPersonalizado.text.toString()),
                print('$controladorPersonalizado')
              },
            )
          ],
        );
      });
}

//TERMINA CODIGO DE NOE

//Status Comisiones
