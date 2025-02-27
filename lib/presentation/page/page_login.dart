import 'package:flutter/material.dart';
import 'package:pruevas_widget/presentation/widget/witget_form.dart';
import 'package:sizer/sizer.dart';

class  PageLogin extends StatelessWidget {
  const  PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(50),
        alignment: Alignment.center,
        
        width: 100.h,
        height: 100.h,

        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color: Colors.blue ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('hola bebe', style: TextStyle(fontSize: 20.sp, color: Colors.white),),
          const SizedBox(height: 20,),
         Formurarios() 
        ],),
      ),
    );
  }
}