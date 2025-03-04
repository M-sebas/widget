import 'package:flutter/material.dart';




/*este va ser el estilo de las pantallas de inicio de seccion y registro.
por eso lo isimos reutilisable 
 */
class Customcontainer extends StatelessWidget {

  final Widget child;
  const Customcontainer({super.key, required this.child});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
              
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(12),
        color: Colors.blue ),
      child: child,
    );
  }
}