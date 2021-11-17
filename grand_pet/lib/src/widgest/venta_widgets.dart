import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';

CollectionReference ventas = FirebaseFirestore.instance.collection("Ventas");

///Obtencion de texto
final premium = TextEditingController();
final superPremium = TextEditingController();
final olistico = TextEditingController();

//Variables globales
var id = '1';
var fecha = DateTime.now();
var usuario = 'Rodolfo';
var lote = '999999';
var estado = true;

String prem = '';
String sup = '';
String oli = '';

class HederVentas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Padding(
            /*Container*/
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    color: const Color(0xfffcbc5c),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(children: [
                  ListTile(
                    leading: const Icon(
                      Icons.chevron_left_sharp,
                      size: 40,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Volver",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                  const Text('Registrar Ventas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ))
                ]))));
  }
}

Widget Lote() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xfffcbc5c),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          labelText: 'Lote',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

Widget Cantidad() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xfffcbc5c),
        decoration: const InputDecoration(
          icon: Icon(Icons.now_widgets_outlined),
          labelText: 'Cantidad',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

Widget Guardar() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return FloatingActionButton(
        child: Icon(Icons.upload_file),
        backgroundColor: Colors.blue,
        onPressed: () async {
          prem = premium.text;
          sup = superPremium.text;
          oli = olistico.text;

          print('La cantidad de premium es: $prem');
          print('La cantidad de superPremium es: $sup');
          print('La cantidad de olistico es: $oli');

          //Navigator.pushNamed(context, HomePage.id);
          //Insertar venta

          await ventas.add({
            //'idUsuario': id,
            'Fecha': fecha,
            'Usuario': usuario,
            'Lote': lote,
            'Premium': prem,
            'Super premium': sup,
            'Holistico': oli,
            'estado': estado
          }).then((value) => print("Venta Agregada Exitosamente"));
        });
  });
}

Widget Premium() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: premium,
        keyboardType: TextInputType.number,
        cursorColor: const Color(0xfffcbc5c),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          labelText: 'Premium',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

Widget Olistico() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: olistico,
        keyboardType: TextInputType.number,
        cursorColor: const Color(0xfffcbc5c),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          labelText: 'Olistico',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

Widget SuperPremium() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: superPremium,
        keyboardType: TextInputType.number,
        cursorColor: const Color(0xfffcbc5c),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          labelText: 'SuperPremium',
        ),
        onChanged: (value) {},
      ),
    );
  });
}



//Registra ventas
/*if(password == '1234')
{
  Navigator.pushNamed(context, HomePage.id);
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
