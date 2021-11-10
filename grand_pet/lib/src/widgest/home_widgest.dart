import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:grand_pet/src/pages/perfil_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference administradores = FirebaseFirestore.instance.collection("Administradores");
CollectionReference ventas = FirebaseFirestore.instance.collection("Ventas");

class Barra_lateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xfffcbc5c),
        child: Column(
          children:[
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: const CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage("assets/Login.png"),
      
                //child: Text('Usuario',style: TextStyle(fontSize: 50),),
              ),
            ),
            
            Flexible(
              child: ListView(
                children: [
                  ListTile (
                    leading: Icon(Icons.people),
                    title: Text('Perfil', ),
                    onTap: (){
                      Navigator.pushNamed(context, PerfilPage.id);
                    },
                  ),
                ],
              ),
            ),


            const ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.white, size: 35,),
              title: Text('Modo Oscuro', style: TextStyle(color: Colors.white, fontSize: 25),),
              
            ),
            const ListTile(
              title: Text('Cerra Sesion', textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white, 
                fontSize: 30,
                decoration: 
                  TextDecoration.underline, 
                  decorationThickness: 2.5,//grosor del subrayado
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

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(  
        image:DecorationImage(
          image: ExactAssetImage('assets/Logo.png'),
          
          colorFilter: ColorFilter.mode(Colors.white,  BlendMode.softLight, ),/*BlendMode.softLight*/
          fit: BoxFit.contain,
        ) 
      ),
    );
  }
}
///<Historial de Ventas>///
class PaddinHistorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(/*Container*/
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),

          //de aqui en adelante tiro codigo el master Noé
          child: SliderList(),
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
          Expanded(
            flex: 2,
              child: Icon(Icons.monetization_on, color: Colors.white, size: 50,)
          ),
          Expanded(
            flex: 4,
              //ahora aqui usaremos las columnas, esto nos ayudara a que dentro de
              //cada Row se puedan encimar container uno por encima del otro
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text('Producto', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                      ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                        child: Nombre()//Text('Premium', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500))//
                    ),
                  )
                ]
              )
          ),
          Expanded(
            flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                        child: Text('15/oct/2021', style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),)
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                        child: Text('Cantidad: 16 sacos', style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w400),)
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
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
            return Text("Usuario: ${data['Premium']}");
          }
          return const Text("Cargando");
      },
    );
  }
}
