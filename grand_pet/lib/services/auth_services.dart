import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl =
      'identitytoolkit.googleapis.com'; //url del metodo de autenticacion
  final String _firebaseToken =
      'AIzaSyCr0WHBJIe8lGqoxwbF4A2CtFILXAXHdkI'; //token de acceso a la base de datos firebase
  //agregar usuarios
  Future<String?> createUser(String email, String password) async {
    //creamos la informacion del post
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };
    //creamos el url
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    //disparamos la peticion http //ojo, siempre regresa una respuesta
    final resp = await http.post(url, body: json.encode(authData));
    //decodificacion de la respuesta
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    //verificamos la respuesta
    print( decodedResp );

  }
}

////
class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }
  bool isValidForm() {

    print(formKey.currentState?.validate());

    print('$email - $password');

    return formKey.currentState?.validate() ?
  }
}
