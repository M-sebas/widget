import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruevas_widget/infrastructure/local_storage/shared_prefences.dart';
import 'package:pruevas_widget/presentation/router/routes/app_router.dart';
import 'package:pruevas_widget/presentation/widget/reactive_text_field_custom.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Clase principal que representa la pantalla de registro y login
class PageLoginRegistre extends StatefulWidget {
  const PageLoginRegistre({super.key});

  @override
  State<PageLoginRegistre> createState() => _PageLoginRegistreState();
}

class _PageLoginRegistreState extends State<PageLoginRegistre> {
  // Definición del formulario con sus controles y validaciones
  final form = FormGroup({
    'nombre': FormControl<String>(
        validators: [Validators.required]), // Campo obligatorio
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email
    ]), // Campo obligatorio y formato de email
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6)
    ]), // Campo obligatorio y longitud mínima de 6
    'telefono': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(10)
    ]), // Campo obligatorio y longitud mínima de 10
  });

  void registre(BuildContext _) async {
    if (form.valid) {
      // Obtén los valores de los campos del formulario y guárdalos en variables

      try {
        // para el manejo de errores

        final String nombre = form.control('nombre').value as String;
        final String email = form.control('email').value as String;
        final String telefono = form.control('telefono').value as String;
        final String password = form.control('password').value as String;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('nombre', nombre);
        await prefs.setString('email', email);
        await prefs.setString('telefono', telefono);
        await prefs.setString('password', password);
        await prefs.setBool(
            'isRegistre', true); // 🟢 Guardamos que está logueado

        // Aquí puedes usar las variables como desees
        await AuthServices.registre(email, nombre, password, isRegistre: true);

        // Navegar a la pantalla de inicio después de registrar al usuario
        context.go(AppRouter.home);
      } catch (e) {
        // Manejo de errores en caso de que algo falle
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al registrar el usuario.'),
          ),
        );
      }
    } else {
      // Si el formulario no es válido, marca todos los campos como "tocados" para mostrar los errores
      form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura principal de la pantalla
      body: Container(
        width: double.infinity, // Ocupa todo el ancho disponible
        height: double.infinity, // Ocupa todo el alto disponible
        decoration: const BoxDecoration(
          // Fondo con un degradado de colores
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFE7C1),
                Color(0xFFF2EEEB),
                Color(0xFFE8A8F2),
                Color(0xFFE1DDC9)
              ]),
        ),
        child: Padding(
          padding:
              const EdgeInsets.all(20), // Espaciado alrededor del contenido
          child: ReactiveForm(
              formGroup: form, // Asocia el formulario definido al widget
              child: SingleChildScrollView(
                // Permite desplazarse si el contenido es más grande que la pantalla
                child: Column(
                  children: [
                    // Campo para el nombre completo
                    ReactiveTextFieldCustom(
                        formControlName:
                            'nombre', // Nombre del control en el formulario
                        label: 'Nombre completo', // Etiqueta del campo
                        keyboardType: TextInputType.name, // Tipo de teclado
                        validationMessage: {
                          'required': (error) =>
                              'el campo es obligatorio', // Mensaje de error si está vacío
                        }),

                    // Campo para el correo electrónico
                    ReactiveTextFieldCustom(
                        formControlName:
                            'email', // Nombre del control en el formulario
                        label: 'Email', // Etiqueta del campo
                        keyboardType: TextInputType
                            .emailAddress, // Tipo de teclado para email
                        validationMessage: {
                          'required': (error) =>
                              'el campo es obligatorio', // Mensaje de error si está vacío
                          'email': (error) =>
                              'el email no es valido', // Mensaje de error si el formato no es válido
                        }),

                    // Campo para el teléfono
                    ReactiveTextFieldCustom(
                      formControlName:
                          'telefono', // Nombre del control en el formulario
                      label: 'Telefono', // Etiqueta del campo
                      keyboardType: TextInputType
                          .phone, // Tipo de teclado para números de teléfono
                      validationMessage: {
                        'required': (error) =>
                            'el campo es obligatorio', // Mensaje de error si está vacío
                        'minlength': (error) =>
                            'el telefono debe tener al menos 10 caracteres', // Mensaje de error si no tiene 10 caracteres
                      },
                    ),

                    // Campo para la contraseña
                    ReactiveTextFieldCustom(
                        formControlName:
                            'password', // Nombre del control en el formulario
                        label: 'Password', // Etiqueta del campo
                        keyboardType: TextInputType
                            .visiblePassword, // Tipo de teclado para contraseñas
                        isPassword:
                            true, // Oculta el texto para mayor seguridad
                        validationMessage: {
                          'required': (error) =>
                              'el campo es obligatorio', // Mensaje de error si está vacío
                          'minlength': (error) =>
                              'la contraseña debe tener al menos 6 caracteres', // Mensaje de error si no tiene 6 caracteres
                        }),

                    const SizedBox(
                        height: 18), // Espaciado entre los campos y el botón

                    // Botón para enviar el formulario
                    ElevatedButton(
                        onPressed: () =>
                            registre(context), // Llama a la función de registro
                        child: const Text('enviar')) // Texto del botón
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
