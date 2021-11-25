import 'package:flutter/material.dart';
import 'package:grand_pet/src/widgest/custom_widgets.dart';
import 'package:grand_pet/ui/input_decorations.dart';
//import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget{
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Center(
          child: Center(
            child: Column(
              children:[
                Flexible(
                  child: (
                    FondoPrincipal() 
                  ),
                ),
                const SizedBox(height: 30.0,),
                userTextField(),
                const SizedBox(height: 25.0,),
                passwordTextField(),
                const SizedBox(height: 25.0,),
                bottomLogin(),
                //Flexible(child:InicioSesion())
                
                /*ChangeNotifierProvider(
                  create: ( _ ) => LoginFormProvider(),
                ),*/
                /*_LoginForm(),
                const SizedBox(height: 50),
                const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 50),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final LoginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //Mantener la referencia del key
        //key: LoginForm.formkey,
        
        child: Column(
          children: [
            const SizedBox(height: 15,),
            TextField(
              
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'rodovargas600@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
            ),
            const SizedBox(height: 30,),

            TextField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outlined
              ),
            ),
            const SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                )
              ),
              onPressed: () => {
                //TODO: Login form

              }
            )

          ],
        ),
      ),
    );
  }
}*/
