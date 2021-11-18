import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/venta_widgets.dart';

class VentasPage extends StatefulWidget {
  static String id = 'RegistroVenta_page';
  @override
  _reg_venta_PageState createState() => _reg_venta_PageState();
}

//variables
final _lista = ['Premium', 'Super premium', 'Holistico'];
String _muestra = 'Opciones';

class _reg_venta_PageState extends State<VentasPage> {
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: (HederVentas()),
              ),
              Row(
                children: const [Text("Productos: ",textAlign: TextAlign.center,style: TextStyle(color: Color(0xfffcbc5c),fontSize: 25,)),
                Spacer(),
                ],
              ),

              Flexible(
                flex: 2,
                child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Producto A')),
                  ),
                  Lote(),
                ],
                ),
              ),
              Row(children: const [
                Fotografia(),
                Spacer(),
                Agregar(),
                Spacer(),
                Guardar()

              ],
              ),
            ]
          )
        )
      )
    );
  }
}

class Guardar extends StatelessWidget {
  const Guardar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "guardar",
      onPressed: () => {

      },
      child: const Icon(Icons.save),
      backgroundColor: Colors.blue,
    );
  }
}

class Agregar extends StatelessWidget {
  const Agregar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "agregar",
      onPressed: () => {
        VentanaEmergente(context)
        
      },
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

            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Cantidad de productos', style: TextStyle(color: Colors.redAccent, ),textAlign: TextAlign.center,),
                    content: TextField(
                      
                      ),
                    actions: [
                      
                    ],
                  )
                );
              },
              child:const Text('Premium'),
            ),
            
            MaterialButton(
                elevation: 8.5, child: const Text("Cancelar"), onPressed: () => {}),
            MaterialButton(
              elevation: 5.0,
              child: const Text("Continuar"),
              onPressed: () => {
                Navigator.of(context)
                    .pop(controladorPersonalizado.text.toString()),
                print('esto es lo que escribes: $controladorPersonalizado')
              },
            )
          ],
        );
      });
}



/////////////////
Ventana(BuildContext context) {
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: const Text('Title'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 3; i++)
            ListTile(
              title: Text(
                'option $i',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
              ),
              leading: Radio(
                value: i,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ACTION 1'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ACTION 2'),
        ),
      ],
    );

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            showDialog<void>(context: context, builder: (context) => dialog);
          },
          child: const Text("SHOW DIALOG"),
        ),
      ),
    );
  }
}