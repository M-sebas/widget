import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Formurarios extends StatefulWidget {
  Formurarios({super.key});

  final _formkey = GlobalKey<FormState>();
  

  @override
  State<Formurarios> createState() => _FormurariosState();
   String nombre = '';

  void submit() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState!.save();
  }
}

class _FormurariosState extends State<Formurarios> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un valor';
              }
              return null;
            },
            onSaved: (newValue) {
              widget.nombre = newValue!;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: 'Nombre',
              hintText: 'Ingrese su nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}