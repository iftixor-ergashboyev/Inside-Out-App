import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sadness extends StatefulWidget {
  const Sadness({super.key});

  @override
  State<Sadness> createState() => _SadnessState();
}

class _SadnessState extends State<Sadness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.activeBlue,
    );
  }
}
