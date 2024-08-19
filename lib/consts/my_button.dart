import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color; // Qo'shimcha rang parametrini e'lon qilish

  const MyButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = CupertinoColors.white, // Rangni default qiymat bilan belgilash
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: color, // Rangni qo'llash
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Inside Out',
                color: CupertinoColors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
