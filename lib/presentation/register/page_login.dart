
import 'package:flutter/material.dart';
import 'package:pruevas_widget/presentation/widget/customtextfield.dart';

class  PageLogin extends StatefulWidget {
    const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(50),
                  
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextfield(
                label: 'Correo', 
                controller: emailController,
                 hintText: 'Ingrese su correo',)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
    }
}