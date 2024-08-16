import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Disgust extends StatefulWidget {
  const Disgust({super.key});

  @override
  State<Disgust> createState() => _DisgustState();
}

class _DisgustState extends State<Disgust> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.activeGreen,
    );
  }
}
