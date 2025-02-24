import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CircleAvatar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homescreen'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Hello, World!'),
      ),
    );
  }
}