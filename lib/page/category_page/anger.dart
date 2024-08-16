import 'package:flutter/material.dart';

class Anger extends StatefulWidget {
  const Anger({super.key});

  @override
  State<Anger> createState() => _AngerState();
}

class _AngerState extends State<Anger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
