import 'package:flutter/material.dart';

class Inputscreen extends StatefulWidget {
  const Inputscreen({super.key});

  @override
  State<Inputscreen> createState() => _InputscreenState();
}

class _InputscreenState extends State<Inputscreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Entradas'),
    );
  }
}
