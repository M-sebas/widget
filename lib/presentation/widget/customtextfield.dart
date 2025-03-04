import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
   

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const CustomTextfield({super.key, required this.label, required this.controller, this.isPassword = false, required this.hintText});


  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hintText,
      ),
    );
  }
}