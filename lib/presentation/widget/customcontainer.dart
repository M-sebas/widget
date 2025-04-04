import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';




/*este va ser el estilo de las pantallas de inicio de seccion y registro.
por eso lo isimos reutilisable 
 */
class Customcontainer extends StatelessWidget {

  final Widget child;
  const Customcontainer({super.key, required this.child});

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
                
        width: 35.h,
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color: Colors.blue ),
        child: child,
      ),
    );
  }
}