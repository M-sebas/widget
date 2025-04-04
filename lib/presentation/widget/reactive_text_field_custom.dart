import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveTextFieldCustom extends StatefulWidget {
  final String formControlName;
  final String label;
  final TextInputType keyboardType;
  final bool isPassword;
  final Map<String, String Function(Object)> validationMessage;
  const ReactiveTextFieldCustom({
    super.key,
    required this.formControlName,
    required this.label,
    required this.keyboardType,
    required this.validationMessage,
    this.isPassword = false,
  });

  @override
  State<ReactiveTextFieldCustom> createState() =>
      _ReactiveTextFieldCustomState();
}

class _ReactiveTextFieldCustomState extends State<ReactiveTextFieldCustom> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReactiveTextField(
            formControlName: widget.formControlName,
            decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _obscureText : false,
            validationMessages: widget.validationMessage,
          ),
          if (widget.isPassword)
            Row(
              children: [
                Checkbox(
                  value: !_obscureText,
                  onChanged: (bool? value) {
                    setState(() {
                      _obscureText = !value!;
                    });
                  },
                ),
                const Text('mostrar contraseña'),
              ],
            ),
        ],
      ),
    );
  }
}
