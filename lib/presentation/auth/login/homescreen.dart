import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruevas_widget/infrastructure/local_storage/shared_prefences.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homescreen'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(children:[ 
          const Text('Hello, World!'),
          
          ElevatedButton(onPressed: () {
             AuthServices.loguot();
            context.go('/login');
          }, child: const Text('Cerrar sesion')),
          const SizedBox(height: 20,),


          ]),
      ),
    );
  }
}