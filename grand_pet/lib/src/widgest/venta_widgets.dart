import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_pet/src/pages/home.dart';
import 'package:grand_pet/src/pages/ventas_page.dart';

CollectionReference ventas = FirebaseFirestore.instance.collection("Ventas");

var fecha = DateTime.now();
var lote = '';
var usuario = 'Rodolfo';
var estado = true;
String tipoProducto = '';

class HederVentas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
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
            ]
          )
        )
      )
    );
  }
}
List<String> _controller = ['holamundo'];
Widget Lote() {
  TextEditingController texto = TextEditingController();
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: texto,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xfffcbc5c),
        decoration: const InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          labelText: 'Lote',
        ),

      ),
    );
  });
}

class BotonGuardar extends StatelessWidget {
  const BotonGuardar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
      return FloatingActionButton(
        heroTag: "guardar",
        onPressed: () async{
          //_controller.forEach((String controll) => print(controll));
          //for (var i = 0; i < 6; i++)
          
            /*await ventas.add({
              'Usuario': usuario,//1
              'Lote': lote,
              'Producto': tipoProducto,//1
              'Fecha': fecha,//1
              'estado': estado
            });.then((value) => print("Venta Agregada Exitosamente"));*/
          
          Navigator.pushNamed(context, HomePage.id);
          //_controller.removeWhere((item) => item.length == 1);
          //print(_controller.asMap());

        },
        child: const Icon(Icons.save),
        backgroundColor: Colors.blue,
      );
    }
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
                onPressed: () => {
                      if (contador == 0)
                        {VentanaEmergente(context), tipoProducto = 'Premium'}
                      else
                        {Alerta(context)}
                    },
                child: const Text('Premium')),
            TextButton(
                onPressed: () => {
                      if (contador == 0)
                        {
                          VentanaEmergente(context),
                          tipoProducto = 'SuperPremium'
                        }
                      else
                        {Alerta(context)}
                    },
                child: const Text('Super premium')),
            TextButton(
                onPressed: () => {
                      if (contador == 0)
                        {VentanaEmergente(context), tipoProducto = 'Olistico'}
                      else
                        {Alerta(context)}
                    },
                child: const Text('Holistico'))
          ],
        );
      });
}

Alerta(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Por Favor Completa El Registro'),
          actions: [
            TextButton(
                onPressed: () =>
                    {Navigator.pop(context), Navigator.pop(context)},
                child: const Text('Aceptar'))
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