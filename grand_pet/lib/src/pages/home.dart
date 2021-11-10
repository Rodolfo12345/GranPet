import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';
import 'package:grand_pet/src/widgest/home_widgest.dart';

class HomePage extends StatefulWidget{
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

///////////////Variables////////////

class _HomePageState extends State<HomePage>{

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
///////////////////////Bar Navegation///////////////
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: Colors.transparent,///transparent
              bottomOpacity: 0.0,
              elevation: 0.0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Color(0xfffcbc5c), size: 40),
              title: Image.asset('assets/Logo.png', alignment: FractionalOffset.topCenter, height: 50,), 

            actions:[
              IconButton(
                icon: const Icon(Icons.help,size: 40,),
                onPressed: () {},
              ),

            ]

            ),
        ),
////////////////Menu Lateral/////////////////////////
        drawer: Barra_lateral(),

/////////////////Status Navegacion///////////////////

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on,size: 30),
              label: 'Comisiones',
              backgroundColor: Color(0xff7b333f),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag_rounded,size: 30),
              label: 'Meta',
              backgroundColor: Color(0xff7b333f),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add,size: 30),
              label: 'Agregar Venta',
              backgroundColor: Color(0xff7b333f),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,size: 30),
              label: 'Settings',
              backgroundColor: Color(0xff7b333f),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          //onTap: _onItemTapped,


          onTap: (_selectedIndex) {
            setState(() 
              {
                if(_selectedIndex == 2)
                {
                  Navigator.pushNamed(context, VentasPage.id);
                }

                
              }
            );
          },



        ),

//////////<Cuerpo>////////////

        body: Center(
          child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Spacer(),
                  Text("Comisiones: ", textAlign: TextAlign.center, style: 
                    TextStyle(
                      color: Color(0xff7b333f), 
                      fontSize: 25,
                    ),
                  ),
                  Spacer(flex: 6),
                  Text("Nivel: ",textAlign: TextAlign.center, style: 
                    TextStyle(
                      color: Color(0xff7b333f), 
                      fontSize: 25, 
                    ),
                  ),
                  Spacer(flex: 3,),

                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Spacer(),
                  Expanded(
                    child:Image(
                      image: ExactAssetImage('assets/Moneda.gif'),
                      height: 30,
                    ),
                  ),
                  Spacer(flex: 1),
                  Text("300",textAlign: TextAlign.center, style: TextStyle(
                    color: Color(0xfffcbc5c), 
                    fontSize: 25,
                    ),
                  ),
                  Spacer(flex: 4),
                  Text("Principiante",textAlign: TextAlign.center, style: TextStyle(
                    color: Color(0xfffcbc5c), 
                    fontSize: 25,
 
                    ),
                  ),
                  Spacer(),

                ],
              ),

              const Text("Historial de Ventas", 
                textAlign: TextAlign.center, style: TextStyle(
                  color: Color(0xff7b333f), 
                  fontSize: 30,
                  decoration: 
                    TextDecoration.underline, 
                    decorationThickness: 2.5,//grosor del subrayado
                    height: 2,  
                ),
              ),

              Expanded(
                child: (
                  PaddinHistorial()
                ),
              ),


              
            ],
          ),
        ),
      ),
    );
  }
}