// Importaciones necesarias para el funcionamiento del widget.
import 'package:flutter/material.dart'; // Proporciona widgets y herramientas para construir interfaces de usuario.
import 'package:go_router/go_router.dart';
import 'package:pruevas_widget/presentation/router/routes/app_router.dart';
import 'package:pruevas_widget/presentation/widget/reactive_text_field_custom.dart'; // Importa un widget personalizado para campos de texto reactivos.
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Biblioteca para manejar formularios reactivos en Flutter.

// Definición de la clase PageLogin, que extiende StatelessWidget para crear una interfaz de usuario inmutable.
class PageLogin extends StatelessWidget {
  // Declaración de un formulario reactivo con dos campos: 'email' y 'password'.
  // Cada campo tiene validadores que aseguran que el valor no esté vacío.
  final form = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]), // Campo de email obligatorio.
    'password': FormControl<String>(validators: [Validators.required]), // Campo de contraseña obligatorio.
  });

  Future<void> verificarCredenciales(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final savedEmail = prefs.getString('email');
  final savedPassword = prefs.getString('password');

  final email = form.control('email').value;
  final password = form.control('password').value;

  if (email == savedEmail && password == savedPassword) {
    // Si coinciden, muestra un mensaje de advertencia y navega a la pantalla de inicio
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Advertencia: Las credenciales coinciden con las registradas.'),
      ),
    );
    context.go(AppRouter.home);
  } else {
    // Si no coinciden, muestra un mensaje de error
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error: Credenciales incorrectas.'),
      ),
    );
  }
}

  // Constructor de la clase PageLogin.
  PageLogin({super.key});

  // Método build que define la interfaz de usuario del widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura principal de la pantalla.
      body: Container(
        width: double.infinity, // Ocupa todo el ancho disponible.
        height: double.infinity, // Ocupa toda la altura disponible.
        decoration: const BoxDecoration(
          // Fondo con un degradado de colores.
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Inicio del degradado en la parte superior.
            end: Alignment.bottomCenter, // Fin del degradado en la parte inferior.
            colors: [
              Color(0xFFFFE7C1), // Color 1.
              Color(0xFFF2EEEB), // Color 2.
              Color(0xFFE8A8F2), // Color 3.
              Color(0xFFE1DDC9), // Color 4.
            ],
          ),
        ),
        child: Center(
          // Centra el contenido en la pantalla.
          child: Padding(
            padding: const EdgeInsets.all(20), // Margen interno de 20 píxeles.
            child: ReactiveForm(
              formGroup: form, // Asocia el formulario reactivo al widget.
              child: SingleChildScrollView(
                // Permite desplazarse si el contenido excede el tamaño de la pantalla.
                child: Column(
                  // Organiza los widgets en una columna.
                  children: [
                    // Campo de texto reactivo personalizado para el email.
                    ReactiveTextFieldCustom(
                      formControlName: 'email', // Nombre del campo en el formulario.
                      label: 'Email', // Etiqueta del campo.
                      keyboardType: TextInputType.emailAddress, // Tipo de teclado para email.
                      validationMessage: {
                        'required': (error) => 'el campo es obligatorio', // Mensaje de error si está vacío.
                      },
                    ),
                    // Campo de texto reactivo personalizado para la contraseña.
                    ReactiveTextFieldCustom(
                      formControlName: 'password', // Nombre del campo en el formulario.
                      label: 'Password', // Etiqueta del campo.
                      keyboardType: TextInputType.visiblePassword, // Tipo de teclado para contraseñas.
                      isPassword: true, // Indica que es un campo de contraseña.
                      validationMessage: {
                        'required': (error) => 'el campo es obligatorio', // Mensaje de error si está vacío.
                      },
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        TextButton(
                          onPressed: () {
                            // Navega a la pantalla de registro.
                            context.go(AppRouter.register);
                          },
                          child: const Text('Registrarse'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),

                    MaterialButton(
                      onPressed: () => verificarCredenciales(context), // Llama a la función iniciarSesion con el contexto.
                      color: const Color(0xFFE8A8F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Ingresar'),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}