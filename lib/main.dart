import 'package:flutter/material.dart';
import 'package:inside_out/page/onboarding/access.dart';
import 'package:inside_out/test.dart';

void main() {
  runApp(const InsideOut());
}
class InsideOut extends StatelessWidget {
  const InsideOut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: Access(),
    );
  }
}
