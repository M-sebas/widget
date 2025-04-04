import 'package:shared_preferences/shared_preferences.dart';


/* 
  Clase AuthServices
  Esta clase se encarga de guardar los datos del usuario, obtener los datos del usuario, cerrar sesion y verificar si el usuario esta logueado
*/

class AuthServices {
  // guardar datos de usuario
  static Future<bool> registre(String email, String nombre,String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('nombre', nombre);
    await prefs.setBool('isRegistre', true);
    
    return true;
  }

  

static Future<bool> validarLogin(String correo, String password) async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? pass = prefs.getString('password');
    if (email == correo && pass == password) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> usuarioRegistre() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isRegistre') ?? false;
  }
  // cerrar sesion
  static Future<void> loguot() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', false);
  }

  
}