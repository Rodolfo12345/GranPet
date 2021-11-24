import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';

CollectionReference ventas = FirebaseFirestore.instance.collection("Ventas");
///Obtencion de texto
final premium = TextEditingController();
final superPremium = TextEditingController();
final olistico = TextEditingController();

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
                )
              )
            ]
          )
        )
      )
    );
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

Widget Guardar() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return FloatingActionButton(
        child: const Icon(Icons.upload_file),
        backgroundColor: Colors.blue,
        onPressed: () async {
          prem = premium.text;
          sup = superPremium.text;
          oli = olistico.text;

          print('La cantidad de premium es: $prem');
          print('La cantidad de superPremium es: $sup');
          print('La cantidad de olistico es: $oli');

          //Navigator.pushNamed(context, HomePage.id);

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

class BotonGuardar extends StatelessWidget {
  const BotonGuardar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "guardar",
      onPressed: () => {},
      child: const Icon(Icons.save),
      backgroundColor: Colors.blue,
    );
  }
}

class AgregarRegistro extends StatelessWidget {
  const AgregarRegistro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "agregar",
      onPressed: () => {VentanaEmergente2(context)},
      child: const Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}

class Fotografia extends StatelessWidget {
  const Fotografia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "foto",
      onPressed: () => {},
      child: const Icon(Icons.add_a_photo),
      backgroundColor: Colors.blue,
    );
  }
}

VentanaEmergente(BuildContext context) {
  TextEditingController controladorPersonalizado = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Escribe la cantidad'),
          content: TextField(
            controller: controladorPersonalizado,
            keyboardType: TextInputType.number,
          ),
          actions: [
            MaterialButton(
                elevation: 8.5,
                child: const Text("Cancelar"),
                onPressed: () => {}),
            MaterialButton(
              elevation: 5.0,
              child: const Text("Continuar"),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VentasPage(controladorPersonalizado.text))),
                // print(controladorPersonalizado.text),
                // Navigator.of(context)
                //     .pop(controladorPersonalizado.text.toString()),
              },
            )
          ],
        );
      });
}
VentanaEmergente2(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¿Que producto deseas registrar?'),
          actions: [
            TextButton(
                onPressed: () => {VentanaEmergente(context)},
                child: const Text('Premium')),
            TextButton(
                onPressed: () => {VentanaEmergente(context)},
                child: const Text('Super premium')),
            TextButton(
                onPressed: () => {VentanaEmergente(context)},
                child: const Text('Holistico'))
          ],
        );
      });
}
//AQUI TERMINA EL CODIGO QUE GENERA LOS BOTONES Y CREA LAS VENTANAS EMERGENTES


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
