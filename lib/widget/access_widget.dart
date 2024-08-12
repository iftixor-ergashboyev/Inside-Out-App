import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inside_out/page/onboarding/onboarding.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.activeOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(image: AssetImage('assets/icon/access_icon.png'), fit: BoxFit.cover)
              ),
            ),
          ],
        ),
      ),
    );
  }
}