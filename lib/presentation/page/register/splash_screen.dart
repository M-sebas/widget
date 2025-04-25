import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pruevas_widget/presentation/router/routes/app_router.dart';

/*
el SplashScreen es la pantalla de carga que se muestra al inicio de la aplicacion su funcion es verificar quel
  usuario ya esta registrado o no, si el usuario ya esta registrado lo redirige a la pantalla principal
  y si no lo redirige a la pantalla de registro.
 */

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Verificar si el usuario ya está registrado
    _checkRegistration(context);

    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Indicador de carga mientras se verifica
      ),
    );
  }

  // esta va ser la funcion asincrona que verifica si el usuario ya esta registrado o no

  Future<void> _checkRegistration(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final bool isRegistre = prefs.getBool('isRegistre') ?? false;

    // Si el usuario ya está registrado, redirigir a la pantalla principal
    if (isRegistre) {
      context.go(AppRouter.home); // Ir a la pantalla principal
    } else {
      // Si el usuario no está registrado, redirigir a la pantalla de registro
      context.go(AppRouter.register); // Ir a la pantalla de registro
    }
  }
}
